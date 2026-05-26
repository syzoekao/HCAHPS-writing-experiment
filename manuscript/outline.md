# Outline — Determinants of Hospital HCAHPS Star Ratings and Changes Over Time, 2017-2024

**Artifact:** manuscript (AJPH Original Research)
**Target journal:** American Journal of Public Health
**Word budget:** ~3,000 words main text (working target; AJPH external cap is 3,500); 180-word structured abstract
**Reporting guideline:** STROBE (cross-sectional / observational), loosely followed
**Citation style:** AMA; citation keys in `[@key]` format from `../reference-research.md`
**Exhibits:** Table 1 (descriptive statistics), Table 2 (4-column regression), Figure 1 (2017→2024 difference map). Per-year maps → appendix.

**Drafting conventions for this outline:**
- Each `¶` is one paragraph. First sub-bullet = topic sentence; supporting sub-bullets carry their own evidence; optional `*Transition:*` last.
- `[TBD]` marks an unresolved decision. `[data: …]` marks a number to pull from a named source. `[figure N]` / `[table N]` mark exhibit slots.
- AJPH convention: the Introduction does **not** preview findings (`intro-previews-findings` unset → default no preview). Findings appear first in Results.
- Acronyms are spelled out at first use here so the drafter inherits the expansion.

---

## Title

- [core] Working title (per analyst): "Determinants of Hospital HCAHPS Star Ratings and Changes Over Time, 2017-2024".
- [support] HCAHPS = Hospital Consumer Assessment of Healthcare Providers and Systems — spell out in the title or at first use in the abstract.

---

## Structured abstract (180 words; AJPH labels: Objectives, Methods, Results, Conclusions)

- [core] **Objectives** (~30 words): state the question — what hospital, operational, and community factors are associated with the overall HCAHPS star rating, and which explain the 2017→2024 change. `[data: research question, ../manuscript/CLAUDE.md]`
- [core] **Methods** (~45 words): U.S. acute-care hospitals reporting HCAHPS in Q1 2017 and the latest 2024 release wave (N ≈ 2,380); ordinary least squares regression of the overall star rating on hospital, operational, and county community factors, estimated separately for the 2017 rating, the 2024 rating, and the 2017→2024 change. `[data: ../methods.md §1, §7]`
- [core] **Results** (~70 words): mean rating fell 3.45 → 3.27 stars; most hospital, operational, and community factors were significantly associated with the rating in each year, but almost none were associated with the 2017→2024 change; government and small rural hospitals scored highest; shorter emergency department time was associated with higher ratings and with rating gains over the window. `[data: ../findings.md §1, §4, §5]`
- [core] **Conclusions** (~35 words): observable factors account for where ratings stand but little of how they move — payment-linked ratings reflect community context hospitals cannot change, while the modest movement that factors do explain runs through operations hospitals can change. `[data: ../framing.md §0]`
- [support] *Note:* abstract Results lead with the significance pattern (which factors track levels vs change), state magnitude and direction in plain language, and avoid R² symbols and the word "coefficient." Translate consistently with the Results section.

---

## Introduction (4 paragraphs)

### ¶1 — Patient experience is a measured, payment-linked dimension of hospital quality

- [core] Topic sentence: hospital patient experience, measured by the HCAHPS survey, is publicly reported and tied to Medicare payment, so HCAHPS scores carry financial and reputational stakes for hospitals. <!-- OR-5 -->
- [support] HCAHPS is the standardized national survey of inpatient experience; the Centers for Medicare & Medicaid Services (CMS) publishes overall star ratings on Care Compare `[@cmsHCAHPSPatientsPerspectives; @cmsHospitalCareCompare]`.
- [core] Financial stake: scores feed the Hospital Value-Based Purchasing program, so a rating gain or loss affects Medicare reimbursement `[@wernerMedicareNewHospital2012; @aca2010Sec3001HVBP]`.
- [core] Reputational stake: because Care Compare publishes the star ratings on a consumer-facing site, ratings also feed prospective patients' hospital-choice decisions and the hospital's reputation independent of any payment formula `[@cmsHospitalCareCompare; @TBD-reputation-citation]`.
- [optional] One sentence on why ratings as a payment-and-reputation signal are worth scrutinizing — measurement choices and survey trends shape both incentives `[@blandChallengesFacingCAHPS2022]`.
- [support] *Transition:* because ratings drive both payment and reputation, what they actually capture about a hospital matters.

