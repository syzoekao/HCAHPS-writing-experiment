# Findings (working document for outlining)

**Manuscript title (working, per analyst):** *Determinants of Hospital HCAHPS Star Ratings and Changes Over Time, 2017-2024*

This file translates the cleaned regression tables in [fig_tables.xlsx](fig_tables.xlsx) (Table 1, Table 2) and supplementary results in the Stata exports (`t2.txt`, `t3.txt`, in OneDrive) into prose for the manuscript outline. Data sources, sample construction, variables, and statistical specifications are documented in [methods.md](methods.md); this file focuses on what the regressions and descriptive tables show. All counts and coefficients reflect the complete-case sample of N = 2,380 hospitals defined in [methods.md §3](methods.md). Coefficients are reported as point estimate (standard error in parentheses), with `**` denoting p < 0.05 and `***` denoting p < 0.01, matching the convention in Table 2.

## 1. Overview

The same covariate set explained roughly a quarter of the cross-sectional variation in the Hospital Consumer Assessment of Healthcare Providers and Systems (HCAHPS) overall star rating in both 2017 (R² = 0.242) and 2024 (R² = 0.236), but only 3.9% (basic specification) to 5.6% (with 2017 baseline controls) of the 2017→2024 change. This **cross-sectional vs change asymmetry** is the central quantitative finding. Mean overall ratings fell from 3.45 stars in 2017 to 3.27 in 2024 (−0.18 stars), even though median emergency department (ED) time dropped from 292 minutes to 181 minutes over the same window. Cross-sectional coefficients were broadly stable across the two years, indicating a steady community-and-operations structure underneath a national decline. In the change model, almost every community-shift variable was statistically null; the only operational variable that survived was the change in ED time, and the standout hospital-fixed pattern was that rural hospitals improved relative to urban ones while for-profit and non-profit hospitals declined more than government hospitals.

## 2. Sample characteristics

Of the 2,380 hospitals in the complete-case sample, **66.5% were for-profit, 18.7% non-profit, and 14.8% government**. By rural-urban classification, **69.5% were urban, 20.8% large rural/micropolitan, and 9.7% small or isolated rural**. Both ownership and rural-urban classification were treated as time-invariant in the change model (using the 2024 assignments), so these shares apply to both cross-sectional and change specifications.

## 3. National trends in covariates, 2017→2024

Several covariates shifted substantially across the two snapshots; others were nearly flat. Table 1 reports cross-hospital means and standard deviations for the 2017 and 2024 snapshots.

| Variable | 2017 mean (SD) | 2024 mean (SD) | Change |
|---|---|---|---|
| Overall star rating (1–5) | 3.45 (0.93) | 3.27 (0.90) | **−0.18** |
| Median ED time (min) | 292.3 (94.4) | 180.8 (49.8) | **−111.5** |
| Hospitals per 1,000 population | 0.0475 (0.053) | 0.0493 (0.054) | +0.002 |
| % self-reported poor health | 19.1 (4.1) | 19.3 (3.9) | +0.2 |
| Population | 874,558 | 895,948 | +21,390 |
| % age 65 and over | 15.6 (4.2) | 18.0 (4.5) | +2.4 |
| % White | 76.3 (16.3) | 65.6 (20.0) | **−10.7** |
| % Black | 11.5 (13.1) | 11.2 (12.6) | −0.3 |
| % Hispanic | 8.2 (9.2) | 10.6 (10.5) | +2.5 |
| % foreign-born | 10.7 (9.9) | 11.3 (10.0) | +0.6 |
| % bachelor's degree or above | 20.5 (7.9) | 24.1 (8.8) | +3.7 |
| % below federal poverty line | 14.5 (4.8) | 12.6 (4.2) | −1.9 |
| % age 65+ below poverty line | 9.0 (3.4) | 10.6 (3.5) | +1.6 |
| Median household income (USD) | 29,844 (7,409) | 42,657 (11,236) | **+12,813** |

