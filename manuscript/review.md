# Self-review — whole draft (Methods + Results)

Scope: full current draft — Methods (Data Sources and Study Sample, Measures, Statistical Analysis) and Results (Sample Characteristics and National Trends; Factors Associated with Rating Levels; Factors Associated with Rating Change). Introduction and Discussion are not yet drafted; forward-references to them are treated as expected, not defects. Reviewed against `outline.md`, the full `draft.md`, and `HCAHPS.bib`.

This replaces the prior Methods-only review. Earlier entries SR-1 through SR-5 (Methods-only pass) were resolved or made moot by subsequent analyst revisions and are not carried forward — see "Resolved since the prior review" below. Entry numbering restarts at SR-1 for this whole-draft pass.

Prose-gate status: the current `draft.md` carries **no** `<!-- DR-N -->` markers and there is no `draft-revisions.md` in the manuscript folder. The prior review noted DR-1/DR-2 markers; they are absent now (the draft was re-revised since). This is the one sign that the per-section prose gate may not have run on the current text — see General observations. I did not re-run the per-section style pass; cross-section style only, per scope.

---

## Methods

### General observations — Methods
- Acronym discipline is clean: HCAHPS, CMS, ED, CDC, ACS, NHGIS, RUCA, FIPS are each spelled out at first use in Methods and used in short form thereafter. None is re-expanded. Cross-section watch for when Intro/Discussion are drafted: HCAHPS and CMS will be first-used in the Introduction, so the Methods expansions must then become short-form back-references (the abbreviation's home moves to the Introduction).
- The ED measure-scope caveat is correctly absent from Methods (Measures ¶7 states the ED measure plainly with no OP-18 detail, no comparability note, no forward-pointer), honoring the rule that ¶21 Limitations is its sole home.
- "standard errors robust to heteroskedasticity" is the correct plain-language placement (Methods, once); "Huber-White"/"heteroskedasticity-robust" jargon is absent. Do not repeat this phrasing in Results (currently not repeated — good).
- No causal/predictive verbs: the augmented model "test[s] whether the baseline rating **was associated with** the subsequent change" — associational framing held. No "predict," "drive," "shape," "cause" anywhere in Methods.
- "county factors" terminology used throughout; "community" does not appear. "proportion" used throughout; "share" does not appear. Sample stated as exactly "2,380 hospitals" with no "approximately"/"≈".
- Three cross-sectional/change models plus the augmented baseline model map to Table 2's four columns. The dropped subgroup and nurse-per-bed checks are correctly absent, and the nurse-salary/Cost-Report data-source clause (flagged in the prior Methods review as an orphan) has been removed from ¶5 — resolved.

### SR-1 — methods-results
**Quote:** "An augmented change model additionally controlled for the 2017 baseline rating, testing whether the baseline rating was associated with the subsequent change."
**Issue:** Methods names a fourth analysis whose stated purpose is to test whether the 2017 baseline rating was associated with the subsequent change (a regression-toward-the-mean test). Results reports column-4 figures for the rural and ownership trajectory differences ("baseline-controlled"), so column 4 is used — but the analysis's own headline result, whether the baseline rating itself was associated with change, is never reported in Results. This is a methods→results orphan: the reader is told an association was tested but never told the answer. It is faithful to the outline (outline ¶9 describes the test; ¶12/¶16 do not report its result), so the gap traces to the outline, not drafter drift.
**Suggestion:** Flag for the author — either report the baseline-rating association in Results ¶12 (one clause: direction and significance of the 2017-baseline term), or reframe the Methods sentence so the augmented model is described only as the baseline-controlled specification that yields the column-4 trajectory figures, without promising a baseline-rating test whose result does not appear. Do not add the missing result (not in the draft or a reported source); deferred to author.

## Results

### General observations — Results
- Results discipline held: no inline citations, no literature comparison, no "central/key finding" narration or ranking, no interpretation of the poor-health positive sign (reported as direction only), no "population composition does not explain the shift" reading. Caveats are not introduced. All correct for AJPH Results.
- The ED figures (292 → 181 minutes) and the within-hospital ED association (~0.002 stars per minute) are reported plainly with no comparability caveat and no conversion to a national-mean star gain — honoring the single-home rule and the "do not multiply by the mean drop" direction.
- The between-year county shifts (population +2.4%, less White, more Hispanic/foreign-born/educated, income +~$12,800) are stated as observed numbers with no inference drawn — the sample-selection reading is correctly held for Limitations ¶21.
- Figure 1 is called out (¶10) and Table 1 (¶10) and Table 2 (¶11 cols 1–2, ¶12 cols 3–4) are each cited. Every exhibit in the drafted scope is referenced.

### Cross-section consistency — numbers (verified, no defects)
- **N = 2,380**: Methods ¶5 "contained 2,380 hospitals"; Results ¶10 "included 2,380 hospitals." Consistent; no "approximately"/"≈" in either place. Matches outline.
- **3.45 → 3.27 stars**: appears once (Results ¶10); matches outline and CLAUDE.md key findings.
- **292 → 181 minutes (ED)**: appears once (Results ¶10); matches outline.
- **~0.002 stars per minute (ED change association)**: Results ¶12; matches outline ¶12/¶140.
- **Composition 66.5% / 18.7% / 14.8%; 69.5% / 20.8% / 9.7%**: Results ¶10; matches outline ¶10 and CLAUDE.md.
- **$12,800 income rise**: Results ¶10; matches outline ¶10. (Limitations ¶21, not yet drafted, must reuse the same ~$12,800 figure — flag forward.)

### SR-2 — consistency
**Quote:** "...rural hospitals gained more relative to urban hospitals — large rural by about 0.12 stars and small rural by about 0.19 stars..."
**Issue:** Not a draft-internal inconsistency, but a divergence the author should be aware of before it surfaces in peer review. The draft uses the **baseline-controlled (Table 2 column 4)** rural-gain figures, +0.12 and +0.19, which match the outline's explicit instruction (outline ¶12: "Use the full model (Table 2 column 4, baseline-controlled) figures, consistent with the ED coefficient"). **CLAUDE.md "Key findings" lists +0.20 and +0.28** (the basic change-model figures). The draft is consistent with the authoritative outline and with the documented analyst direction to use column 4; CLAUDE.md is the stale source here, not the draft. No change to the draft.
**Suggestion:** No draft edit. Note for the author: the same +0.12 / +0.19 (column 4) figures must be reused if the rural trajectory is restated in Discussion ¶19, and the CLAUDE.md key-findings bullet should be reconciled to column 4 at some point so the project record does not carry two rural-gain numbers. Flag only.

---

## Citation integrity (whole drafted scope)

All eight citation keys in the draft resolve in `HCAHPS.bib`:
`HttpsWwwhcahpsonlineorg`, `HttpsWwwmedicaregovCarecompare`, `HttpsQualitynetcmsgovOutpatient`, `greenlundPLACESLocalData2022`, `HttpsDatacmsgovProvidercharacteristics`, `mansonNationalHistoricalGeographic2024`, `HttpsWwwersusdagovDataproducts`, `HttpsDeptswashingtoneduUwruca`. No unresolved keys, no `[@... — NOT FOUND]` flags, no `[@TBD-...]` placeholders. All eight are in Methods; Results adds none (correct — AJPH Results carry no citations). The title-page `[TBD]` author/affiliation/corresponding-author fields are frontmatter, expected, tracked in outline Open Questions #10 — not modified.

## Logic and gaps
- The argument within the drafted scope is sound: Methods establishes the two snapshots, the factors, and the three-plus-one models; Results reports descriptives, the stable cross-sectional pattern, and the change asymmetry in that order. Each Results paragraph follows from a model described in Methods, with the one exception flagged in SR-1.
- The levels-vs-change asymmetry — the paper's organizing contrast — is set up in Methods ¶9 (the central comparison sentence) and delivered in Results ¶12 ("In contrast to the broad set of factors associated with rating levels..."). The thread is intact without Intro/Discussion.
- No unstated steps within the drafted scope. The interpretive load (why the asymmetry matters, the poor-health sign, the agency claim) is correctly deferred to the undrafted Discussion.

## Caveat-echo (whole drafted scope)
- No caveat is echoed. The ED measure-scope caveat appears nowhere in Methods or Results (its sole home is the undrafted Limitations ¶21). The sample-selection caveat appears nowhere in Results (deferred to ¶21). The single-home discipline is intact across the drafted sections. Re-run this pass once Discussion/Limitations exist to confirm ¶21 is the only home for both caveats and that no back-reference clause leaks into Results.

## Methods–Results correspondence (whole drafted scope)
- 2017 cross-sectional model → Results ¶11 ✓; 2024 cross-sectional model → Results ¶11 ✓; change model → Results ¶12 ✓.
- Augmented (2017-baseline) change model → column 4 figures used in Results ¶12, but its stated baseline-rating test result is unreported — see SR-1.
- Every reported result has a described method: composition and national shifts (descriptive, ¶5 sample / ¶7–¶8 measures); level associations (cross-sectional models); change associations and rural/ownership trajectories (change and augmented models). No reverse orphan.

## Word count
- Body word count (pandoc, gfm → plain): ~1,207 words for the current Methods + Results draft. Title page reports "1,215 (Methods and Results sections)" — the ~8-word gap is markup/rounding tolerance.
- Against budget: main-text budget ~3,000 words (CLAUDE.md). Methods + Results at ~1,207 leaves ~1,800 for Introduction (4 paragraphs) and Discussion (6 paragraphs) — tight but workable; the outline's `[optional]`/`[support]` trim order (Open Questions #1) will matter when those sections land. No section cap to enforce now. No concern.

## Prose-gate recommendation
- The current draft carries no `<!-- DR-N -->` markers and there is no `draft-revisions.md`, so the per-section prose gate (deterministic linter + editorial rubric, run by the prose-reviser) may not have run on the present text. I limited this pass to cross-section style only. Recommend running the prose-reviser on both sections before peer review so the per-section style gate is on record. (I found no obvious per-section style offenders in a cross-section read — voice, concision, and word choice look clean — but that is not a substitute for the dedicated gate.)

---

## Resolved since the prior (Methods-only) review
- **"either year" vs "both years" (old SR-1):** the outline ¶5 now reads "complete data, in both years," matching the draft. No discrepancy remains.
- **Nurse salary / Cost Report data-source orphan (old SR-3):** the clause has been removed from ¶5; no orphan data source remains.
- **"predicted" verb (old SR-5):** the augmented-model sentence now reads "was associated with," fully associational. No issue.