### ¶2 — What prior work shows about HCAHPS scores: cross-sectional determinants, recent-year trends, and methodological studies

- [core] Topic sentence: research on HCAHPS scores splits into three groups — studies of what predicts ratings at a point in time, studies of how ratings changed nationally in recent years, and methodological studies of how the rating is constructed.
- [core] Cross-sectional work links ratings to hospital characteristics, nursing, and county community factors `[@beckettInterventionsHospitalCharacteristics2024; @herrinHCAHPSScoresCommunity2018; @fitzpatrickRosenbaumHospitalPerformance2024]`.
- [core] National-trend work documents the decline in patient experience during and after the pandemic — kept brief, as background; this paper's window brackets that decline rather than seeking to explain it `[@elliottChangesPatientExperiences2023; @beckettHospitalPatientExperience2025]`. <!-- OR-1 -->
- [support] Pre-pandemic trend work establishes the flat-to-improving baseline the post-2017 decline reverses `[@beckettTrendsHCAHPSSurvey2024]`.
- [support] A methodological group of studies examines how the rating is built and adjusted — CMS patient-mix adjustment and peer grouping — and motivates cautious interpretation rather than being this paper's subject `[@elliottUpdatedAdjustmentHCAHPS2025; @gettelCalculationOverallHospital2024]`. <!-- OR-8 -->
- [support] *Transition:* these studies describe ratings at one time, trace a national average, or scrutinize the rating's construction, but they leave one question open.

### ¶3 — The gap: no hospital-level decomposition of rating levels versus rating change

- [core] Topic sentence: no study has modeled, at the hospital level, both where overall star ratings stand and how individual hospitals' ratings changed between a mature pre-pandemic baseline and post-pandemic stabilization, using the same hospital, operational, and community factors.
- [support] Cross-sectional determinant studies describe levels at one time but cannot say whether the same factors explain movement `[@herrinHCAHPSScoresCommunity2018]`.
- [support] National-trend studies trace the average trajectory but do not decompose hospital-level change against hospital and community factors `[@elliottChangesPatientExperiences2023; @beckettHospitalPatientExperience2025]`.
- [core] Why the distinction matters: if factors explain where ratings stand but not how they move, the policy reading of a rating change differs from the reading of a rating level.
- [support] *Transition:* this study addresses that gap directly.

### ¶4 — Objective and approach

- [core] Topic sentence: we examined which hospital, operational, and county community factors are associated with the overall HCAHPS star rating, and which of those factors explain the 2017→2024 change in rating.
- [core] Design in one sentence: a hospital-level analysis comparing Q1 2017 with the most recent 2024 release wave, modeling rating levels in each year and the change between them.
- [core] Year choice: the 2024 wave was selected both because it is the latest available and because it sits after the pandemic-era disruption — bracketing the pandemic period rather than analyzing it. The pandemic is not the focus of this study.
- [core] Framing: the paper is associational and decomposition-based; it contrasts which factors are associated with the rating in each single year against which are associated with the 2017→2024 change, and makes no causal claim.
- [support] No findings preview (AJPH convention).

---

## Methods (STROBE-informed; ~6 paragraphs)

### ¶5 — Study design and data sources

- [core] Topic sentence (describes): we built a dataset with two snapshots per hospital — Q1 2017 and the latest 2024 release — combining patient-experience ratings with operational, market, community-health, demographic, and geographic measures. <!-- OR-2 -->
- [core] Outcome and ratings source: overall HCAHPS star rating and the sub-domain star ratings from the CMS Care Compare longitudinal HCAHPS file, 23 quarterly release waves with rolling 12-month survey windows `[@cmsHCAHPSPatientsPerspectives; @cmsHospitalCareCompare; @cmsHCAHPSStarRatingsTechNotes2024]`.
- [support] Hospital characteristics from CMS Hospital General Information; emergency department (ED) throughput from the CMS Timely and Effective Care file, 2017 and 2024 vintages `[@cmsHospitalCareCompare; @cmsHospitalOQRSpecsManual]`.
- [support] County context: self-reported poor health from the Centers for Disease Control and Prevention (CDC) PLACES file `[@greenlundPLACESLocalData2022]`; hospital counts from the CMS Provider of Services file `[@cmsProviderOfServicesFile]`; demographics from American Community Survey (ACS) 5-year estimates via IPUMS National Historical Geographic Information System (NHGIS) `[@mansonIPUMSNHGIS2024]`; rural-urban classification from U.S. Department of Agriculture Rural-Urban Commuting Area (RUCA) codes `[@usdaERSRUCACodes2023; @wwamiRUCAClassification]`; nurse salary and bed count from the CMS Healthcare Cost Report Information System `[@cmsHCRIS]`.
- [support] *Transition:* these sources were merged into one row per hospital.

