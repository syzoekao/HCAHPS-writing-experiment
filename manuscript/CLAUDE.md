---
# -----------------------------------------------------------------------------
# Scientific writing project metadata
#
# The outliner and drafter read this frontmatter to drive their behavior.
# Mark any unknown field as `TBD` — agents accept TBD and proceed.
# Delete sections or fields that don't apply.
# -----------------------------------------------------------------------------

# Artifact being produced
artifact-type: manuscript   # manuscript | abstract | conference-abstract | grant | lay-summary | appendix | technical-report
article-type: Original Research           # e.g., "Original Research", "Brief Report", "Review", "Perspective"
target-journal: American Journal of Public Health         # e.g., "Value in Health", "JAMA", "NEJM" — leave TBD for conference abstracts
reporting-guideline: TBD (loosely follow STROBE)    # CHEERS 2022 | CONSORT 2010 | STROBE | PRISMA 2020 | TRIPOD | SPIRIT | COREQ | SRQR | STARD | or TBD

# Citation style (file stem under ~/.csl/ — drafter appends .csl)
# Ignored for conference-abstract (citations not permitted).
citation-style: ama         # ama | vancouver | apa | jama | nejm | ...

# Word and count budgets (if known)
word-limit:
  abstract: 180             # journal abstract, e.g., 250
  main-text: 3000            # tightened from AJPH 3,500 cap per analyst direction 2026-05-22
  specific-aims: TBD        # for grants (usually ~1 page)

# Conference-specific (fill in when artifact-type is conference-abstract; delete otherwise)
conference:
  name: TBD                 # e.g., "ISPOR 2026"
  location: TBD             # e.g., "Washington, DC, USA" (optional)
  category: TBD             # e.g., "Health Economics and Outcomes Research / Economic Evaluation"
  submission-type: TBD      # poster | oral | flash talk
  word-limit: TBD           # if the conference uses a word limit, e.g., 300
  character-limit: TBD      # if character-based; note "including spaces" or "excluding spaces" e.g., "2500 (including spaces)"

# Title of the paper (drafter uses for YAML title on page 1 of draft.md)
title: "Determinants of Hospital HCAHPS Star Ratings and Changes Over Time, 2017-2024"

# Authors, in order
authors:
  - name: "TBD"
    degrees: "TBD"          # e.g., "PhD", "PhD, MPH"
    affiliations: [1]       # indices into the affiliations list below
  # Additional authors:
  # - name: "..."
  #   degrees: "..."
  #   affiliations: [1, 2]

# Institutional affiliations, numbered (used for superscripts on the title page)
affiliations:
  - "TBD Department, TBD Institution, City, State, Country"
  # - "..."

# Corresponding author details (drafter places these on the title page)
corresponding-author:
  name: "TBD"
  degrees: "TBD"
  affiliation: "TBD"
  address: "TBD"
  email: "TBD"
  phone: "TBD"
---

# HCAHPS overall star ratings, 2017 vs 2024: what explains levels vs change

## Research question

Among U.S. hospitals reporting HCAHPS in both 2017 (pre-COVID baseline) and 2024 (post-pandemic stabilization), what hospital, operational, and community-level factors are associated with the overall star rating, and which of those factors explain the 2017→2024 *change* in rating? The paper foregrounds a levels-vs-change asymmetry — observable factors explain a meaningful share of cross-sectional variation but very little of the trajectory — and interprets that asymmetry as a paired policy message about incentive-program fairness (levels side) and hospital agency (change side).

## Target population

U.S. acute-care hospitals reporting HCAHPS in both the Q1 2017 release wave and the most recent 2024 release wave, with complete data on hospital characteristics, ED operations, and county-level community context. Analytic sample N ≈ 2,380 hospitals (complete-case `sample==1` flag in `../stata/hospitallevel_do.do`). Sample composition: 66.5% for-profit, 18.7% non-profit, 14.8% government; 69.5% urban (RUCA 1–3), 20.8% large rural/micropolitan (4–6), 9.7% small/isolated rural (7–10). Subgroup structure used in stratified specifications: ownership and rural-urban classification.

## Primary method

Hospital-level OLS with heteroskedasticity-robust standard errors. Three linked specifications: (1) **levels** of the overall HCAHPS star rating in 2017, (2) **levels** in 2024, and (3) **first-differenced change** (2024 − 2017), each regressed on hospital characteristics (ownership, rurality), operations (ED time-in-department, hospitals per 1,000 population), and county-level community covariates (age, race/ethnicity, foreign-born share, education, poverty, income, self-reported poor health). The central quantitative contrast is the **significance pattern** — which factors are associated with rating levels but not with rating change — rather than the matching R² gap (analyst direction, 2026-05-22). No causal identification; framing is associational and decomposition-based.

## Key findings

