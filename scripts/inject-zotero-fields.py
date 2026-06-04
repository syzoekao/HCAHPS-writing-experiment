#!/usr/bin/env python3
"""
inject-zotero-fields.py — post-process a pandoc .docx so citation placeholder
tokens (@@ZCITE<n>@@) become live Zotero field codes
(ADDIN ZOTERO_ITEM CSL_CITATION {...}) that the Zotero Word plugin recognizes.

This is the "work directly with the pandoc Word file" path: no RTF/ODF Scan.
The field format is reverse-engineered from Zotero's Word integration, so it must
be validated in Word+Zotero (open the file, click Zotero "Refresh"). On first
interaction Zotero will ask which citation style to use, then format + a bibliography
via Add/Edit Bibliography; Refresh re-pulls from the live library via each item's URI.

Inputs:
  --docx   pandoc output containing @@ZCITE<n>@@ tokens
  --cites  JSON: {"libraryID":"5085299","citations":[ {"display":"...","items":[
             {"itemKey":"EP38DSPE","itemData":{...CSL-JSON...}} ]}, ... ]}
           citation n maps to token @@ZCITE<n>@@
  --out    output .docx

Run-splitting note: each token sits inside one <w:t>; we close that run, insert the
field runs, and reopen a plain run for the trailing text. Trailing text inherits the
paragraph style (fine for body text with no inline formatting).
"""
import argparse, json, random, string, shutil, zipfile, os, tempfile

def esc(s):  # XML text escape
    return s.replace("&","&amp;").replace("<","&lt;").replace(">","&gt;")

def rand_id(n=8):
    return "".join(random.choices(string.ascii_letters+string.digits, k=n))

def build_field(display, items, libid):
    citation_items = []
    for it in items:
        uri = f"http://zotero.org/users/{libid}/items/{it['itemKey']}"
        data = dict(it["itemData"])
        data["id"] = uri
        citation_items.append({"id": uri, "uris": [uri], "itemData": data})
    payload = {
        "citationID": rand_id(),
        "properties": {"formattedCitation": display, "plainCitation": display, "noteIndex": 0},
        "citationItems": citation_items,
        "schema": "https://github.com/citation-style-language/schema/raw/master/csl-citation.json",
    }
    instr = " ADDIN ZOTERO_ITEM CSL_CITATION " + json.dumps(payload, ensure_ascii=False) + " "
    return (
        '<w:r><w:fldChar w:fldCharType="begin"/></w:r>'
        f'<w:r><w:instrText xml:space="preserve">{esc(instr)}</w:instrText></w:r>'
        '<w:r><w:fldChar w:fldCharType="separate"/></w:r>'
        f'<w:r><w:t xml:space="preserve">{esc(display)}</w:t></w:r>'
        '<w:r><w:fldChar w:fldCharType="end"/></w:r>'
    )

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--docx", required=True)
    ap.add_argument("--cites", required=True)
    ap.add_argument("--out", required=True)
    a = ap.parse_args()

    cfg = json.load(open(a.cites, encoding="utf-8"))
    libid = cfg["libraryID"]

    tmp = tempfile.mkdtemp()
    with zipfile.ZipFile(a.docx) as z:
        z.extractall(tmp)
    docpath = os.path.join(tmp, "word", "document.xml")
    doc = open(docpath, encoding="utf-8").read()

    for n, c in enumerate(cfg["citations"]):
        token = f"ZZZCITE{n}ZZZ"
        if token not in doc:
            print(f"WARNING: {token} not found in document"); continue
        field = build_field(c["display"], c["items"], libid)
        repl = '</w:t></w:r>' + field + '<w:r><w:t xml:space="preserve">'
        doc = doc.replace(token, repl, 1)

    open(docpath, "w", encoding="utf-8").write(doc)

    # repackage
    if os.path.exists(a.out): os.remove(a.out)
    with zipfile.ZipFile(a.out, "w", zipfile.ZIP_DEFLATED) as z:
        for root, _, files in os.walk(tmp):
            for f in files:
                full = os.path.join(root, f)
                z.write(full, os.path.relpath(full, tmp))
    shutil.rmtree(tmp)
    print(f"Wrote {a.out} with {len(cfg['citations'])} Zotero field(s)")

if __name__ == "__main__":
    main()