### ¶6 — Setting, participants, and sample construction

- [core] Topic sentence (describes): the analytic sample comprised U.S. acute-care hospitals reporting an overall HCAHPS star rating in both the Q1 2017 release wave and the latest 2024 release wave, with complete data on every factor used in the models.
- [support] Linkage: hospitals matched to county context through ZIP code and a ZIP-to-county crosswalk; community measures merged on county Federal Information Processing Standards code.
- [core] Complete-case rule: a hospital entered the analytic sample only if it had no missing values on the outcome or any factor in either year; the resulting sample is N ≈ 2,380. `[data: ../methods.md §3]`
- [support] STROBE item — report exclusions: tabulate hospitals dropped and the reason (missing rating, missing ED time, missing covariate) so the sample can be reconstructed; consider a flow diagram if AJPH expects one. `[data: ../methods.md §9 flag 4]`

### ¶7 — Outcome and explanatory factors

- [core] Topic sentence (describes): the outcome was the overall HCAHPS star rating (1–5 stars); the sub-domain star ratings were used only as additional factors in some models, never as the outcome.
- [core] Hospital factors: ownership recoded into three classes — government, non-profit, for-profit — and rural-urban classification in three classes — urban (RUCA 1–3), large rural/micropolitan (4–6), small or isolated rural (7–10). `[data: ../methods.md §5]`
- [core] Operational and market factors: median ED time in minutes; hospitals per 1,000 county population.
- [core] County community factors: self-reported poor health prevalence; population; share aged 65 and over; race and ethnicity shares; foreign-born share; share with a bachelor's degree or above; poverty share overall and among adults 65 and over; median household income.
- [core] *Caveat to flag in Methods (blocking for ED prose):* median ED time fell 111 minutes (38%) between the 2017 and 2024 vintages; this is potentially fundamental for the ED interpretation and must be validated before drafting (analyst direction 2026-05-22). Two checks required: (a) compare the OP-18b specification across the 2017 and 2024 vintages of the CMS Hospital Outpatient Quality Reporting Specifications Manual, with attention to the FY2021 IPPS Final Rule; (b) cross-check against the published ED-throughput literature for a corroborating national trend. <!-- OR-3 --> `[data: ../findings.md §8 flag 3; @cmsHospitalOQRSpecsManual; @fedreg85FR58432_FY2021IPPSFinalRule; @mostafaStrategiesMeasureImprove2024]`

### ¶8 — Change measures

- [core] Topic sentence (describes): for the change analysis, each factor had a matching 2017→2024 change measure, computed as the 2024 value minus the 2017 value.
- [core] The outcome change measure was the 2024 overall star rating minus the 2017 rating.
- [support] Ownership and rural-urban classification were treated as fixed over the window (using the 2024 assignment) and entered the change model as categorical factors — they predict trajectory but cannot themselves change.
- [optional] *Transition:* these change measures fed the change model described next.

### ¶9 — Statistical analysis

- [core] Topic sentence (describes): we estimated the overall star rating using linear regression with robust standard errors, fitting three models — a 2017 cross-sectional model, a 2024 cross-sectional model, and a model of the 2017→2024 change.
- [core] The cross-sectional models regressed the rating in a given year on that year's hospital, operational, and community factors; the change model regressed the change in rating on the changes in those factors.
- [support] Augmented models added the sub-domain star ratings (or their changes) and 2017 baseline values, testing whether those channels close the gap between the cross-sectional models and the change model. `[data: ../methods.md §7]`
- [core] The central comparison: which factors are significantly associated with rating *levels* in 2017 and 2024 versus which are significantly associated with the 2017→2024 *change*. The matching share-of-variation contrast (about a quarter in the cross-sectional models, single digits in the change model) is reported as supporting evidence, not the headline. `[data: ../findings.md §1]`
- [support] Subgroup analysis: the change model re-estimated separately for urban, large rural, and small rural hospitals. `[data: ../methods.md §7]`
- [support] Sensitivity analysis: nurse salary per bed added to the cross-sectional and change models as a staffing-intensity check. `[data: ../methods.md §7; @fitzpatrickRosenbaumHospitalPerformance2024]`
- [support] *Caveat to flag:* sub-domain, subgroup, and nurse-per-bed estimates currently live in files outside the repository; coefficients are not yet verifiable and must be retrieved before drafting the corresponding Results paragraphs. `[data: ../findings.md §6, §8 flag 7]`