- **National decline**: mean overall star rating 3.45 (2017) → 3.27 (2024), a drop of ≈0.18 stars.
- **ED throughput improved**: median time in ED 292 → 181 minutes.
- **Most factors are significantly associated with rating levels** in both 2017 and 2024 — and the cross-sectional pattern is stable across the two years.
- **Almost no factor is significantly associated with rating change** with the same covariates — this is the levels-vs-change asymmetry; the matching share-of-variation contrast (≈24% in levels, 4–6% in change) is supporting, not the headline.
- **Levels (consistent 2017 and 2024)**: government ownership > non-profit > for-profit; small rural hospitals score highest; longer ED time and higher % 65+, % foreign-born, % poor associate with lower ratings; higher % bachelor's+ associates with higher.
- **Change predictors** (baseline-controlled, Table 2 column 4 / `t6`): rural hospitals gained relative to urban (large rural +0.12, small rural +0.19); non-profit −0.11 and for-profit −0.13 vs government; ED time reduction associated with small rating gains; almost no community-change variable reaches significance. (Basic spec column 3 / `t5` gives the larger rural figures +0.20 / +0.28; the manuscript reports the column-4 baseline-controlled values.)
- **Headline interpretation**: levels are environment-driven (bad news for incentive programs that pay on ratings); change is operations-driven (good news for hospital agency — modest but real levers exist).

## Audience

Public health researchers, health services researchers, and policy audiences interested in patient experience as a quality measure and in the fairness of payment-linked hospital ratings. Audience tilts more toward public health and academic policy than toward the clinical/payer audience that Health Affairs primarily reaches — voice should be readable but methodologically explicit (regression coefficients and the significance pattern shown plainly; R² reported but not foregrounded). Avoid clinical jargon; explain CMS Star Ratings briefly.

## Sources

Paths are relative to this manuscript subfolder (`manuscript/`).

- `../framing.md` — headline frame (Section 0), key findings (Section 1), literature gap (Section 2), resolved policy structure (Section 3), scope boundaries (Section 4), framing decisions (Section 5).
- `../reference-research.md` — reference notebook (Zotero citation keys; candidates for asynchronous review).
- `../fig_tables.xlsx` — figure and table inventory for exhibit planning.
- `../framing_rs.docx` — analyst's annotated framing document with inline comments and closing message (the source of the dual-policy headline).
- `../stata/hospitallevel_do.do` — main analysis file (levels 2017, levels 2024, change models; `estout` outputs written to `.txt`).
- `../stata/do.do`, `../stata/do 1.do`, `../stata/do 2.do` — upstream data prep (hospital general info, HCAHPS waves, ACS demographics).
- `../project info/info for genAI.docx` — background brief and data-source inventory.
- `../references.bib` — Zotero → Better BibTeX auto-export at the project root (not yet set up; drafter walks up from this folder to find it).

## Project-specific notes

- **Target journal switch (flag for alignment)**: `framing.md` lists Health Affairs as the primary target with JAMA Health Forum and Health Affairs Scholar as alternates; the frontmatter here is currently set to **American Journal of Public Health**. AJPH's audience is more public-health-academic than Health Affairs' payer/policy audience, and AJPH's word budget is more generous (3500 main, 180 abstract). Framing.md should be updated to match — or the journal choice reconsidered — before the outline is finalized.
- **Dual-policy headline is non-negotiable** (per analyst, framing.md Section 0 and Section 5): levels = environment-driven (bad news for incentive programs); change = operations-driven (good news for hospital agency). COVID story stays as backdrop only. Rural advantage is *not* the headline — it sits as a supporting finding under the change story.
- **One open framing nuance**: whether "hospital-controllable" in the agency message should be restricted to operational levers (ED time) or also include hospital-fixed traits (ownership, rurality). See `../framing.md` Section 3 nuance note. Recommendation: narrow to operations; confirm with analyst.
- **Scope boundaries** (from `../CLAUDE.md`): no intra-pandemic dynamics (Elliott 2023 covers it); no hospital fixed effects beyond the first-difference; no causal claims; no Star Ratings methodology critique as primary content (Gettel 2024 covers it); only the overall star rating is the dependent variable — the 10 sub-domain ratings appear only as covariates in some specifications.
- **Data access constraint**: raw data live in Windows OneDrive paths and are not accessible from this dev container. Drafting works from the framing document, the regression output tables (`.txt` files referenced in the Stata `estout` calls), and `fig_tables.xlsx` — not from the raw `.dta` files.
- **Experiment audit trail**: this project doubles as a Claude-Code writing experiment. Use stage-prefixed commits (`outline:`, `draft:`, `self-review:`, `peer-review:`, `revise:`, `meta:`, `manual:`) so `git log` doubles as a provenance record. See `../experiment-readme.md`.
