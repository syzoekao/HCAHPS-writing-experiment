# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project overview

This is a health economics research project studying HCAHPS (Hospital Consumer Assessment of Healthcare Providers and Systems) overall star ratings, comparing 2017 (pre-COVID baseline) to 2024 (post-pandemic stabilization). The primary analysis uses Stata. The manuscript targets *Health Affairs* (primary), with *JAMA Health Forum* and *Health Affairs Scholar* as alternates.

The central quantitative finding — and the paper's key contribution — is a **levels-vs-change asymmetry**: observable hospital, operational, and community factors explain ~24% of cross-sectional variation in star ratings but <6% of trajectory variation (2017→2024 change).

## Repository layout

- `stata/` — Stata analysis pipeline (all `.do` files; not modified by the writing experiment).
- `framing.md`, `reference-research.md` — top-level writing-context documents. **Always loaded as required reading before drafting.**
- `fig_tables.xlsx`, `framing_rs.docx` — figures/tables and a curated framing document, kept at root for visibility.
- `project info/` — auxiliary context files (e.g., notes for generative-AI tooling).
- `outdated/` — superseded versions kept for reference.
- `scripts/export-transcript.py` — exports Claude Code session JSONL into `transcripts/raw/` (verbatim) and `transcripts/readable/` (rendered markdown).
- `transcripts/` — audit trail of every Claude Code session.
- `experiment-readme.md`, `experiment-log.md` — overview and running journal of the writing experiment (see "Experiment audit trail" below).

## Stata do-files: what each does

The analysis pipeline (in `stata/`) runs in roughly this order:

1. **`stata/do.do`** — Data prep for hospital general info (`Hospital_General_Information.csv`) and ED timeliness (`Timely_and_Effective_Care-Hospital.csv`). Saves `generalinfo.dta` and `timeliness.dta`.

2. **`stata/do 1.do`** — Cleans the raw HCAHPS longitudinal file (`hcahps_all.dta`). Extracts overall star ratings across 23 release waves (date_id 1–23, mapping approximately Jan 2017 through 2024), then creates county-level maptile maps of ratings by year and the 2017→2024 difference. Uses `maptile` with the `county2014` geography.

3. **`stata/do 2.do`** — Processes IPUMS NHGIS ACS data to build county-level demographic covariates (age, race/ethnicity, foreign-born, education, poverty, income) for 2013–2017 and 2020–2024 five-year estimates. Saves `acsdata_mostrecent2017.dta` and `acsdata_mostrecent2024.dta`.

4. **`stata/hospitallevel_do.do`** — The main analysis file. Builds a hospital-level panel by:
   - Extracting the 10 HCAHPS sub-domain star ratings for 2017 (date_id=1) and 2024 (date_id=23) and reshaping to wide format
   - Merging in hospital general info, ED timeliness (both years), ZIP-to-county crosswalk, CDC PLACES disease burden, CMS Provider of Services total hospital counts, ACS demographics (both years), RUCA rural/urban classification, and hospital cost report (nurse salary/beds)
   - Constructing change variables (2024 minus 2017) for all covariates
   - Running the core OLS regressions with robust SEs: levels models for 2017 and 2024, and the change model; storing estimates with `estout` to `.txt` files

## Key variable conventions

- `patientsurveystarrating7` = Overall hospital rating star (the dependent variable)
- `patientsurveystarrating1–10` = 10 HCAHPS sub-domain star ratings (numbered by `encode` order; 7 = overall)
- `hosp_owner_c`: 1 = government, 2 = non-profit, 3 = for-profit
- `rural_urban`: 1 = urban (RUCA 1–3), 2 = large rural/micropolitan (4–6), 3 = small/isolated rural (7–10)
- `sample==1` flag: complete cases across all covariates used for regression (N ≈ 2,380)
- Date IDs: `date_id==1` = Q1 2017 release; `date_id==23` = most recent 2024 release

## Data paths

All data live in Windows OneDrive paths (`C:\Users\z0055u8k\OneDrive - Siemens Healthineers\...`) and are **not** accessible from this dev container. Global macros at the top of each do-file point to local directories; update these if re-running on a different machine.

## Scientific writing workflow

- `framing.md` — Working alignment document covering key findings, literature gap, policy implications, and open framing questions. **Read this before writing or editing any manuscript section.**
- `reference-research.md` — Reference notebook for managing citations; candidates are appended here for asynchronous review before importing to Zotero.
- The Zotero MCP integration (`mcp__zotero__*`) is available for reference management.
- Manuscript drafting uses the `outline`, `draft`, `self-review`, and `peer-review` skills.
- Convert `.md` files to `.docx` with: `pandoc <file>.md -o <file>.docx --from gfm --to docx`

## Experiment audit trail

This project doubles as a Claude-Code writing experiment. See `experiment-readme.md` for the full setup. Two operational reminders for any session:

- Use **stage-prefixed commits** (`outline:`, `draft:`, `self-review:`, `peer-review:`, `revise:`, `meta:`, `manual:`) so `git log` doubles as a provenance record.
- At session end, run `python3 scripts/export-transcript.py` to refresh `transcripts/`, then commit as `meta: export transcripts through <date>`.

## Scope boundaries (what this paper does NOT do)

- Does not analyze intra-pandemic dynamics (covered by Elliott et al. 2023)
- Does not model hospital fixed effects beyond the change-score specification
- Does not make causal claims — framing is associational and decomposition-based
- Does not critique HCAHPS Star Ratings methodology as primary content (Gettel 2024 covers this)