---

## Results (6 paragraphs)

### ¶10 — Sample characteristics and national trends

- [core] Topic sentence: the 2,380 hospitals spanned ownership types and rural-urban settings, and several factors shifted between 2017 and 2024. `[table 1]` <!-- OR-4 -->
- [support] Composition: 66.5% for-profit, 18.7% non-profit, 14.8% government; 69.5% urban, 20.8% large rural, 9.7% small or isolated rural. `[data: ../findings.md §2]`
- [core] Headline shifts: mean overall rating fell 3.45 → 3.27 stars; median ED time fell 292 → 181 minutes. `[data: ../findings.md §3; table 1]`
- [support] *Caveat to surface in prose:* mean share White fell about 11 percentage points and mean median household income rose about $12,800 — both larger than typical seven-year movement. Per analyst review (2026-05-22), the most likely explanation is **sample selection** (which hospitals stayed in the complete-case panel across the window), not a real population shift or an ACS tabulation/inflation artifact. State this as a sample-composition note, not as population change. `[data: ../findings.md §8 flag 4]`
- [support] *Transition:* these are the aggregate shifts; the regressions show what is associated with the rating itself.

### ¶11 — Cross-sectional findings: most factors are significantly associated with ratings, and the pattern is stable across years

- [core] Topic sentence: in both 2017 and 2024, most hospital, operational, and community factors were significantly associated with the overall star rating, and the associations were stable across the two years. `[table 2, columns 1–2]`
- [support] Supporting detail (not the headline): the factor set together explained about a quarter of the cross-hospital variation in each year (24% in each year). `[data: ../findings.md §4]`
- [support] Stability across years is itself a finding — the structure under the national decline held steady. `[data: ../findings.md §4]`
- [support] *Transition:* within that stable structure, three patterns stand out.

### ¶12 — Cross-sectional findings: ownership and rural-urban patterns

- [core] Topic sentence: government hospitals scored highest and non-profit hospitals lowest, and small rural hospitals scored well above urban hospitals.
- [support] Non-profit hospitals scored roughly half a star below government hospitals in both years; for-profit hospitals matched government in 2017 but had moved about 0.11 stars below by 2024. `[data: ../findings.md §4; table 2]`
- [support] Small rural hospitals scored above urban hospitals in both years, and the gap widened (0.32 → 0.61 stars); large rural hospitals trailed urban in 2017 but caught up by 2024. `[data: ../findings.md §4; table 2]`
- [optional] Note the rural pattern runs opposite to the rural disadvantage seen on most non-experience quality measures `[@vuPatientSatisfactionRural2024; @beckettInpatientCareExperiences2025]`.
- [support] *Transition:* operational and community factors pointed in expected directions, with one exception.

### ¶13 — Cross-sectional findings: operational and community factors, with one counterintuitive sign

- [core] Topic sentence: longer ED time and a more disadvantaged community were associated with lower ratings, except that higher self-reported poor health was associated with higher ratings.
- [core] Each additional minute of ED time was associated with a slightly lower rating; more hospitals per 1,000 population was associated with higher ratings. `[data: ../findings.md §4; table 2]`
- [support] Higher county education was associated with higher ratings; higher shares aged 65 and over, foreign-born, and in poverty (in 2024) were associated with lower ratings. `[data: ../findings.md §4; table 2]`
- [core] The counterintuitive result: higher county self-reported poor health was associated with *higher* ratings in both years — flagged here, addressed in the Discussion. `[data: ../findings.md §4, §8 flag 1]`
- [core] *Transition:* most of these factors are significantly associated with rating levels — almost none are significantly associated with the 2017→2024 change.

### ¶14 — Change findings: the levels-versus-change asymmetry

