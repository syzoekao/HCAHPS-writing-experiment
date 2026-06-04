# Self-review — Methods

Scope: Methods section (Data Sources and Study Sample ¶5; Measures ¶7–¶8; Statistical Analysis ¶9). Reviewed against `outline.md`, full `draft.md` for cross-section consistency, and `HCAHPS.bib`.

Note on prior gates: the prose-reviser ran on this section — `<!-- DR-1 -->` and `<!-- DR-2 -->` markers are present in the draft. Per-section style was therefore not re-run here; this pass covers outline fidelity, cross-section consistency, citation integrity, logic/gaps, and word count.

---

## Data Sources and Study Sample (¶5)

### SR-1 — outline-fidelity
**Quote:** "...and had complete data, in both years, on every factor used in the models."
**Issue:** The outline ¶5 core inclusion criterion reads "complete data, **in either year**, on every factor used in the models" (matching `[data: ../methods.md §3]`). The draft says "in **both** years." This is a STROBE inclusion/exclusion element, and "either" vs. "both" defines a materially different sample: "either year" admits a hospital missing a covariate in one year, "both years" requires completeness in each. The downstream N ≈ 2,380 and the change-model construction (¶8, which needs both years' values for each time-varying factor) depend on which rule is correct.
**Suggestion:** Confirm against methods.md §3 / `sample==1` and align the draft to the authoritative criterion. Do not change without verifying — this is a substantive criterion, not wording. Flag only; deferred to author. (Preserve as a reporting-guideline element regardless.)

### SR-2 — consistency
**Quote:** "...the first-quarter 2017 release wave and the fourth-quarter 2024 release wave..."
**Issue:** Wave labeling is internally consistent within Methods (first-quarter 2017; fourth-quarter 2024) and matches the outline's resolved convention (Open Questions #12f). No defect. Noted here only to record that the 2024 wave is labeled "fourth-quarter" in prose while the outline scaffolding elsewhere calls it the "October 2024 refresh / Q4" — the prose label is the correct one to carry into Results and Discussion when those sections are drafted. No change needed in Methods.

### General observations — ¶5
- The paragraph correctly omits the ED measure-scope caveat, per the analyst direction that ¶21 (Limitations) is its sole home (outline ¶7 note; Open Questions #2). Good.
- All six citation keys in ¶5 resolve in `HCAHPS.bib` (`HttpsWwwhcahpsonlineorg`, `HttpsWwwmedicaregovCarecompare`, `HttpsQualitynetcmsgovOutpatient`, `greenlundPLACESLocalData2022`, `HttpsDatacmsgovProvidercharacteristics`, `mansonNationalHistoricalGeographic2024`, `HttpsWwwersusdagovDataproducts`, `HttpsDeptswashingtoneduUwruca`). No unresolved keys, no `[TBD]`, no `[@TBD-...]` placeholders.
- The CMS Healthcare Cost Report Information System source for nurse salary and bed count carries no citation in either outline or draft. The outline ¶5 bullet also lists it without a key, so this is faithful to the outline — not a draft defect — but note that nurse salary/bed count do not appear as a modeled factor in ¶7–¶8 (see SR-3). Flag for the author: if this source contributes no measure that survives into the models, the sentence may be removable.

## Measures (¶7–¶8)

### SR-3 — logic-gap / methods-results
**Quote:** "...and nurse salary and bed count from the CMS Healthcare Cost Report Information System." (¶5) — read against ¶7–¶8.
**Issue:** ¶5 lists nurse salary and bed count as assembled data, but neither appears among the modeled factors in ¶7 (hospital, operational, county community factors) or among the change measures in ¶8. The outline mirrors this (¶5 lists the cost-report source; ¶7/¶8 do not list nurse salary or beds as factors) — Open Questions #3/#12e record that the nurse-salary-per-bed sensitivity check was *dropped* because it is unverifiable and not reported in Results. So the analysis was intentionally removed, but the data-source sentence that fed it survives in ¶5.
**Suggestion:** Flag for the author — consider dropping "and nurse salary and bed count from the CMS Healthcare Cost Report Information System" from ¶5, since no measure built from it enters any model. Leaving it implies a covariate the reader will look for in Table 2 and not find. Deferred (not auto-applied): removing a data-source clause is an author content decision, and it is faithful to the current outline.

### SR-4 — consistency
**Quote:** "...urban (RUCA 1–3), large rural or micropolitan (RUCA 4–6), and small or isolated rural (RUCA 7–10)."
**Issue:** The draft writes "RUCA 4–6" and "RUCA 7–10" with the prefix repeated; the outline ¶7 writes "(RUCA 1–3)", "(4–6)", "(7–10)" with the prefix only on first mention. Minor and arguably an improvement (each range is self-labeled). No cross-section conflict since RUCA is defined once at first use in ¶5. No change needed; recorded for completeness.

### General observations — ¶7–¶8
- ED is spelled out at first use ("emergency department (ED)") in ¶5 and used as "ED" consistently thereafter. RUCA, FIPS, ACS, NHGIS, CDC, CMS, HCAHPS all spelled out at first use in Methods. Acronym discipline is clean within the section. Cross-section note: when Results/Discussion are drafted, these must not be re-expanded (currently not a defect because only Methods exists).
- ¶7 correctly states the ED measure plainly ("the median time a patient spent in the ED, in minutes") with no comparability caveat, per the outline note. Good.
- ¶8 "fixed categorical factors" for ownership and rural-urban classification matches outline ¶8 support bullet. Faithful.

## Statistical Analysis (¶9)

### SR-5 — consistency
**Quote:** "...testing whether the starting rating of a hospital predicted its subsequent trajectory."
**Issue:** The draft uses "predicted." The outline ¶9 support bullet says the augmented model tests "whether a hospital's starting rating **shaped** its subsequent trajectory." This is a faithful softening, if anything (the skill's calibrated-certainty rule prefers "predicted/was associated with" over the vague causal "shaped" for an associational design). No defect — flagging only to note the draft chose the more defensible verb. No change needed. Cross-section watch: keep "predicted/associated," not "shaped/drove," when the change finding is restated in Results ¶12 and Discussion ¶16/¶19.

### General observations — ¶9
- "standard errors robust to heteroskedasticity" — the outline ¶9 says "robust standard errors"; the draft expands to the plain-language form the style skill prescribes (introduce robustness once in Methods in plain language, drop "Huber-White"/"heteroskedasticity-robust" jargon from Results). Correct placement: this is the one section where the plain gloss belongs. Cross-section watch: do not repeat this phrasing in Results.
- Three models named (2017 cross-sectional, 2024 cross-sectional, change) plus the augmented 2017-baseline change model = Table 2's four columns. Maps cleanly to the outline's Table 2 (¶9, Exhibits). No orphan analyses within Methods; the dropped subgroup and nurse-per-bed checks are correctly absent (Open Questions #3).
- The central comparison sentence (levels vs. change significance pattern) is present and matches outline ¶9 core and the project's headline framing. Good — and correctly stated without "central finding" narration (that belongs in Discussion).

## Citation integrity (whole Methods section)

All citation keys in the Methods body resolve in `HCAHPS.bib`:
`HttpsWwwhcahpsonlineorg`, `HttpsWwwmedicaregovCarecompare`, `HttpsQualitynetcmsgovOutpatient`, `greenlundPLACESLocalData2022`, `HttpsDatacmsgovProvidercharacteristics`, `mansonNationalHistoricalGeographic2024`, `HttpsWwwersusdagovDataproducts`, `HttpsDeptswashingtoneduUwruca`. No unresolved keys, no `[@... — NOT FOUND]` flags, no `[@TBD-...]` placeholders. The title page carries `[TBD]` author/affiliation/corresponding-author fields — these are frontmatter, expected, and tracked in outline Open Questions #10; not a Methods defect, not modified.

## Word count

- **Body word count (whole draft):** 720 words via the drafter's pandoc method. The draft is Methods-only at present; the title page reports "714 (Methods section only)." The 6-word gap is within rounding/markup tolerance of the pandoc count and the title-page note already scopes it to Methods. Update the title-page field to 720 at the next docx pass if exactness is wanted.
- **Against budget:** main-text budget is ~3,000 words (CLAUDE.md). Methods at ~720 words is a reasonable share for a ~3,000-word STROBE manuscript with Intro + Results + Discussion still to draft. No section-level cap to enforce. No concern.

## Passes not applicable to a single-section scope
- **Methods–Results correspondence (pass 6)** and **caveat-echo across sections (pass 7)** are whole-draft judgments and cannot be fully run while only Methods exists. Partial note: ¶7 correctly carries no ED caveat, so the single-home discipline is intact so far; re-run both passes once Results and Discussion are drafted to confirm every Methods analysis has a reported result and no caveat is echoed beyond ¶21.
