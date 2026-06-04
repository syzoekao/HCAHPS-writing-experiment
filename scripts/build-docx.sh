#!/usr/bin/env bash
# build-docx.sh — build manuscript/draft.docx with manuscript formatting
# (double-spaced black body, single-spaced title page, line numbers) AND live,
# refreshable Zotero citation fields (no RTF/ODF Scan needed).
#
# Pipeline:
#   1. references.bib -> CSL-JSON
#   2. draft.md [@key] citations -> placeholder tokens + cites JSON
#      (item keys from manuscript/zotero-item-keys.json)
#   3. pandoc tokens.md -> docx with the manuscript reference doc (no citeproc)
#   4. inject Zotero field codes at each token
#
# Open the result in Word, click Zotero > Refresh (pick AMA on first run), then
# Add/Edit Bibliography to insert the reference list. Run from the repo root.
set -euo pipefail
cd "$(dirname "$0")/.."

REF="$HOME/.pandoc/reference-manuscript.docx"
TMP="$(mktemp -d)"

pandoc references.bib -f bibtex -t csljson -o "$TMP/refs.csljson"

python3 scripts/prepare-zotero-cites.py \
  --draft manuscript/draft.md \
  --keymap manuscript/zotero-item-keys.json \
  --csljson "$TMP/refs.csljson" \
  --out-md "$TMP/draft-tokens.md" \
  --out-cites "$TMP/cites.json"

# -auto_identifiers: don't add per-heading bookmarks (Word shows them as gray "[" brackets)
pandoc "$TMP/draft-tokens.md" -o "$TMP/draft-nofields.docx" \
  --from markdown-auto_identifiers --to docx --reference-doc="$REF"

python3 scripts/inject-zotero-fields.py \
  --docx "$TMP/draft-nofields.docx" \
  --cites "$TMP/cites.json" \
  --out manuscript/draft.docx

rm -rf "$TMP"
echo "Built manuscript/draft.docx (manuscript format + live Zotero citation fields)"