- [core] Topic sentence: the same factor set that was significantly associated with rating levels in both years was almost entirely *not* significantly associated with the 2017→2024 change — only Δ ED time and Δ median household income reached statistical significance, and the latter was practically null. `[table 2, columns 3–4]`
- [support] Supporting share-of-variation contrast: the change model explained roughly 4% of the variation (basic specification) or 6% (with 2017 baseline values added) — an order of magnitude less than the cross-sectional models; the basic-versus-baseline gap is consistent with regression toward the mean. `[data: ../findings.md §5, §8 flag 8]` <!-- OR-9 -->
- [core] This asymmetry — most factors track where ratings stand, almost none track how they move — is the central quantitative finding. `[data: ../framing.md §1]`
- [support] *Transition:* within that handful of significant change-model factors, one operational factor stands out.

### ¶15 — Change findings: what predicted gaining or losing stars

- [core] Topic sentence: among the factors in the change model, shorter ED time was the operational factor associated with rating gains, while community shifts were unrelated to rating change.
- [core] ED time: a reduction in ED time was associated with a small rating gain. The implied average gain from the 111-minute mean drop would be roughly 0.1–0.2 stars, but this magnitude claim is **contingent** on the ED measure-definition validation in ¶7 — if the OP-18b specification changed across the window, part of the drop is mechanical and the implied gain is overstated. `[data: ../findings.md §5, §8 flag 3; @mostafaStrategiesMeasureImprove2024]`
- [core] Community shifts: changes in age structure, racial composition, foreign-born share, education, and poverty were all unrelated to rating change — the population-shift story does not explain the rating-shift story. `[data: ../findings.md §5]`
- [support] Supporting (descriptive, not the headline): rural hospitals gained relative to urban (large rural +0.20, small rural +0.28 stars); for-profit and non-profit hospitals declined more than government hospitals. `[data: ../findings.md §5; table 2]`
- [support] *Caveat to flag:* rural-subgroup change estimates rest on files outside the repository and need retrieval before this paragraph is drafted in full. `[data: ../findings.md §6, §8 flag 7]`
- [support] Geographic pattern: describe the 2017→2024 difference map — which regions improved, which declined — once the rendered figure is available. `[figure 1; data: ../findings.md §7]`

---

## Discussion (6 paragraphs)

### ¶16 — Principal findings

- [core] Topic sentence: most hospital, operational, and community factors were significantly associated with where overall HCAHPS ratings stood in 2017 and 2024, but almost none of those same factors were significantly associated with how ratings moved between the two years.
- [support] Restate the asymmetry plainly and note the cross-sectional structure held steady across the two years. The matching share-of-variation contrast (≈24% in levels, 4–6% in change) appears here as supporting context, not as the headline.
- [core] Name the one operational factor that did track rating change — ED time — and note community shifts did not (subject to the ED measure-definition validation in Methods).
- [support] *Transition:* this pattern fits and extends what prior work has shown.

### ¶17 — Comparison with prior literature

- [core] Topic sentence: the cross-sectional associations align with existing determinant studies, and the change finding extends the national-trend literature by decomposing hospital-level movement.
- [support] The cross-sectional findings echo prior work on community factors and hospital characteristics `[@herrinHCAHPSScoresCommunity2018; @beckettInterventionsHospitalCharacteristics2024]`.
- [core] The national decline matches the documented pandemic-era trajectory; this paper adds that, at the hospital level, almost none of the observable factors that track rating *levels* are also significantly associated with the hospital's rating *change* across the window `[@elliottChangesPatientExperiences2023; @beckettHospitalPatientExperience2025]`.
- [optional] The rural advantage is consistent with recent work showing rural and critical access hospitals outperform on patient experience `[@vuPatientSatisfactionRural2024; @beckettInpatientCareExperiences2025]`.
- [support] *Transition:* the asymmetry carries a paired policy message.

### ¶18 — Implication 1: rating levels reflect community context, a problem for payment-linked ratings

- [core] Topic sentence: because many community factors hospitals cannot change are significantly associated with rating levels, payment-linked ratings systematically disadvantage hospitals serving structurally disadvantaged communities.
- [core] CMS patient-mix adjustment corrects for individual patient characteristics but not community context, so this disadvantage survives current adjustment `[@elliottUpdatedAdjustmentHCAHPS2025]`.
- [support] The National Academies set out the rationale for adjusting quality measures for social risk; these results give updated, HCAHPS-specific support `[@nationalacademiesAccountingSocialRisk2016]`.
- [core] Implication: CMS should consider adding community-context adjusters or reporting context-adjusted scores alongside raw stars — the "bad news for incentive programs" half of the message.
- [support] *Transition:* the change side of the asymmetry carries the opposite message.

