#!/usr/bin/env python3
"""
prepare-zotero-cites.py — first stage of the Zotero-live docx build.

Reads the pandoc markdown draft and replaces each [@citekey] citation with a
placeholder token (ZZZCITE<n>ZZZ), and emits a cites JSON pairing each token with
the Zotero item key(s) + CSL-JSON needed to build the field codes downstream
(inject-zotero-fields.py). Multi-key citations (e.g. [@a; @b]) become a single
multi-item citation.

Inputs:
  --draft    manuscript/draft.md
  --keymap   manuscript/zotero-item-keys.json  (citekey -> {itemKey,label}; libraryID)
  --csljson  CSL-JSON for references.bib (pandoc references.bib -t csljson)
Outputs:
  --out-md     token version of the draft (feed to pandoc, citations OFF)
  --out-cites  cites JSON for inject-zotero-fields.py
"""
import argparse, json, re, sys

def main():
    ap = argparse.ArgumentParser()
    for a in ("draft","keymap","csljson","out-md","out-cites"):
        ap.add_argument("--"+a, required=True)
    args = vars(ap.parse_args())

    km = json.load(open(args["keymap"], encoding="utf-8"))
    libid = km["_libraryID"]; kmap = km["map"]
    csl = {d["id"]: d for d in json.load(open(args["csljson"], encoding="utf-8"))}
    text = open(args["draft"], encoding="utf-8").read()

    cite_re = re.compile(r"\[[^\]]*@[^\]]*\]")
    key_re  = re.compile(r"@([A-Za-z0-9_]+)")
    citations = []
    missing = set()

    def itemdata(key):
        d = dict(csl.get(key, {"id": key, "title": key}))
        if not d.get("type"):
            d["type"] = "document"   # CSL requires a type; Zotero re-syncs on Refresh
        return d

    def repl(mo):
        n = len(citations)
        keys = key_re.findall(mo.group(0))
        items, labels = [], []
        for k in keys:
            info = kmap.get(k)
            if not info:
                missing.add(k); continue
            items.append({"itemKey": info["itemKey"], "itemData": itemdata(k)})
            labels.append(info.get("label", k))
        citations.append({"display": "(" + "; ".join(labels) + ")", "items": items})
        return f"ZZZCITE{n}ZZZ"

    out_md = cite_re.sub(repl, text)
    open(args["out_md"], "w", encoding="utf-8").write(out_md)
    json.dump({"libraryID": libid, "citations": citations},
              open(args["out_cites"], "w", encoding="utf-8"), ensure_ascii=False)

    print(f"Prepared {len(citations)} citation(s) -> tokens")
    if missing:
        print("ERROR: no item key for: " + ", ".join(sorted(missing)), file=sys.stderr)
        print("  -> add to the keymap JSON (regenerate via Zotero MCP), then rebuild.", file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()
