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

- [core] **Objectives** (~30 words): state the question — what hospital, operational, and county factors are associated with the overall HCAHPS star rating, and which explain the 2017→2024 change. `[data: research question, ../manuscript/CLAUDE.md]`
- [core] **Methods** (~45 words): U.S. acute-care hospitals reporting HCAHPS in Q1 2017 and the latest 2024 release wave (N = 2,380); ordinary least squares regression of the overall star rating on hospital, operational, and county factors, estimated separately for the 2017 rating, the 2024 rating, and the 2017→2024 change. `[data: ../methods.md §1, §7]`
- [core] **Results** (~70 words): mean rating fell 3.45 → 3.27 stars; most hospital, operational, and county factors were significantly associated with the rating in each year, but almost none were associated with the 2017→2024 change; government and small rural hospitals scored highest; shorter emergency department time was associated with higher ratings and with rating gains over the window. `[data: ../findings.md §1, §4, §5]`
- [core] **Conclusions** (~35 words): observable factors account for where ratings stand but little of how they move — payment-linked ratings reflect community context hospitals cannot change, while the modest movement that factors do explain runs through operations hospitals can change. `[data: ../framing.md §0]` <!-- OR-8 -->
- [support] *Note:* abstract Results lead with the significance pattern (which factors track levels vs change), state magnitude and direction in plain language, and avoid R² symbols and the word "coefficient." Translate consistently with the Results section.

---

## Introduction (4 paragraphs)

### ¶1 — Patient experience is a measured, payment-linked dimension of hospital quality

- [core] Topic sentence: hospital patient experience, measured by the HCAHPS survey, is publicly reported and tied to Medicare payment, so HCAHPS scores matter to hospitals both financially and reputationally. <!-- OR-1 -->
- [support] HCAHPS is the standardized national survey of inpatient experience; the Centers for Medicare & Medicaid Services (CMS) publishes overall star ratings on Care Compare `[@HttpsWwwhcahpsonlineorg; @HttpsWwwmedicaregovCarecompare]`.
- [core] Financial stake: under the Hospital Value-Based Purchasing program, the overall rating determines a portion of a hospital's Medicare reimbursement `[@wernerMedicaresNewHospital2012; @HttpsWwwcongressgovBill]`.
- [core] Reputational stake: because Care Compare publishes the star ratings on a public website, prospective patients consult the ratings when choosing a hospital, and the ratings become part of a hospital's public reputation independent of any payment formula `[@HttpsWwwmedicaregovCarecompare; @popeReactingRankingsEvidence2009; @gutackerChoiceHospitalWhich2016]`. <!-- OR-2 -->
- [optional] One sentence on why ratings as a payment-and-reputation signal are worth scrutinizing — measurement choices and survey-response trends affect both the payment and reputational signals `[@blandChallengesFacingCAHPS2022]`.
- [support] *Transition:* because ratings affect both payment and reputation, what they actually capture about a hospital matters. <!-- OR-5 -->

### ¶2 — What prior work shows about HCAHPS scores: cross-sectional determinants and recent-year trends

- [core] Topic sentence: prior research on HCAHPS scores falls into two main strands — what predicts a hospital's rating at a single point in time, and how ratings have changed nationally in recent years.
- [core] Cross-sectional work links ratings to hospital characteristics, nursing, and county factors `[@beckettInterventionsHospitalCharacteristics2024; @herrinHCAHPSScoresCommunity2018; @rosenbaumHospitalPerformanceHospital2024]`.
- [core] National-trend work documents the decline in patient experience during and after the pandemic — kept brief, as background; this paper's window brackets that decline rather than seeking to explain it `[@elliottChangesPatientExperiences2023; @beckettHospitalPatientExperience2025]`.
- [support] Pre-pandemic trend work establishes the flat-to-improving baseline the post-2017 decline reverses `[@beckettTrendsHCAHPSSurvey2024]`.
- [optional] A separate, smaller methodological literature examines how the rating is built and adjusted, motivating cautious interpretation rather than being this paper's subject `[@elliottUpdatedAdjustmentHCAHPS2025; @gettelCalculationOverallHospital2024]`. <!-- OR-7 -->
- [support] *Transition:* both strands describe ratings — at one time, or as a national average — but leave one question open.

### ¶3 — The gap: no hospital-level decomposition of rating levels versus rating change

- [core] Topic sentence: no study has modeled, at the hospital level, both where overall star ratings stand and how individual hospitals' ratings changed between a mature pre-pandemic baseline and post-pandemic stabilization, using the same hospital, operational, and county factors.
- [support] Cross-sectional determinant studies describe levels at one time but cannot say whether the same factors explain movement `[@herrinHCAHPSScoresCommunity2018]`.
- [support] National-trend studies trace the average trajectory but do not decompose hospital-level change against hospital and county factors `[@elliottChangesPatientExperiences2023; @beckettHospitalPatientExperience2025]`.
- [core] Why the distinction matters: if factors explain where ratings stand but not how they move, the policy reading of a rating change differs from the reading of a rating level.
- [support] *Transition:* this study addresses that gap directly.