### ¶19 — Implication 2: rating change tracks operations, so hospitals retain agency over trajectory

- [core] Topic sentence: because the one operational factor significantly associated with rating *change* is ED throughput — an operation hospitals can change — hospitals retain real, if narrow, agency over their rating trajectory.
- [core] Scope this agency claim narrowly to operations (ED throughput); ownership and rural-urban trajectory differences are descriptive supporting findings, not part of the agency claim (resolved framing decision, analyst, 2026-05-21).
- [support] The ED-throughput-to-satisfaction link is supported by the wait-time literature `[@mostafaStrategiesMeasureImprove2024; @bleusteinWaitTimesPatient2014; @soremekunFrameworkWaitTimes2011]`.
- [core] Implication: the operational room to improve a rating is narrower than the cross-sectional picture suggests, but it is real — the "good news for hospital management" half of the message.
- [optional] Supporting context (descriptive, kept brief): rural hospitals gained ground on patient experience even amid documented rural-hospital financial fragility `[@ahaImpactCOVID19RuralHospitals2024; @aspeRuralHospitalClosures2024]`; for-profit and non-profit hospitals declined more than government hospitals `[@chenEffectPatientQuality2023]`.
- [support] *Transition:* one finding still needs explanation.

### ¶20 — Interpreting the counterintuitive poor-health sign and cautions on attributing the decline

- [core] Topic sentence: the positive association between county self-reported poor health and ratings runs against expectation and should be read cautiously. <!-- OR-6 -->
- [support] Offer three calibrated explanations, noting the design cannot adjudicate: (a) lower care expectations in higher-burden communities — the same experience clears a lower bar, the disconfirmation mechanism that also plausibly underlies the rural advantage `[@TBD-cassidy-smith-disconfirmation-2007; @vuPatientSatisfactionRural2024]`; (b) hospital reliance and habituation — in higher-burden communities, patients lean on the hospital more, perceive it as the source of their improved health, and become familiar with its staff and processes, all of which can raise reported experience (analyst hypothesis, 2026-05-22) `[@TBD-reliance-habituation-citation]`; and (c) a statistical reading — poor health is entered alongside its own socioeconomic causes, so its coefficient is a mutually-adjusted residual, not the effect of community sickness (the "Table 2 fallacy") `[@TBD-westreich-greenland-table2-2013]`. `[data: ../findings.md §8 flag 1]`
- [core] Broader caution: because observable structural factors do not drive rating change, a rating shift is not a reliable signal of community-driven structural change; attributing the post-2017 decline to the pandemic or to demographic change would require more granular within-hospital data. `[data: ../framing.md §3C]`
- [support] *Transition:* these readings hold within the study's limits.

### ¶21 — Limitations

- [core] Topic sentence: several limitations bound the interpretation.
- [core] Design: associational and decomposition-based — no causal claim; the two-snapshot change model nets out time-invariant hospital traits but cannot identify mechanisms.
- [core] Measurement: the ED-time measure definition may have changed between the 2017 and 2024 vintages, so the 111-minute drop may overstate real operational gain (pending the validation described in Methods). `[data: ../findings.md §8 flag 3]`
- [support] Scope: only the overall star rating is the outcome; intra-pandemic dynamics, hospital fixed effects beyond the change model, and a critique of Star Ratings methodology are out of scope `[@elliottChangesPatientExperiences2023; @gettelCalculationOverallHospital2024]`.
- [optional] Unverified estimates: sub-domain, subgroup, and nurse-per-bed results were not yet retrievable from repository files at outlining time. `[data: ../findings.md §8 flag 7]`

### ¶22 — Conclusions

- [core] Topic sentence: most observable factors track where HCAHPS ratings stand; almost none track how they move, and that asymmetry should shape how ratings are used.
- [core] For payment policy: pair raw stars with community-context adjustment so hospitals are not penalized for the populations they serve.
- [core] For hospital management: trajectory remains partly within reach through operational improvement, most visibly ED throughput.
- [support] Close on the paired message without overclaiming either half.

---

## Exhibits