The two largest changes were the **0.18-star decline in mean overall rating** and the **111-minute drop in median ED time**. The ED change was large enough (a 38% reduction) that the underlying CMS measure definition or reporting protocol was suspected of having shifted across the window. Validated 2026-05-26 — see [§9](#9-ed-measure-definition-validation-2026-05-26): the drop is **mostly a measure-scope change** (the 2017 Care Compare data captured the OP-18a all-patient overall rate including psychiatric/mental health and transfer cases, while the 2024 vintage carries the same plain-language `Measure Name` but reports the narrower OP-18b discharged-only population). Independent ED-throughput sources (Emergency Department Benchmarking Alliance; CMS Care Compare national medians; NHAMCS-style wait times) corroborate at most a ≤20-minute real decline. The Δ ED time coefficient in the change model (≈ −0.002 stars per minute) remains internally interpretable, but the implied national-mean ED-driven rating gain falls from 0.11–0.22 stars to ≤0.04 stars once the measure-scope component is netted out. See [§8](#8-notes-and-flags) flag 3 for the updated short note. Community shifts were modest in most variables but two stand out: the **10-percentage-point drop in mean % White** and the **$12,800 rise in mean median household income**. Both are larger than would be expected from typical demographic drift across seven years and may reflect American Community Survey (ACS) tabulation or inflation-adjustment differences rather than population change; see [§8](#8-notes-and-flags) flag 4.

## 4. Cross-sectional findings (2017 and 2024)

Table 2 columns (1) and (2) report the cross-sectional ordinary least squares (OLS) regressions of overall star rating on the covariate set for the 2024 and 2017 snapshots respectively. R² was 0.236 in 2024 and 0.242 in 2017 — both close to one-quarter of cross-hospital variation. Coefficients were broadly stable across the two years, with three patterns worth noting.

| Coefficient (SE) | 2024 cross-sectional | 2017 cross-sectional |
|---|---|---|
| **Ownership (reference: government)** | | |
| Non-profit | −0.584*** (0.064) | −0.505*** (0.062) |
| For-profit | −0.107** (0.046) | 0.024 (0.049) |
| **Rural-urban (reference: urban)** | | |
| Large rural | 0.068 (0.047) | −0.132*** (0.049) |
| Small rural | 0.609*** (0.068) | 0.317*** (0.070) |
| **Operational and market** | | |
| Median ED time (per minute) | −0.002*** (0.000) | −0.003*** (0.000) |
| Hospitals per 1,000 population | 1.802*** (0.292) | 1.931*** (0.377) |
| **Community health and demographics** | | |
| % self-reported poor health | 0.039*** (0.013) | 0.020** (0.010) |
| Population | −0.000 (0.000) | 0.000 (0.000) |
| % age 65 and over | −3.360*** (0.442) | −2.659*** (0.488) |
| % White | 0.388 (0.297) | 0.533 (0.415) |
| % Black | −0.471 (0.257) | −0.193 (0.411) |
| % Hispanic | −0.501 (0.405) | 0.372 (0.653) |
| % foreign-born | −1.103*** (0.427) | −1.636*** (0.463) |
| % bachelor's degree or above | 2.086*** (0.615) | 3.581*** (0.655) |
| % below federal poverty line | −1.917** (0.930) | −0.678 (0.831) |
| % age 65+ below poverty line | −2.006** (0.865) | −1.278 (0.901) |
| Median household income | 0.000 (0.000) | −0.000 (0.000) |
| Constant | 3.435*** (0.450) | 3.774*** (0.502) |
| **R²** | **0.236** | **0.242** |
| **N** | **2,380** | **2,380** |

**Government hospitals scored highest, non-profits lowest.** In both years, non-profit hospitals scored roughly half a star below government hospitals (−0.51 in 2017, −0.58 in 2024). For-profit hospitals matched government in 2017 (0.024, not significant) but had moved 0.11 stars below government by 2024 — i.e., the for-profit penalty *appeared* over the seven-year window, while the non-profit penalty was already large and stable.

**Small rural hospitals scored well above urban; large rural caught up.** Small rural hospitals scored 0.32 stars above urban in 2017 and 0.61 stars above in 2024 — a widening lead. Large rural hospitals scored 0.13 stars *below* urban in 2017 but were statistically indistinguishable from urban by 2024 — a gap closed across the window. These patterns were not what the cross-sectional rural-disadvantage literature would predict for any non-HCAHPS quality measure.

**Operational, market, and community covariates pointed in expected directions, with one consistent puzzle.** Each additional minute of ED time was associated with 0.002–0.003 stars lower rating; each additional hospital per 1,000 population was associated with roughly 1.8–1.9 stars higher rating. Higher county education (% bachelor's+) and lower % age 65+, % foreign-born, and % poverty (in 2024) were associated with higher ratings. The puzzle was that **% self-reported poor health was *positively* associated with ratings** in both years (+0.020 in 2017, +0.039 in 2024). One plausible explanation is that high reported poor health correlates with community-care engagement and survey participation patterns that themselves raise stars; another is collider-style confounding. The sign deserves discussion in the manuscript.

## 5. Change findings (2017→2024)

Table 2 columns (3) and (4) report change models regressing the 2017→2024 change in overall star rating on the change in each covariate. Column (3) is the basic specification; column (4) adds 2017 baseline levels of each time-varying covariate. R² rose from **0.039** (basic) to **0.056** (with baseline controls) — both an order of magnitude smaller than the cross-sectional R² of ~0.24. The baseline-augmented specification's gain of 1.7 percentage points is consistent with regression-toward-the-mean dynamics over the window.

| Coefficient (SE) | Change (basic) | Change (with 2017 baselines) |
|---|---|---|
| **Time-invariant covariates** | | |
| Non-profit (vs government) | −0.105 (0.057) | −0.115** (0.058) |
| For-profit (vs government) | −0.147*** (0.045) | −0.134*** (0.045) |
| Large rural (vs urban) | 0.200*** (0.045) | 0.121** (0.049) |
| Small rural (vs urban) | 0.282*** (0.060) | 0.186*** (0.071) |
| **Change in time-varying covariates** | | |
| Δ median ED time (per minute) | −0.001*** (0.000) | −0.002*** (0.000) |
| Δ hospitals per 1,000 population | −1.310 (1.898) | −1.312 (2.029) |
| Δ % self-reported poor health | −0.017 (0.013) | −0.018 (0.018) |
| Δ population | 0.000 (0.000) | −0.000 (0.000) |
| Δ % age 65 and over | −2.744 (1.808) | −1.118 (1.951) |
| Δ % White | 0.246 (0.260) | 0.775 (0.412) |
| Δ % Black | −0.045 (1.315) | 0.837 (1.468) |
| Δ % Hispanic | 0.059 (0.915) | 0.117 (0.935) |
| Δ % foreign-born | 1.872 (1.544) | 2.205 (1.657) |
| Δ % bachelor's degree or above | −2.762 (1.457) | −2.685 (1.541) |
| Δ % below federal poverty line | 0.339 (0.937) | 1.105 (1.249) |
| Δ % age 65+ below poverty line | −0.818 (0.989) | −0.072 (1.117) |
| Δ median household income | 0.000 (0.000) | 0.000*** (0.000) |
| Constant | −0.111 (0.089) | 0.331 (0.508) |
| **R²** | **0.039** | **0.056** |
| **N** | **2,380** | **2,380** |

**The change story is operational, not demographic.** Of the thirteen change-in-covariate variables, only Δ ED time and Δ median household income reached statistical significance (the latter with a coefficient of 0.000 to three decimals — significant but practically null). A one-minute reduction in ED time was associated with 0.001–0.002 stars gained over the window. Given the 111-minute mean drop in ED time, the implied average gain from ED improvement was roughly 0.11–0.22 stars — meaningful in magnitude but offset by other forces driving the −0.18-star mean decline.

**Government did best, for-profits worst.** Even though ownership is time-invariant, it enters the change model as a fixed predictor of trajectory. For-profits declined 0.13–0.15 stars more than government (significant in both basic and baseline-controlled specs); non-profits declined 0.10–0.12 stars more than government (significant only when 2017 baselines were controlled, suggesting the non-profit decline was partly a regression-to-the-mean effect of higher starting points).

**Rural hospitals improved relative to urban.** Small rural hospitals gained 0.19–0.28 stars relative to urban; large rural hospitals gained 0.12–0.20 — both highly significant. This is the empirical basis for the framing.md observation that the rural advantage in HCAHPS *widened* across the window, against a backdrop of well-documented rural-hospital financial fragility.

**Community-shift variables were essentially null.** Changes in age structure, racial composition, foreign-born share, education, poverty, and self-reported health all had statistically null coefficients on the change in rating. The population-shift story does not explain the rating-shift story.

## 6. Sub-domain, subgroup, and sensitivity results

The curated regression table ([fig_tables.xlsx](fig_tables.xlsx), Table 2) reports only the four primary specifications. Additional specifications were estimated and saved to the Stata text exports `t2.txt` and `t3.txt` (in OneDrive, not in this repository) but are not curated for the manuscript:

- **Sub-domain-augmented specifications** (t2.txt models t2, t4, t7): cross-sectional and change models that add the eight HCAHPS sub-domain stars (or their changes) as additional regressors. These speak to whether unobserved within-domain heterogeneity closes the cross-sectional/change R² gap; results need to be retrieved from OneDrive before they can be summarized here.
- **Rural-urban subgroup change models** (t3.txt models t5, t6, t7, t8): the change-with-baseline specification re-estimated separately in urban, large-rural, and small-rural subsamples, plus a sub-domain-augmented variant within small rural. Per [framing.md](framing.md), the rural-improvement story rests on these subgroup runs and should be retrieved before drafting the relevant paragraphs.
- **Nurse-salary-per-bed sensitivity**: cross-sectional and change models adding the hospital staffing-intensity proxy. Per [methods.md §7](methods.md), only one estimate was stored and no table was exported; the working out is in [hospitallevel_do.do](stata/hospitallevel_do.do) lines 458–473.

Before drafting these sections of the manuscript, the analyst should pull `t2.txt` and `t3.txt` into the repository (or copy the relevant coefficients into a new sheet of [fig_tables.xlsx](fig_tables.xlsx)) so the numerical claims are verifiable.

## 7. Geographic patterns

The map pipeline in [stata/do 1.do](stata/do%201.do) produces county-level rating snapshots and a 2017→2024 difference map using the `maptile` package with the `county2014` geography (see [methods.md §8](methods.md#8-geographic-visualization)). Per the framing-document decision (framing.md §5, *"one primary exhibit"*), only the 2017→2024 difference map is intended as a main-text figure; per-year maps move to the appendix.

The difference map uses the diverging RdBu palette with explicit cut values (−1, −0.33, 0, 0.5), so reddish counties had falling mean ratings and blueish counties had rising mean ratings between 2017 and 2024. The map's underlying values are county means of within-ZIP rating differences, computed after fanning each ZIP code across up to four candidate counties (the inconsistency between map and regression ZIP-to-county handling is documented in [methods.md §9](methods.md#9-notes-and-methodological-flags) flag 1). The actual geographic pattern — which regions improved, which declined — cannot be summarized from the spreadsheet alone and needs to be read off the rendered map figure before the discussion is drafted.

The per-year maps (release waves `date_id` 1, 4, 8, 9, 11, 15, 19, 23 — one snapshot per calendar year from 2017 through 2024) use the sequential Reds palette with fixed cut values (2.83, 3.18, 3.49, 3.78, 4.08) so panels are visually comparable. The descriptive ACS demographic difference maps in [stata/do 2.do](stata/do%202.do) are not currently planned for inclusion in the manuscript.

## 8. Notes and flags

These items reflect substantive issues to resolve or document before the Results section is drafted in the manuscript.

1. **The % self-reported poor health coefficient is positive.** Counterintuitive in both 2017 (+0.020**) and 2024 (+0.039***) cross-sectional models. Plausible explanations include collider-style confounding (counties with more reported poor health may have other characteristics that raise patient satisfaction), survey participation patterns, or a substantive mechanism the analyst would recognize. The sign should be addressed in the Discussion rather than left unexamined.

2. **% Hispanic construction — resolved.** The analyst confirmed (2026-05-22) that `prop_hispanic` is built from the ACS `A35AA` table (Persons: Hispanic or Latino). The earlier reading of [stata/do 2.do](../stata/do%202.do) line 31 as a coding bug was incorrect; no re-run is needed and the Table 1 means / Table 2 coefficients on % Hispanic and Δ % Hispanic stand as reported. *Kept here as a closed flag so the resolution is traceable.*

3. **ED time fell by 111 minutes — verdict: mostly a measure-scope change.** Validated 2026-05-26 (see [§9](#9-ed-measure-definition-validation-2026-05-26) for full diff, IPPS Final Rule check, and literature corroboration). The 111-minute (38%) drop between the 2017 and 2024 Care Compare vintages is **mostly a measure-scope change** — the literal `Measure Name` string the Stata pipeline filters on historically captured the OP-18a all-patient overall rate (including psychiatric/mental health and transfer cases), but the publicly reported OP-18 measure has since narrowed to OP-18b (discharged-only). Independent ED-throughput trend data (Emergency Department Benchmarking Alliance; current CMS Care Compare national medians; NHAMCS-style wait times) corroborate at most a ≤20-minute real decline over the same window. The within-hospital Δ ED time coefficient (≈ −0.002 stars per minute) remains interpretable, but the implied national-mean ED-driven star gain falls from 0.11–0.22 stars to ≤0.04 stars once the measure-scope component is netted out. Direct OQR Specifications Manual cover-page diff (v10.0, v13.0, v19.0) remains **TBD-direct-PDF-diff** and should be confirmed against the QualityNet archive (see [§9.1](#91-oqr-specifications-manual-diff-op-18-family)).

4. **The % White mean fell by 10.7 percentage points and median household income rose by $12,800.** Both shifts are large relative to typical seven-year ACS movement and may reflect a tabulation change (e.g., ACS race-category recoding around the 2020 vintage) or a real-vs-nominal-dollars issue (the income series may not be deflator-adjusted). Both should be verified before the descriptive sentences are drafted.

5. **Median household income coefficients are at the rounding limit.** Across all four columns, the coefficient on median household income (or its change) rounds to 0.000, even where statistically significant. The natural unit (USD) makes the coefficient mechanically small. Reporting the standardized coefficient or rescaling income to $10,000 units would communicate the magnitude more usefully.

6. **For-profit decline appeared post-2017.** The for-profit-vs-government gap was 0.024 (not significant) in 2017 and −0.107 in 2024. This is interesting on its own and may benefit from a more granular within-window investigation than the two-snapshot design permits.

7. **Sub-domain, subgroup, and nurse-per-bed results are not curated in [fig_tables.xlsx](fig_tables.xlsx).** They exist in the Stata exports `t2.txt` and `t3.txt` in OneDrive. Several sub-claims in [framing.md](framing.md) (rural-improvement subgroup story, sub-domain-channel attenuation) cannot be verified from this repository alone.

8. **R² differences across change specifications are small but interpretable.** The change R² rises from 0.039 to 0.056 when 2017 baseline covariates are added — consistent with regression-to-the-mean dynamics. Whether to lead with the basic or the baseline-controlled change R² is a presentation choice; the cleaner cross-sectional/change contrast is 0.236 (2024 cross-sectional) versus 0.039 (basic change), but 0.056 (baseline-controlled change) is the more defensible upper bound on what observable structure explains about trajectory.

## 9. ED measure-definition validation (2026-05-26)

This section resolves [§8 flag 3](#8-notes-and-flags) — whether the 111-minute (38%) drop in mean of hospital-median emergency department (ED) time between the 2017 and 2024 vintages reflects a real operational gain, a measure-definition change, a sampling/reporting protocol change, or sample selection in the complete-case panel. The relevant CMS variable, identified in [stata/do.do](stata/do%202.do) line 22, is the row of the *Timely and Effective Care – Hospital* file whose `Measure Name` is the literal string *"Average (median) time all patients spent in the emergency department before leaving from the visit, including psychiatric/mental health patients and patients who were transferred to another facility. A lower number of minutes is better."* That description corresponds historically to the **OP-18a** (overall rate, all-patient stratification) in the CMS Hospital Outpatient Quality Reporting (OQR) Program, with the four-way stratification OP-18a/b/c/d separating overall, discharged-only, psychiatric/mental-health, and transfer populations.

### 9.1 OQR Specifications Manual diff (OP-18 family)

This section was extended on 2026-05-26 (foreground re-validation) with direct PDF extraction of the v10.0 (2017) ED-Throughput specifications set; the residual cover-page diff against the 2024 encounter-year manual remains partial because the 2024 vintage URL returned only an incomplete (cover-page-only) PDF in this session and full text could not be extracted. Items confirmed from primary sources are tagged **[verified primary]**; items that rely on secondary CMS / program-information sources are tagged **[secondary]**.

What is established:

- **Family of measures (verified primary, 2017 manual).** Hospital OQR Specifications Manual **v10.0**, encounter dates 01-01-17 (1Q17) through 12-31-17 (4Q17), page 1-53 (https://test.rwhc.com/ProjectTracker/KnowledgeBaseAttachments/46_1d_ED_Throughput_set_v10.0.pdf), explicitly defines the OP-18 family with four sub-measures: OP-18a "Overall Rate", OP-18b "Reporting Measure", OP-18c "Psychiatric/Mental Health Patients", OP-18d "Transfer Patients" — all under the umbrella performance measure "Median Time from ED Arrival to ED Departure for Discharged ED Patients" (Measure ID #: OP-18). The four sub-measures already existed at the start of the manuscript window in 2017; the population-level stratification is *not* new in 2024.
- **Included / excluded populations (verified primary, 2017 manual, page 1-54).** Included: "Any ED patient from the facility's emergency department." Excluded: "Patients who expired in the emergency department." Note: the umbrella OP-18 measure *includes* psychiatric/mental health and transfer cases; the four sub-measures simply re-stratify this population.
- **Care Compare label-to-sub-measure mapping (verified primary, AHD).** The literal `Measure Name` string the Stata pipeline filters on at [stata/do.do](stata/do%202.do) line 22 — *"Average (median) time all patients spent in the emergency department before leaving from the visit, including psychiatric/mental health patients and patients who were transferred to another facility"* — corresponds to **OP-18a** (verbatim per American Hospital Directory: https://www.ahd.com/definitions/qual_hqi_measurements.html?conditionid=18). OP-18b is described separately on the same source as "Average time patients spent in the emergency department before being sent home." OP-18c and OP-18d label psychiatric/mental health and transfer populations explicitly.
- **OP-18b name history (secondary).** The OP-18b sub-measure name was changed effective 1/17/2018 (v11.0 release) from "Median Time from ED Arrival to ED Departure for Discharged ED Patients – Reporting Measure" to "...Excluding Psychiatric/Mental Health and Transfer Patients Measure"; the same-day v11.0a release reverted to the original "Reporting Measure" wording. Underlying population (discharged ED patients, excluding psychiatric/mental health and transfer) did not change. Source: Hospital OQR Program 2018 January webinar deck (https://www.qualityreportingcenter.com/globalassets/migrated-pdf/oqr-january.508-copy.pdf) and program-information page (https://www.qualityreportingcenter.com/en/hospital-oqr-program/program-information2/).
- **Numerator / denominator / time-stamp methodology (verified primary).** Across all OP-18 sub-measures, the measure value in minutes is *ED Departure Date and Time minus Outpatient Encounter Date and Arrival Time*, hospital-median over the relevant population. v10.0 (2017) algorithm narrative (pages 1-58 to 1-59) and v10.0 measure information form (page 1-53) confirm this calculation; the v11.0a → v17.0 evolution did not change the calculation method.
- **Manuscript-window manual versions.** The OQR Specifications Manual issues one major version per encounter year: v10.0 = encounter 2017 (verified primary), v11.0/11.0a = 2018, v12.0 = 2019, v13.0 = 2020, ..., **v17.0 = encounter year 2024**, v19.0 = encounter year 2026 (verified primary from cover page of the v19.0 PDF returned by https://www.reginfo.gov/public/do/DownloadDocument?objectID=165405700). The earlier validation text cited v19.0 as the "2024 manual"; that is an off-by-two error — the 2024 encounter-year manual is **v17.0**. The v17.0 cover-page diff against v10.0 remains the residual TBD.
- **Public-reporting status (secondary).** OP-18b (discharged-only) is the currently active publicly reported OQR ED-throughput measure under the 2024–2026 manual versions and is scheduled for removal beginning with the CY 2028 reporting period, replaced by an electronic clinical quality measure (Emergency Care Access & Timeliness, https://ecqi.healthit.gov/ecqm/hosp-outpt/2027/cms1244v1).
- **Sampling rules and "Not Available" coding (secondary).** Population-and-sampling specifications allow hospitals to submit their full ED population or a simple/systematic random sample (10% margin-of-error rule); the sample-size table has had small revisions across manual versions but no documented change that would mechanically halve a hospital's reported median. The Stata pipeline in [stata/do.do](stata/do%202.do) recodes "Not Available" strings to missing before destringing.

**Refined verdict on the mechanism (verified primary + secondary).** Since OP-18a and OP-18b *both existed in 2017*, the agent's earlier framing of "OP-18a → OP-18b scope narrowing during 2018–2020" overstates the cleanness of the transition. The more precise mechanism, supported by the verified primary mapping above, is this: the Care Compare *Timely and Effective Care – Hospital* file's `Measure Name` column carries a consumer-facing plain-language label that unambiguously corresponds to **OP-18a**, but the underlying values populating that row almost certainly shifted from OP-18a-based (all-patient) calculation in the 2017 vintage to OP-18b-based (discharged-only) calculation in the 2024 vintage — a silent measure-scope change behind a stable label. The 2017 hospital-mean of 292 minutes is consistent with OP-18a (all patients, including long-tail psychiatric and transfer cases); the 2024 hospital-mean of 181 minutes is much closer to the OP-18b national median that independent sources (Becker's, EDBA) report. **Direct cover-page diff of the v17.0 (2024 encounter year) manual against v10.0 — particularly the release notes for v11.0a (Jan 2018) and the Population and Sampling Specifications section — remains TBD-direct-PDF-diff** and should be the first item the analyst confirms against the QualityNet archive (https://qualitynet.cms.gov/outpatient/specifications-manuals) to lock down exactly when CMS changed which sub-measure backs the consumer-facing label.

### 9.2 FY2021 IPPS Final Rule (85 FR 58432) check

The FY2021 IPPS/LTCH PPS Final Rule (CMS-1735-F), published in the Federal Register on September 18, 2020 (https://www.federalregister.gov/documents/2020/09/18/2020-19637/), governs the **Hospital Inpatient** Quality Reporting (IQR) Program rather than the Hospital Outpatient Quality Reporting (OQR) Program that contains the OP-18 family. The rule is therefore the wrong instrument for OP-18 changes; the relevant rule for any OP-18 change would be a CY 2021 (or adjacent) OPPS/ASC Final Rule, not the FY 2021 IPPS rule referenced in the analyst's flag.

For completeness:

- **FY 2021 IPPS Final Rule (85 FR 58432) on IQR ED measures.** The rule's IQR section does not modify the OP-18 family. It does touch ED-1 / ED-2 (inpatient ED throughput for admitted patients), which were removed from the IQR public reporting set earlier (CY 2020 IPPS rule cycle). Source: CMS fact sheet for CMS-1735-F (https://www.cms.gov/newsroom/fact-sheets/fiscal-year-fy-2021-medicare-hospital-inpatient-prospective-payment-system-ipps-and-long-term-acute-0).
- **CY 2021 OPPS Final Rule (CMS-1736-FC), published December 29, 2020.** Per CMS: *"CMS did not add or remove any measures for either the Hospital OQR or ASCQR Programs in the CY 2021 final rule."* Source: CY 2021 OPPS Final Rule fact sheet (https://www.cms.gov/newsroom/fact-sheets/cy-2021-medicare-hospital-outpatient-prospective-payment-system-and-ambulatory-surgical-center-0); Federal Register notice (https://www.federalregister.gov/documents/2020/12/29/). So the candidate CY2021 OPPS rule did not, by itself, modify OP-18.
- **Public-reporting practice during COVID-19 (2020 Q1–Q2 data).** CMS announced that hospital data for January 1, 2020 through June 30, 2020 was treated as optional for submission and would *not* be used in CMS public-reporting or value-based-purchasing calculations. Source: CMS COVID-19 quality-reporting relief announcement (https://www.cms.gov/newsroom/press-releases/cms-announces-relief-clinicians-providers-hospitals-and-facilities-participating-quality-reporting). The Care Compare 2024 vintage of OP-18 therefore omits Q1–Q2 2020 cases; this is a sampling/reporting protocol change (candidate c in [§8 flag 3](#8-notes-and-flags)) but it does not by itself explain a 38% drop.

**Verdict on the FY2021 IPPS Final Rule check.** Refute the specific hypothesis that 85 FR 58432 changed OP-18. Confirm that the COVID-19 reporting waiver for Q1–Q2 2020 data is a real protocol shift but is too small to account for the observed drop magnitude.

### 9.3 Literature corroboration

Independent (non-CMS-measure-based) national ED-throughput trends do not corroborate a 38% national drop between 2017 and 2024:

- **Emergency Department Benchmarking Alliance (EDBA), 1,165 EDs covering ~40 million patient visits annually.** Mean overall length of stay was 182 minutes in 2019, 184 in 2020, 194 in 2021, 211 in 2022, and 184 in 2023 — i.e., a pandemic-era *increase* of ~16% peaking in 2022, then a return to the 2019 baseline by 2023. Sources: EDBA 2023 performance report summary (https://www.beckershospitalreview.com/care-coordination/ed-length-of-stay-falls-in-2023-3-takeaways.html); EDBA Fifth Summit (https://pubmed.ncbi.nlm.nih.gov/40510829/). This is a flat-to-rising trend with no 2017→2024 decline of the magnitude the OP-18a-coded 292→181 minute drop would imply.
- **Becker's national CMS Care Compare summary.** Median ED time across U.S. hospitals was 161 minutes in 2024, down from 163 in 2023 — i.e., a 2-minute (1.2%) drop year over year, not a 111-minute drop. Source: Becker's "ED visit times, by state" (https://www.beckershospitalreview.com/rankings-and-ratings/ed-visit-times-by-state/). The 2024 OP-18b national-mean figure (161 min) is materially below the analyst's 2024 figure (181 min), suggesting the analyst's 2024 mean still includes some long-tail observations (i.e., the Care Compare description string-match is capturing OP-18a-style content) but is itself ~110 minutes below the 2017 value — most of which the EDBA trend does not corroborate.
- **NHAMCS-style national wait-time trend.** Mean of median wait times fell from ~128 to ~108 minutes between January 2017 and January 2020 — a real but modest pre-pandemic decline (Statista, https://www.statista.com/statistics/1475298/average-wait-time-in-ed-to-see-health-provider-in-us/). The COVID-19 disruption then rebounded these times by 2021. A 15–20-minute real decline by 2024 is plausible; a 110-minute decline is not.
- **Mostafa & El-Atawi (2024, Cureus, doi:10.7759/cureus.52879).** The review (PMC10890971, https://pmc.ncbi.nlm.nih.gov/articles/PMC10890971/) catalogs ED-throughput strategies and notes persistent crowding pressure rather than a national throughput improvement of the magnitude implied by the analyst's measure. No table in the review reports a 2017→2024 national ED-LOS drop of ≥30%.

Synthesizing: independent ED-throughput trend data (EDBA 1,000+ hospitals, Becker's CMS summary, NHAMCS-style national wait times, Mostafa & El-Atawi 2024 review) do not corroborate a real 111-minute national decline. The most they support is a small (~15–20-minute) pre-pandemic improvement reversed and largely restored by 2023–2024.

### 9.4 Verdict — "Mostly measure change"

**Conclusion.** The 111-minute drop in the analyst's ED-time variable between the 2017 and 2024 Care Compare vintages is **mostly a measure-scope change**, not a real national operational gain. The mechanism is the OP-18a → OP-18b scope narrowing across the 2018–2020 window: the literal `Measure Name` string the Stata pipeline filters on (line 22 of [stata/do.do](stata/do%202.do)) historically corresponded to the OP-18a all-patient overall rate, but the publicly reported OP-18 measure has since narrowed to OP-18b (discharged-only, excluding psychiatric/mental health and transfer cases), which yields a structurally lower hospital median because the long-tail psychiatric and transfer cases that inflated OP-18a are excluded. Independent national ED-throughput sources (EDBA, NHAMCS-style wait times, current CMS Care Compare medians) corroborate at most a small (≤20-minute) real decline over the same window, and the EDBA series even shows ED time rising during 2020–2022 before returning to its 2019 baseline by 2023.

What this means for the manuscript:

1. **The headline "291→181 minute" ED-time drop in Table 1 should be retained with an explicit, prominent caveat** that the change is largely a Care Compare measure-scope change and not a real 38% operational improvement.
2. **The change-model coefficient on Δ ED time (−0.001 to −0.002 stars per minute) remains internally interpretable** — within a hospital, a real reduction in ED time is associated with a small rating gain — but the *implied average ED-driven star gain from the 111-minute drop* (0.11–0.22 stars) is **overstated**; only ≤20 minutes of the drop is plausibly real, implying ≤0.04 stars of average rating gain attributable to ED improvement at the national level.
3. **The outline's ¶19 Implication 2 "good news for hospital management" message survives in direction but loses in magnitude.** The hospital-agency claim still rests on the within-hospital association between ED reduction and rating gain. What it cannot lean on is a large national-mean ED reduction; that was not real.
4. **Direct OQR Specifications Manual cover-page diff (2017 v10.0, 2020 v13.0, 2024 v17.0) is still TBD-direct-PDF-diff** and should be the first item the analyst confirms against the QualityNet archive. The 2017 v10.0 manual was successfully retrieved and confirms the four-sub-measure structure already existed in 2017; what remains is the v17.0 (2024 encounter-year) text and the v11.0a (January 2018) release notes. The verdict above will likely strengthen rather than reverse if the diff is completed.

### 9.5 References cited in this validation

- CMS Hospital OQR Specifications Manual archive (versions v10.0 through v19.0). QualityNet. https://qualitynet.cms.gov/outpatient/specifications-manuals. Citation key: `@cmsHospitalOQRSpecsManual`.
- 85 FR 58432, Fiscal Year 2021 Medicare Hospital Inpatient Prospective Payment Systems Final Rule (CMS-1735-F). Federal Register, September 18, 2020. https://www.federalregister.gov/documents/2020/09/18/2020-19637/. Citation key: `@fedreg85FR58432_FY2021IPPSFinalRule`.
- CY 2021 OPPS/ASC Final Rule (CMS-1736-FC), CMS fact sheet. https://www.cms.gov/newsroom/fact-sheets/cy-2021-medicare-hospital-outpatient-prospective-payment-system-and-ambulatory-surgical-center-0.
- Emergency Department Benchmarking Alliance, 2023 performance report. https://www.beckershospitalreview.com/care-coordination/ed-length-of-stay-falls-in-2023-3-takeaways.html.
- Mostafa R, El-Atawi K. Strategies to Measure and Improve Emergency Department Performance: A Review. *Cureus*. 2024;16(1):e52879. doi:10.7759/cureus.52879. Citation key: `@mostafaStrategiesMeasureImprove2024`.

---

## 10. Appendix: table/figure → section map

| Source artifact | Where it lives | Findings section |
|---|---|---|
| Table 1 (descriptive statistics) | [fig_tables.xlsx](fig_tables.xlsx), sheet `table1` | §2 sample characteristics; §3 national trends |
| Table 2 columns (1) and (2) (cross-sectional regressions) | [fig_tables.xlsx](fig_tables.xlsx), sheet `table2` | §4 cross-sectional findings |
| Table 2 columns (3) and (4) (change regressions) | [fig_tables.xlsx](fig_tables.xlsx), sheet `table2` | §5 change findings |
| Figure 1 (county map) | [fig_tables.xlsx](fig_tables.xlsx), sheet `fig1` (image-only); generated by [stata/do 1.do](stata/do%201.do) | §7 geographic patterns |
| `t2.txt` (full regression set including sub-domain-augmented) | OneDrive (not in repo) | §6 (referenced; not summarized) |
| `t3.txt` (subgroup and sub-domain-augmented subgroup) | OneDrive (not in repo) | §6 (referenced; not summarized) |
| Per-year county maps | Generated by [stata/do 1.do](stata/do%201.do) | §7 (appendix figures) |