### ¶4 — Objective and approach

- [core] Topic sentence: we examined which hospital, operational, and county factors are associated with the overall HCAHPS star rating, and which of those factors explain the 2017→2024 change in rating.
- [optional] Design: a hospital-level analysis comparing Q1 2017 with the most recent 2024 release wave, modeling rating levels in each year and the change between them.
- [optional] Year choice: the 2024 wave was selected both because it is the latest available and because it sits after the pandemic-era disruption — bracketing the pandemic period rather than analyzing it. The pandemic is not the focus of this study.
- [core] Framing: the paper is associational and decomposition-based; it contrasts which factors are associated with the rating in each single year against which are associated with the 2017→2024 change, and makes no causal claim.
- [support] No findings preview (AJPH convention).

---

## Methods (STROBE-informed; ~4 paragraphs)

**Render these content subheadings in the draft** (AJPH subheads Methods): *Data Sources and Study Sample* (¶5; the former ¶6 was merged into ¶5 on 2026-06-03, so paragraph numbering skips ¶6), *Measures* (¶7–¶8), *Statistical Analysis* (¶9). The `¶N —` labels below are outline scaffolding, not subheadings.

### ¶5 — Data sources and study sample  → subheading: **Data Sources and Study Sample**  *(¶6 merged into ¶5, 2026-06-03)*