- [support] **Table 1** — Descriptive statistics: hospital, operational, and community factors, 2017 and 2024 snapshots, with the 2017→2024 change. Source: `../fig_tables.xlsx` sheet `table1`.
- [core] **Table 2** — Regression results, four columns: 2024 rating, 2017 rating, change (basic), change (with 2017 baselines). Source: `../fig_tables.xlsx` sheet `table2`.
- [support] **Figure 1** — County map of the 2017→2024 change in mean overall star rating (diverging palette: red = decline, blue = improvement). Source: `../fig_tables.xlsx` sheet `fig1`, generated by `../stata/do 1.do`.
- [optional] **Appendix** — Per-year county star-rating maps (eight release waves, 2017–2024).

---

## Open questions

1. **Word budget tightened to ~3,000.** Per analyst direction 2026-05-22, the working main-text budget is ~3,000 words (down from AJPH's 3,500 cap). `[optional]` bullets in this outline are the first to cut; `[support]` bullets that add only color are next. Re-rank any bullet whose tier no longer fits the tighter budget.
2. **ED-time measure-definition change (blocking).** The 111-minute (38%) drop in median ED time may partly reflect a CMS measure-definition change between the 2017 and 2024 vintages (`../findings.md` §8 flag 3). Validation plan: (a) compare the OP-18b specification across the 2017 and 2024 CMS Hospital Outpatient Quality Reporting Specifications Manuals and the FY2021 IPPS Final Rule; (b) cross-check against the ED-throughput literature. This is **blocking** for any prose that reports the drop as a real operational gain — directly affects ¶7 caveat, ¶15 magnitude claim, ¶16 principal-findings agency line, and ¶19 Implication 2.
3. **Unverified estimates.** Sub-domain-augmented, rural-subgroup, and nurse-per-bed coefficients live in `t2.txt` / `t3.txt` in OneDrive, not the repository (`../findings.md` §6, §8 flag 7). Retrieve and verify before drafting ¶9 (sensitivity), ¶12–¶13 (sub-domain channels), and ¶15 (rural-subgroup change story).
4. **Which change R² figure to report as supporting context.** The change model explains 3.9% (basic) or 5.6% (with 2017 baselines) (`../findings.md` §8 flag 8). Now that R² is supporting rather than headline (per analyst direction 2026-05-22), decide whether to cite the basic figure (cleaner contrast) or the baseline-controlled figure (defensible upper bound). The outline currently reports both as supporting detail in ¶14 and ¶16. <!-- OR-7 -->
5. **Reporting guideline.** STROBE is followed loosely. Confirm whether AJPH requires a completed STROBE checklist and whether a sample flow diagram is expected.
6. **Human Participant Protection statement.** Note (resolved, not an open question): the study uses publicly available, de-identified data, so institutional review board review was not required, and the ¶9 ethics bullet was removed. AJPH Original Research still requires a brief Human Participant Protection statement as a back-matter element — add a one-sentence declaration at drafting (review not required; publicly available, de-identified data), placed in back matter rather than the Methods narrative.
7. **Positive poor-health sign.** The ¶20 explanation now includes three candidate mechanisms, one of them (reliance + habituation) supplied by the analyst on 2026-05-22 (comment 46). Confirm whether the analyst's mechanism should be the lead hypothesis in the drafted prose or whether the three should be presented at equal weight.
8. **Large demographic shifts — likely sample selection.** The ~11-point drop in mean share White and ~$12,800 rise in mean median household income (`../findings.md` §8 flag 4) are most likely a sample-composition effect (which hospitals stayed in the complete-case panel), per analyst review 2026-05-22 (comment 28/29). Verify and state as sample composition, not as population change.
9. **Reputational-stake citation.** ¶1 now includes a reputation bullet alongside the financial-stake bullet. A citation slot `[@TBD-reputation-citation]` needs to be filled — likely a study of consumer-facing star-rating use in hospital choice. To resolve via `/find-reference`.
10. **Authors and affiliations.** All author, affiliation, and corresponding-author fields are TBD in the frontmatter.

### Resolved during 2026-05-22 outline review (kept here for traceability)

- **% Hispanic coding** — *resolved.* Analyst confirmed `prop_hispanic` is built from ACS table A35AA (Hispanic or Latino), not the Asian-population numerator. No re-run needed; no manuscript caveat. See `[[project-hispanic-measure-resolved]]` memory and the closed flags in `../methods.md §9 flag 2` and `../findings.md §8 flag 2`.
- **Journal alignment** — *resolved.* AJPH is final; both project-level `../CLAUDE.md` and manuscript-level frontmatter now reflect the 2026-05-16 switch and the 2026-05-22 word-budget tightening.