- [core] Topic sentence (describes): we assembled a hospital-level dataset with two snapshots per hospital — the first-quarter 2017 release wave and the fourth-quarter 2024 release wave — combining patient-experience ratings with operational, county, demographic, and geographic measures.
- [core] Outcome source: the overall HCAHPS star rating came from the CMS Care Compare HCAHPS file; each rating summarizes a rolling 12-month survey window that closes before the release, so neither snapshot reflects discharges from its release year. The fourth-quarter 2024 wave reflects patient surveys collected across the four quarters of 2023 (January–December 2023), and the first-quarter 2017 wave reflects an analogous earlier window — patient surveys collected over the four quarters spanning 2015–2016, the window CMS publicly reported in early 2017 `[@HttpsWwwhcahpsonlineorg; @HttpsWwwmedicaregovCarecompare]`.
- [support] Hospital characteristics from CMS Hospital General Information; emergency department (ED) throughput from the CMS Timely and Effective Care file, 2017 and 2024 vintages `[@HttpsWwwmedicaregovCarecompare; @HttpsQualitynetcmsgovOutpatient]`.
- [support] County context: self-reported poor health from the Centers for Disease Control and Prevention (CDC) PLACES file `[@greenlundPLACESLocalData2022]`; hospital counts from the CMS Provider of Services file `[@HttpsDatacmsgovProvidercharacteristics]`; demographics from American Community Survey (ACS) 5-year estimates via IPUMS National Historical Geographic Information System (NHGIS) `[@mansonNationalHistoricalGeographic2024]`; rural-urban classification from U.S. Department of Agriculture Rural-Urban Commuting Area (RUCA) codes `[@HttpsWwwersusdagovDataproducts; @HttpsDeptswashingtoneduUwruca]`.
- [core] Sample — inclusion and exclusion (the paragraph's core): a U.S. acute-care hospital entered the analytic sample only if it reported an overall HCAHPS star rating in both the 2017 and 2024 release waves and had complete data, in both years, on every factor used in the models; the resulting complete-case sample is N = 2,380. `[data: ../methods.md §3]`
- [support] Exclusions (STROBE item): tabulate the hospitals dropped and the reason — missing rating, missing ED time, or missing county factor — so the sample can be reconstructed; consider a flow diagram if AJPH expects one. `[data: ../methods.md §9 flag 4]`
- [support] Linkage: each hospital was matched to its county context through its ZIP code and a ZIP-to-county crosswalk, and county factors were merged on county Federal Information Processing Standards (FIPS) code; the sources were combined into one record per hospital. `[data: ../methods.md §3]`

### ¶7 — Outcome and explanatory factors  → subheading: **Measures** (covers ¶7 and ¶8)

- [core] Topic sentence (describes): the outcome was the overall HCAHPS star rating, reported on a scale of 1 to 5.
- [core] Hospital factors: ownership recoded as government, non-profit, and for-profit; rural-urban classification classified as urban (RUCA 1–3), large rural or micropolitan (4–6), and small or isolated rural (7–10). `[data: ../methods.md §5]`
- [core] Hospital operational factor: the median time a patient spent in the ED (in minutes).
- [core] County factors: self-reported poor health prevalence; hospitals per 1,000 county residents; population size; the proportion of residents aged 65 and over; the proportion in each racial and ethnic group; the proportion foreign-born; the proportion with a bachelor's degree or above; the proportion in poverty overall and among adults 65 and over; median household income. `[data: ../methods.md §5]`
- [core] Fixed over the window: ownership and rural-urban classification were the same in both years and were treated as time-invariant. `[data: ../methods.md §6]`
- *ED measure-scope caveat — do NOT state it here (analyst, 2026-06-03).* The ED measure changed scope across the window, but that point is made once and only in Limitations (¶21). Describe the ED measure plainly in Methods (the median time a patient spent in the ED); add no comparability caveat, no OP-18 detail, and no forward-pointer in this section. ¶21 is the caveat's sole home.

### ¶8 — Change measures

- [core] Topic sentence (describes): for the change analysis, every time-varying factor had a matching 2017→2024 change measure, computed as the 2024 value minus the 2017 value.
- [core] The outcome change measure was the 2024 overall star rating minus the 2017 rating; the explanatory change measures covered ED time, hospitals per 1,000 county residents, and each county factor — the proportion aged 65 and over, racial and ethnic composition, the proportion foreign-born, education, poverty, median household income, and poor-health prevalence. `[data: ../methods.md §6]`
- [optional] *Transition:* these change measures fed the change model described next.

### ¶9 — Statistical analysis  → subheading: **Statistical Analysis**

- [core] Topic sentence (describes): we used linear regression with robust standard errors to examine the associations between the overall star rating and the hospital, operational, and county factors, fitting three models — a 2017 cross-sectional model, a 2024 cross-sectional model, and a model of the 2017→2024 change.
- [core] The cross-sectional models regressed the rating in a given year on those factors as measured in that year, identifying which factors were associated with the rating and whether those associations differed between 2017 and 2024; the change model regressed the change in rating on the changes in those factors and accounted for the time-invariant factors (ownership and rural-urban classification), identifying which factor changes were associated with the change in rating.
- [support] An augmented change model additionally controlled for the 2017 baseline levels of the time-varying factors (Table 2 column 4 = `t6` in `hospitallevel_do.do`). It does **not** control for the 2017 overall rating — earlier "baseline rating" wording was inaccurate per the Stata source. `[data: ../methods.md §7; ../stata/hospitallevel_do.do]`
- *Dropped (2026-06-03):* the subgroup re-estimation (change model by urban / large rural / small rural) and the nurse-salary-per-bed sensitivity check `[@rosenbaumHospitalPerformanceHospital2024]` were removed — by the same rule applied to the sub-domain models, their results are not reported in Results and are unverifiable from the repository (findings.md §6). The descriptive rural-trajectory numbers in ¶12 come from the main change model (Table 2), not the subgroup runs, so they are unaffected. See Open Questions #12.

---

## Results (3 paragraphs)

**Render these content subheadings in the draft:** *Sample Characteristics and National Trends* (¶10), *Factors Associated with Rating Levels in 2017 and 2024* (¶11), *Factors Associated with Rating Change* (¶12). Results consolidated 2026-06-03 from five paragraphs to three (former ¶11+¶12 → ¶11; former ¶13+¶14 → ¶12); paragraph numbering then continues at Discussion ¶16, so ¶13–¶15 are vacant. The `¶N —` labels are scaffolding.

**Results discipline (applies to every bullet below):** report what the study found — no inline citations, no comparison with prior literature (that is Discussion), and no narrating or ranking a result as "a finding" / "the central finding" (the section is findings by definition). Caveats are back-referenced in a clause, never re-explained. See outliner.md Results rule.

### ¶10 — Sample characteristics, the national shift, and the geographic pattern  → subheading: **Sample Characteristics and National Trends**

- [core] Topic sentence: after excluding hospitals with missing data in either year, the study sample included 2,380 hospitals; several factors shifted between 2017 and 2024. `[table 1]`
- [core] Composition: 66.5% for-profit, 18.7% non-profit, 14.8% government; 69.5% urban, 20.8% large rural, 9.7% small or isolated rural. `[data: ../findings.md §2]`
- [core] Headline shifts: mean overall rating declined 3.45 → 3.27 stars; median ED time fell 292 → 181 minutes. Report both figures plainly, with no comparability caveat in this section (the ED measure-scope caveat is made once, in Limitations ¶21). `[data: ../findings.md §3; table 1]`
- [support] Between-year shifts in the counties served: on average their population grew by 2.4% and became older, less White, more Hispanic, more foreign-born, and more educated, while median household income rose about $12,800. State these as observed between-year shifts and **stop there** — give the numbers, draw no inference here; the likely sample-composition explanation is given once, in Limitations (¶21). `[data: ../findings.md §8 flag 4; table 1]`
- [core] Geographic pattern (Figure 1): rating gains and losses appeared across the country, but improvement concentrated in three areas — Appalachia, Florida, and the West Coast — with gains and declines more intermixed elsewhere. Due to missing data, much of the sparsely populated interior West is unshaded. `[figure 1; data: ../findings.md §7]`
  - *Drafting note (2026-06-03):* this is a descriptive read of Figure 1, confirmed by the analyst (the three improvement clusters are Appalachia, Florida, and the West Coast). Keep it descriptive — it is a map reading, not a tested regional effect. If a reviewer presses, it can be backed by the gaining counties' FIPS values; the map's ZIP-to-county handling differs from the regression (methods flag 1), so make no quantitative regional claim here.

### ¶11 — Factors associated with rating levels in 2017 and 2024  → subheading: **Factors Associated with Rating Levels in 2017 and 2024**

*Combined from former ¶11 + ¶12 (2026-06-03). Bucket the description by factor type and report **direction and significance**, not magnitude — Table 2 carries the coefficients. The organizing point is cross-year consistency.*

- [core] Topic sentence: the factors significantly associated with the overall star rating were largely the same in 2017 and 2024, and the direction of each association held across the two years. `[table 2, columns 1–2; data: ../findings.md §4]`
- [core] Hospital-level factors (direction and significance, comparative to reference category): non-profit hospitals scored lower than government-owned hospitals in both years, while for-profit hospitals scored similarly to government in 2017 but lower by 2024; small rural hospitals scored higher than urban hospitals in both years, while large rural hospitals scored lower in 2017 but similar by 2024; and a longer median ED time was associated with a lower rating in both years. `[data: ../findings.md §4; table 2]`
- [core] County-level factors (direction and significance): in both years, higher ratings were associated with more hospitals per 1,000 residents, a higher prevalence of self-reported poor health, and a higher proportion holding a bachelor's degree or above, while lower ratings were associated with higher proportions aged 65 and over and foreign-born; higher poverty (overall and among adults 65 and over) was associated with lower ratings in 2024 but not in 2017. The counterintuitive positive sign on poor health is reported here plainly and interpreted in the Discussion (¶20) — no editorializing or forward-pointer in Results. `[data: ../findings.md §4, §8 flag 1; table 2]`
- *Removed from Results (2026-06-01):* the rural-vs-other-quality-measures comparison and its citations `[@vuPatientSatisfactionRural2024; @beckettInpatientCareExperiences2025]` belong in Discussion (¶17), not here.

### ¶12 — Factors associated with rating change  → subheading: **Factors Associated with Rating Change**

*Combined from former ¶13 (asymmetry pivot) + ¶14 (2026-06-03). Lead by naming what was associated with change; the broad null on county shifts is the asymmetry and carries the section. The headline framing stays in Discussion ¶16 — do not label this "the central finding" here.*

- [core] Topic sentence: in contrast to the broad set of factors associated with rating *levels* in each year, only a few were associated with the 2017→2024 *change* — among the factors that changed between 2017 and 2024, the change in ED time and the change in median household income; and among the hospital characteristics that did not change over the window, ownership and rural-urban classification. `[table 2, columns 3–4]` <!-- OR-3 -->
- [core] ED time: a reduction in ED time was associated with a small rating gain, about 0.002 stars per minute. Report this as a within-hospital association in stars per minute; do not convert it into a national-mean star gain, and add no measure caveat here. `[data: ../findings.md §5]`
- [support] Median household income: its association with rating change reached significance but was near zero in magnitude. `[data: ../findings.md §5; table 2]`
- [core] No other county shift was associated with the change in rating. (State the null in one clause; do not enumerate the individual nulls, and keep the "population composition does not explain the rating shift" reading out — that is interpretation, Discussion not Results.) `[data: ../findings.md §5]`
- [support] Among the hospital characteristics that did not change over the window, rural hospitals gained more relative to urban (large rural +0.12, small rural +0.19 stars), and for-profit and non-profit hospitals declined more than government hospitals. Use the full model (Table 2 column 4, baseline-controlled) figures, consistent with the ED coefficient. `[data: ../findings.md §5, §8; table 2 column 4]`
- *Note (2026-06-03):* the rural and ownership trajectory numbers come from the main change model (Table 2, change columns) and are verifiable; the dropped rural-subgroup re-estimation (¶9) is not needed for this paragraph. The difference-map description moved to ¶10 per analyst direction.

---

## Discussion (6 paragraphs)

### ¶16 — Principal findings

- [core] Topic sentence: most hospital, operational, and county factors were significantly associated with where overall HCAHPS ratings stood in 2017 and 2024, but almost none of those same factors were significantly associated with how ratings moved between the two years.
- [support] Restate the asymmetry plainly and note the cross-sectional structure held steady across the two years.
- [core] Name the one operational factor that did track rating change — within-hospital ED time — and note county shifts did not. State the ED association in stars-per-minute terms only, with no measure caveat here (the agency interpretation is in ¶19; the ED measure-scope caveat is in ¶21).
- [support] *Transition:* this pattern fits and extends what prior work has shown.

### ¶17 — Comparison with prior literature

- [core] Topic sentence: the cross-sectional associations align with existing determinant studies, and the change finding extends the national-trend literature by decomposing hospital-level movement.
- [support] The cross-sectional findings echo prior work on county factors and hospital characteristics `[@herrinHCAHPSScoresCommunity2018; @beckettInterventionsHospitalCharacteristics2024]`.
- [core] The national decline matches the documented pandemic-era trajectory; this paper adds that, at the hospital level, almost none of the observable factors that track rating *levels* are also significantly associated with the hospital's rating *change* across the window `[@elliottChangesPatientExperiences2023; @beckettHospitalPatientExperience2025]`.
- [optional] The rural advantage is consistent with recent work showing rural and critical access hospitals outperform on patient experience `[@vuPatientSatisfactionRural2024; @beckettInpatientCareExperiences2025]`.
- [support] *Transition:* the asymmetry carries a paired policy message.

### ¶18 — Implication 1: rating levels reflect community context, a problem for payment-linked ratings

- [core] Topic sentence: because many county factors hospitals cannot change are significantly associated with rating levels, payment-linked ratings systematically disadvantage hospitals serving structurally disadvantaged communities.
- [core] CMS patient-mix adjustment corrects for individual patient characteristics but not community context, so this disadvantage survives current adjustment `[@elliottUpdatedAdjustmentHCAHPS2025]`.
- [support] The National Academies set out the rationale for adjusting quality measures for social risk; these results give updated, HCAHPS-specific support `[@committeeonaccountingforsocioeconomicstatusinmedicarepaymentprogramsAccountingSocialRisk2016]`.
- [core] Implication: CMS should consider adding community-context adjusters or reporting context-adjusted scores alongside the raw stars. (State the implication directly; do not package it as "the bad-news half of the message" — that is framing-memo register.)
- [support] *Transition:* the change side of the asymmetry carries the opposite message.

### ¶19 — Implication 2: rating change tracks operations, so hospitals retain agency over trajectory

- [core] Topic sentence: because the one operational factor significantly associated with rating *change* is ED throughput — an operation hospitals can change — hospitals retain real, if narrow, agency over their rating trajectory. Frame the agency claim as a *within-hospital* association (stars per minute of ED time): a hospital that genuinely shortens its ED time tends to gain a little on the rating. Keep it to a single hospital's trajectory and add no measure caveat here — the ED measure-scope caveat is made once, in Limitations (¶21).
- [core] Scope this agency claim narrowly to operations (ED throughput); ownership and rural-urban trajectory differences are descriptive supporting findings, not part of the agency claim (resolved framing decision, analyst, 2026-05-21).
- [core] Conceptual anchor — the agency claim rests on more than one coefficient (restored 2026-06-03; was dropped from this paragraph). The asymmetry itself supplies the logic: because county shifts were *not* associated with rating change (¶12), what moves a hospital's rating is within-hospital and operational rather than environmental. This guards against the residual-equals-control leap — "observable factors do not explain change" does not by itself prove hospitals control it, but the *direction* of the one factor that does move with change (ED throughput, an operation) points to within-hospital action as where the lever is. This reading is consistent with the within-hospital, partly idiosyncratic trajectory in the pandemic-era trend work `[@elliottChangesPatientExperiences2023; @elliottUpdatedAdjustmentHCAHPS2025]`. *Verify at drafting that the cited Elliott analyses support a within-hospital/operational characterization of trajectory; if they do not, carry the anchor on the county-null logic alone and drop those two keys — per the no-fabricated-citations discipline.*
- [support] The ED-throughput-to-satisfaction link is supported by the wait-time literature `[@mostafaStrategiesMeasureImprove2024; @bleusteinWaitTimesPatient2014; @soremekunFrameworkAnalyzingWait2011]`.
- [core] Implication: the operational room to improve a rating is narrower than the cross-sectional picture suggests, but it is real. (State it directly; do not package it as "the good-news half of the message.")
- [optional] Supporting context (descriptive, kept brief): rural hospitals gained ground on patient experience even amid documented rural-hospital financial fragility `[@HttpsWwwahaorgGuidesreports; @HttpsAspehhsgovSites]`; for-profit and non-profit hospitals declined more than government hospitals `[@chenEffectPatientQuality2023]`.
- [support] *Transition:* one finding still needs explanation.

### ¶20 — Interpreting the counterintuitive poor-health sign and cautions on attributing the decline

- [core] Topic sentence: the positive association between county self-reported poor health and ratings runs against expectation and should be read cautiously.
- [support] Offer three calibrated explanations, noting the design cannot adjudicate: (a) lower care expectations in higher-burden communities — the same experience clears a lower bar, the disconfirmation mechanism that also plausibly underlies the rural advantage `[@cassidy-smithDisconfirmationParadigmThroughput2007; @vuPatientSatisfactionRural2024]`; (b) hospital reliance and habituation — in higher-burden communities, patients lean on the hospital more, perceive it as the source of their improved health, and become familiar with its staff and processes, all of which can raise reported experience (analyst hypothesis; no specific supporting study in the literature); and (c) a statistical reading — poor health is entered alongside its own socioeconomic causes, so its coefficient is a mutually-adjusted residual, not the effect of community sickness (the "Table 2 fallacy") `[@westreichTable2Fallacy2013]`. `[data: ../findings.md §8 flag 1]` <!-- OR-4 -->
- [core] Broader caution: because observable structural factors are not associated with rating change, a rating shift is not a reliable signal of community-driven structural change; attributing the post-2017 decline to the pandemic or to demographic change would require more granular within-hospital data. `[data: ../framing.md §3C]` <!-- OR-6 -->
- [support] *Transition:* these readings hold within the study's limits.

### ¶21 — Limitations

- [core] Topic sentence: several limitations bound the interpretation.
- [core] Design: associational and decomposition-based — no causal claim; the two-snapshot change model nets out time-invariant hospital traits but cannot identify mechanisms.
- [core] Measurement — the ED measure is not comparable across the two years, and this is the single most important caveat on the ED finding; develop it fully here, as this is its only home in the paper. Explain the mechanism plainly: in 2017 the Care Compare ED-time value reflected *all* emergency patients, including psychiatric/mental-health patients and patients transferred to another facility — groups that routinely spend many hours in the ED; by 2024 the value behind the same label reflected only *discharged* patients, excluding those long-staying cases (the OP-18a → OP-18b scope narrowing; verified 2026-05-26, `../findings.md §9`). The reported 292 → 181-minute (38%) drop is therefore mostly a change in which patients are counted, not a real operational gain; independent national ED-throughput sources (Emergency Department Benchmarking Alliance; CMS Care Compare medians; national wait-time series) corroborate at most a ≤20-minute real decline. The within-hospital Δ ED-time coefficient remains interpretable as an association, but it should not be multiplied by the observed mean drop to claim a national-mean rating gain — doing so would overstate a real ED-driven gain that is at most ≈0.04 stars. `[data: ../findings.md §8 flag 3, §9; @HttpsQualitynetcmsgovOutpatient]`
- [support] Sample composition: the analytic panel's between-year shifts in county mix — notably the ~11-percentage-point fall in mean share White and the ~$12,800 rise in mean median household income reported in ¶10 — are larger than seven years of real population change would produce and most likely reflect which hospitals remained in the complete-case panel across the window (sample selection), not population change or an ACS tabulation/inflation artifact. They bear on generalizability, not on the within-panel associations. `[data: ../findings.md §8 flag 4]`
- [support] Scope: only the overall star rating is the outcome; intra-pandemic dynamics, hospital fixed effects beyond the change model, and a critique of Star Ratings methodology are out of scope `[@elliottChangesPatientExperiences2023; @gettelCalculationOverallHospital2024]`.

### ¶22 — Conclusions

- [core] Topic sentence: most observable factors track where HCAHPS ratings stand; almost none track how they move, and that asymmetry should shape how ratings are used.
- [core] For payment policy: pair raw stars with community-context adjustment so hospitals are not penalized for the populations they serve.
- [core] For hospital management: trajectory remains partly within reach through operational improvement, most visibly ED throughput.
- [support] Close on the paired message without overclaiming either half.

---

## Exhibits

- [support] **Table 1** — Descriptive statistics: hospital, operational, and county factors, 2017 and 2024 snapshots, with the 2017→2024 change. Source: `../fig_tables.xlsx` sheet `table1`.
- [core] **Table 2** — Regression results, four columns: 2024 rating, 2017 rating, change (basic), change (with 2017 baselines). Source: `../fig_tables.xlsx` sheet `table2`.
- [support] **Figure 1** — County map of the 2017→2024 change in mean overall star rating (diverging palette: red = decline, blue = improvement). Source: `../fig_tables.xlsx` sheet `fig1`, generated by `../stata/do 1.do`.
- [optional] **Appendix** — Per-year county star-rating maps (eight release waves, 2017–2024).

---

## Open questions

1. **Word budget tightened to ~3,000.** Per analyst direction 2026-05-22, the working main-text budget is ~3,000 words (down from AJPH's 3,500 cap). `[optional]` bullets in this outline are the first to cut; `[support]` bullets that add only color are next. Re-rank any bullet whose tier no longer fits the tighter budget.
2. **ED-time measure-definition change — resolved 2026-05-26 (mostly measure-scope change).** The 111-minute (38%) drop is mostly a Care Compare measure-scope narrowing (OP-18a all-patient overall rate → OP-18b discharged-only), not a real national operational gain. Independent ED-throughput sources (Emergency Department Benchmarking Alliance; CMS Care Compare national medians; NHAMCS-style wait times) corroborate at most a ≤20-minute real decline. The within-hospital Δ ED time coefficient remains interpretable; the implied national-mean ED-driven star gain is ≤0.04 stars (not 0.11–0.22). **Caveat placement — revised 2026-06-03 (analyst):** make this point once and only in Limitations (¶21). ¶7 (Measures), ¶10 (sample characteristics), ¶12 (change Results), ¶16 (principal findings), and ¶19 (Implication 2) now report the ED figures and the within-hospital coefficient plainly, with **no** comparability caveat, OP-18 detail, or forward-pointer; ¶21 develops the full mechanism and is the caveat's sole home. Full verdict in `../findings.md §9`; one residual item remains TBD-direct-PDF-diff (cover-page comparison of OQR Specifications Manual versions v10.0, v13.0, v19.0 against the QualityNet archive, https://qualitynet.cms.gov/outpatient/specifications-manuals) for the analyst to confirm.
3. **Unverified estimates — resolved by removal 2026-06-03.** The three analyses that lived only in `t2.txt` / `t3.txt` in OneDrive and could not be verified from the repository (`../findings.md` §6, §8 flag 7) — sub-domain-augmented models, the rural-subgroup re-estimation, and the nurse-per-bed sensitivity check — have all been dropped from the outline (¶7, ¶9) rather than carried as unverifiable claims. The manuscript as now scoped reports only estimates present in Table 2 / `../fig_tables.xlsx`. The rural and ownership trajectory numbers in ¶12 come from the main change model (Table 2), which is verifiable, so no out-of-repository retrieval is required for drafting. If the analyst later wants any of the three reinstated, retrieve and verify the source file first.
4. **Change R² — resolved 2026-05-28.** Per analyst direction, the paper's aim is the *significance pattern* (which factors are associated with rating levels vs change), not the explanatory power of the model. The change-R² supporting line has been dropped from ¶14 and ¶16, and the matching levels-R² (≈24%) mentions have been dropped from ¶11 and ¶16, so the asymmetry is carried entirely by the significance pattern. No R² figure is cited in the outline body. The Methods narrative may still mention model fit in passing, but it does not anchor any finding.
5. **Reporting guideline.** STROBE is followed loosely. Confirm whether AJPH requires a completed STROBE checklist and whether a sample flow diagram is expected.
6. **Human Participant Protection statement.** Note (resolved, not an open question): the study uses publicly available, de-identified data, so institutional review board review was not required, and the ¶9 ethics bullet was removed. AJPH Original Research still requires a brief Human Participant Protection statement as a back-matter element — add a one-sentence declaration at drafting (review not required; publicly available, de-identified data), placed in back matter rather than the Methods narrative.
7. **Positive poor-health sign.** The ¶20 explanation now includes three candidate mechanisms, one of them (reliance + habituation) supplied by the analyst on 2026-05-22 (comment 46). Confirm whether the analyst's mechanism should be the lead hypothesis in the drafted prose or whether the three should be presented at equal weight.
8. **Large demographic shifts — likely sample selection.** The ~11-point drop in mean share White and ~$12,800 rise in mean median household income (`../findings.md` §8 flag 4) are most likely a sample-composition effect (which hospitals stayed in the complete-case panel), per analyst review 2026-05-22 (comment 28/29). Verify and state as sample composition, not as population change.
9. **Reputational-stake citation — resolved 2026-05-28.** Pope 2009 (J Health Econ 28(6):1154-1165) and Gutacker et al. 2016 (J Health Econ 50:230-246) selected as the ¶1 anchors — Pope is the canonical demand-side-response argument; Gutacker complements with evidence on which quality dimensions enter hospital choice. Both imported to Zotero and present in the bib (keys: `@popeReactingRankingsEvidence2009`, `@gutackerChoiceHospitalWhich2016`). R3 (Hu & Nerenz) not selected; see `../reference-research.md` §R1-R3. Chakraborty & Church 2020 (`@chakrabortySocialMediaHospital2020`) also imported — available for Discussion use if a HCAHPS-external-validity anchor is wanted at drafting.
10. **Authors and affiliations.** All author, affiliation, and corresponding-author fields are TBD in the frontmatter.
11. **Emphasis rebalance + agency anchor — applied 2026-06-03.** Two outline changes made after the analyst judged the first draft under-served its own contribution. (a) *Results emphasis:* the cross-sectional levels story was compressed from three paragraphs to two (old ¶11 "most factors significant + stable" folded into the new ¶11 topic sentence), so the well-trodden background no longer out-weights the novel change story; the levels-vs-change asymmetry is now the section pivot (¶13) with the strongest topic sentence, and the change story closes the section (¶14). Net Results paragraph count 6 → 5, freeing room under the ~3,000-word budget. (b) *Agency half:* per analyst direction (strengthen within the dual frame, not demote it), ¶19 now anchors the hospital-agency claim on the community-change null plus the within-hospital trajectory reading — not on Δ ED time alone — and explicitly guards against the residual-equals-control leap. The Elliott staffing-resilience citation was restored with a drafting-time verification flag (no-fabricated-citations discipline). The dual policy headline (framing.md §0/§5) is unchanged. *(Partly superseded by #13: the five-paragraph Results structure described here was further consolidated to three paragraphs on 2026-06-03; current Results paragraphs are ¶10–¶12.)*

12. **Methods revision — applied 2026-06-03 (analyst pass over ¶5–¶9).** (a) *¶5/¶6 merged* into one *Data Sources and Study Sample* paragraph (analyst: ¶6 did not warrant its own paragraph and its topic sentence duplicated ¶5); the sample inclusion/exclusion criteria are now the merged paragraph's core. Paragraph numbering intentionally **skips ¶6** to avoid renumbering Results/Discussion. (b) *"Market" factor eliminated* throughout — hospitals per 1,000 residents is county-built and now sits with the county factors, leaving the clean hospital/operational/community triad (analyst: "market" was abstract). (c) *Sub-domain star ratings removed* from ¶5, ¶7, and ¶9 because their augmented-model results are not reported in Results and are unverifiable from the repository (findings.md §6); ¶9's augmented model is now only the 2017-baseline change model that maps to Table 2 column 4. (d) *Time-invariant factors* (ownership, rural-urban) now introduced once in ¶7; ¶8 names which factors have change measures. (e) *Subgroup + sensitivity dropped from ¶9* — the rural-subgroup re-estimation and the nurse-per-bed staffing check were removed for the same reason as the sub-domain models (results not in Results, unverifiable from the repository); see Open Questions #3. (f) *2024 release wave — resolved 2026-06-03.* `date_id` ranks distinct survey-window start dates, so `date_id=23` is the latest. Cross-referencing the HCAHPS public-reporting schedule (quarterly refreshes over rolling four-quarter windows; the January 2026 refresh covers April 2024–March 2025, validated against the independently stated Spring 2025 refresh = July 2023–June 2024), the last refresh published in calendar 2024 was the **October 2024 refresh**, whose survey window is **January–December 2023**. By the same schedule, the first-quarter 2017 wave (`date_id=1`) draws on the rolling window CMS reported in early 2017 — patient surveys collected over **2015–2016** (exact months depend on whether it is the January vs April 2017 refresh, a one-quarter shift that only the raw `date2` settles; the 2015–2016 survey span holds either way, and the COVID gap does not affect this calendar mapping). ¶5 prose uses quarter labels consistently — the **fourth-quarter 2024** wave (the October 2024 refresh) and the **first-quarter 2017** wave — and states that each reflects pre-release-year survey data (2024 wave → 2023 surveys; 2017 wave → 2015–2016 surveys). Re-draft Methods against this revision.

13. **Results consolidation — applied 2026-06-03 (analyst pass over Results).** Results compressed from five paragraphs to three. (a) *¶10* now also carries the **Figure 1 difference-map description** (gains and losses interspersed nationally, no pronounced regional pattern, sparsely populated interior West unshaded for lack of a both-years reporting hospital), and reports the panel's White-share / income shifts as **between-year numbers only** — the sample-selection interpretation moved to Limitations (¶21). (b) *¶11* merges the two former levels paragraphs into one *Factors Associated with Rating Levels in 2017 and 2024* paragraph, organized by factor type (hospital-level: ownership, rurality, ED time; county-level: positive — hospital supply, poor-health prevalence, education; negative — age 65+, foreign-born, poverty), reporting **direction and significance rather than magnitude** (Table 2 holds the coefficients); the organizing point is cross-year consistency. (c) *¶12* merges the asymmetry pivot and the "what moved" paragraph into one *Factors Associated with Rating Change* paragraph whose topic sentence names what was associated (time-varying: Δ ED time, Δ income; time-invariant: ownership, rurality), then develops Δ ED time, notes Δ income is near zero in one sentence, states the broad community-shift null (the asymmetry), and reports the ownership/rurality trajectory differences. Paragraph numbering now skips ¶13–¶15 (Discussion continues at ¶16). Re-draft Results against this structure.

### Resolved during 2026-05-22 outline review (kept here for traceability)

- **% Hispanic coding** — *resolved.* Analyst confirmed `prop_hispanic` is built from ACS table A35AA (Hispanic or Latino), not the Asian-population numerator. No re-run needed; no manuscript caveat. See `[[project-hispanic-measure-resolved]]` memory and the closed flags in `../methods.md §9 flag 2` and `../findings.md §8 flag 2`.
- **Journal alignment** — *resolved.* AJPH is final; both project-level `../CLAUDE.md` and manuscript-level frontmatter now reflect the 2026-05-16 switch and the 2026-05-22 word-budget tightening.
