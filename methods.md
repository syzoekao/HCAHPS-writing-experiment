# Methods (working document for outlining)

**Manuscript title (working, per analyst):** *Determinants of Hospital HCAHPS Star Ratings and Changes Over Time, 2017-2024*

This file translates the Stata pipeline in [stata/](stata/) into readable prose for the manuscript outline. It summarizes the design, data sources, sample, variables, and statistical analysis, and flags methodological choices worth recording before drafting. The "saved" specifications described here are those exported to results tables (`t2.txt`, `t3.txt`); exploratory variants that exist in the do-files but are not estout-ed are excluded.

## 1. Overview

We construct a cross-sectional file with one row per U.S. hospital reporting Hospital Consumer Assessment of Healthcare Providers and Systems (HCAHPS) overall star ratings, with two snapshots: Q1 2017 (the pre-COVID baseline) and the most recent 2024 release. For each hospital we also assemble operational, market, community-health, demographic, and geographic covariates measured for both years. We then estimate three primary ordinary least squares (OLS) specifications with robust standard errors: a **2017 cross-sectional** model, a **2024 cross-sectional** model, and a **change** model regressing the 2017→2024 change in the overall star rating on the changes in covariates. Augmented variants additionally control for the eight HCAHPS sub-domain stars used as regressors (or their 2017→2024 changes). The contrast between cross-sectional R² and change-model R² is the paper's central quantitative finding.

## 2. Data sources

- **HCAHPS Patient Survey Star Ratings** (`hcahps_all.dta`). Centers for Medicare & Medicaid Services (CMS) Care Compare's longitudinal HCAHPS file, covering 23 quarterly release waves with rolling 12-month survey windows from Q1 2017 (`date_id=1`) through 2024 (`date_id=23`). For each release wave we extract the overall hospital rating star and the nine other HCAHPS sub-domain stars (see §4).
- **Hospital General Information** (CMS Care Compare). Provides hospital type, ownership, and whether the facility offers emergency services. Processed in [stata/do.do](stata/do.do); saved as `generalinfo.dta`.
- **Timely and Effective Care — Hospital** (CMS Care Compare), 2017 and 2024 vintages. Used to extract the *Average (median) time all patients spent in the emergency department before leaving from the visit, including psychiatric/mental health patients and patients who were transferred to another facility* — our emergency department (ED) throughput measure. Processed in [stata/do.do](stata/do.do); saved as `timeliness.dta` (2024) and `timeliness2017.dta` (2017). *Measure-scope caveat (validated 2026-05-26, see [findings.md §9](findings.md#9-ed-measure-definition-validation-2026-05-26)):* the literal `Measure Name` string the Stata pipeline filters on historically corresponded to the OP-18a all-patient overall rate (including psychiatric/mental health and transfer cases), but the publicly reported OP-18 measure has narrowed to OP-18b (discharged-only, excluding psychiatric/mental health and transfer cases) during the 2018–2020 window. The 2017 → 2024 hospital-mean drop from 292 to 181 minutes (38%) therefore reflects mostly a measure-scope narrowing, not a real national operational gain; independent ED-throughput data (Emergency Department Benchmarking Alliance; CMS Care Compare national medians; NHAMCS-style wait times) corroborate at most a ≤20-minute real decline over the same window. The within-hospital Δ ED time coefficient (≈ −0.002 stars per minute, [findings.md §5](findings.md#5-change-findings-20172024)) remains internally interpretable; the implied *national-mean* ED-driven star gain is, however, ≤0.04 stars rather than the 0.11–0.22 stars a naive reading of the 111-minute drop would suggest. The 2017 v10.0 manual was retrieved and confirms the four-sub-measure (OP-18a/b/c/d) structure already existed in 2017; the consumer-facing "all patients … including psychiatric/mental health and transfer" Care Compare label maps verbatim to **OP-18a** per American Hospital Directory documentation (https://www.ahd.com/definitions/qual_hqi_measurements.html?conditionid=18). What remains TBD-direct-PDF-diff is the **v17.0** (encounter year 2024) manual text and the **v11.0a** (January 2018) release notes — earlier copy in `methods.md` mistakenly named v19.0 as the 2024 manual; v19.0 is the encounter-year-2026 manual. See [findings.md §9.1](findings.md#91-oqr-specifications-manual-diff-op-18-family) for the full primary-source ledger. QualityNet archive: https://qualitynet.cms.gov/outpatient/specifications-manuals.
- **ZIP-to-county crosswalk** (`zip_county3_id1.dta` … `zip_county3_id4.dta`). Custom crosswalk allowing each ZIP code to map to up to four counties. The regression pipeline uses only the primary crosswalk (`id1`); the map pipeline fans out across all four (see §8 and §9).
- **Centers for Disease Control and Prevention (CDC) PLACES** disease-burden file. County prevalence of self-reported poor general health, 2019 and 2023 releases. Stored as `diseaseburden2019to2023.dta`.
- **CMS Provider of Services (POS) File**. Total hospital count by county for 2017 and 2024, used to construct hospitals-per-1,000-population. Stored as `ttlhosp_20172024.dta`.
- **IPUMS National Historical Geographic Information System (NHGIS) — American Community Survey (ACS) 5-year estimates** (`nhgis0003_ts_nominal_county.csv`). Used to build county demographics for 2013–2017 ("2017") and 2020–2024 ("2024"). Processed in [stata/do 2.do](stata/do%202.do); saved as `acsdata_mostrecent2017.dta` and `acsdata_mostrecent2024.dta`. *Note: variable names ending in 2017 or 2024 refer to the endpoint of a 5-year estimate, not a single calendar year.*
- **ZIP-to-RUCA crosswalk** (`zip_ruca.dta`). U.S. Department of Agriculture (USDA) Rural-Urban Commuting Area (RUCA) codes assigned to each hospital's ZIP, then recoded into three classes (urban / large rural / small or isolated rural; see §5).
- **Medicare Hospital Cost Report** (`numbers_costs_beds.dta`). Provides nurse salary and bed count per hospital; used to construct nurse-salary-per-bed for sensitivity analyses.

## 3. Sample construction

The analytic file holds 2017 and 2024 variables on the same row for each hospital (see [stata/hospitallevel_do.do](stata/hospitallevel_do.do)).

1. **HCAHPS extraction**. From `hcahps_all.dta`, hospital IDs are harmonized (`facilityid` filled from `providerid` when missing) and duplicate hospital–date–measure rows are deduplicated by keeping the first occurrence. Star-rating strings equal to "Not Available" are set missing and destrung to numeric.
2. **Two snapshots, wide format**. Records are filtered to the ten HCAHPS star-rated measures, then to `date_id==1` (2017) and `date_id==23` (2024). For each year separately, the file is reshaped wide on the ten measures (hospital × ten star variables), then renamed with a `_2017` or `_2024` suffix. The two yearly files are merged 1:1 by `hospitalid`.
3. **Covariate merging**. Hospital ZIP is used to merge ZIP-to-county (primary crosswalk only) and ZIP-to-RUCA; county Federal Information Processing Standards (FIPS) codes are used to merge CDC PLACES, CMS POS hospital counts, and ACS demographics for both years; hospital ID is used to merge the Care Compare general info, timeliness (2017 and 2024), and Medicare cost-report files.
4. **Complete-case flag**. A `sample==1` indicator is set to 0 whenever any of the following is missing: the 2017 or 2024 overall star, 2017 or 2024 ED median time, 2017 or 2024 hospital ownership, 2017 or 2024 hospitals-per-1,000-pop, the 2019 and 2023 CDC PLACES poor-health, 2017 and 2024 population, age, race/ethnicity, foreign-born, education, poverty, and median household income variables, and the rural-urban indicator. The analytic sample (`sample==1`) contains approximately 2,380 hospitals.

## 4. Outcome and sub-domain stars

The dependent variable is **`patientsurveystarrating7`**, the overall HCAHPS hospital rating star (1–5). The nine HCAHPS sub-domain stars (numbered by Stata's `encode` order) are:

| # | Sub-domain                          |
|---|--------------------------------------|
| 1 | Care transition                      |
| 2 | Cleanliness                          |
| 3 | Communication about medicines        |
| 4 | Discharge information                |
| 5 | Doctor communication                 |
| 6 | Nurse communication                  |
| 7 | **Overall hospital rating** (outcome)|
| 8 | Quietness                            |
| 9 | Recommend hospital                   |
| 10| Staff responsiveness                 |

Every sub-domain-augmented specification drops sub-domain **#9 (Recommend hospital)** from the right-hand side. Only sub-domains 1–6, 8, and 10 are used as predictors. This is consistent across both years and the change model. (The reason is not annotated in the do-file; the most likely explanation is near-collinearity between Recommend-hospital and the overall rating, but this should be confirmed before drafting.)

The change-score variables are `change_rating = patientsurveystarrating7_2024 − patientsurveystarrating7_2017`, with analogous `change_rating1`, `change_rating2`, …, `change_rating10` for the sub-domains.

## 5. Covariates

Covariates are grouped below. All county variables are merged onto hospitals via the hospital's ZIP and the primary ZIP-to-county crosswalk.

**Hospital characteristics**
- *Ownership*, recoded from the 12 raw Care Compare ownership categories into three classes (`hosp_owner_c`): 1 = government, 2 = non-profit, 3 = for-profit. The mapping is hard-coded at lines 291–293 of [stata/hospitallevel_do.do](stata/hospitallevel_do.do).
- *Nurse salary per bed* (`nurse_perbed`), constructed as `nurse_salary / num_beds` from the Medicare cost report. Used only in sensitivity models.

**Operational**
- *ED median time* (`time_duringER2017`, `time_duringER2024`). The Care Compare measure described in §2. "Not Available" cells are set missing.

**Market structure**
- *Hospitals per 1,000 population* (`numhops_per1000pop2017`, `numhops_per1000pop2024`), constructed as total county hospitals (CMS POS) divided by ACS county population, ×1,000.

**Community health**
- *Self-reported poor health prevalence* (`poorhealth_2019`, `poorhealth_2023`), county-level from CDC PLACES.

**Demographics (county, from ACS)**
- Total population (`pop`).
- Share aged 65 and over (`prop_65andup`).
- Race/ethnicity shares: `prop_white`, `prop_black`, `prop_asian`, `prop_hispanic`. *Note: `prop_hispanic` was verified by the analyst (2026-05-22) as built from the ACS `A35AA` table (Persons: Hispanic or Latino), not from the Asian-population numerator. The earlier "coding bug" flag in [stata/do 2.do](stata/do%202.do) line 31 is resolved.*
- Share foreign-born (`prop_foreign`).
- Share with a bachelor's degree or above (`prop_higheduc`).
- Share below the federal poverty level overall (`prop_poor`) and among adults 65+ (`prop_poor_65andup`).
- Median household income (`income_medianhh`).

**Geography**
- *Rural-urban classification* (`rural_urban`), recoded from the USDA primary RUCA code: 1 = urban (RUCA 1–3), 2 = large rural/micropolitan (4–6), 3 = small or isolated rural (7–10).

## 6. Change variables

For the change specification, each covariate has a corresponding 2017→2024 change variable, constructed as the 2024 value minus the 2017 value:

- `change_rating`, `change_rating1–10` (excluding #7, the outcome itself, and #9 by convention).
- `change_time_duringER`, `change_numhops_per1000pop`, `change_poorhealth`, `change_pop`, `change_prop_65andup`, `change_prop_white2024`, `change_prop_black2024`, `change_prop_hispanic2024`, `change_prop_foreign2024`, `change_prop_higheduc2024`, `change_prop_poor2024`, `change_prop_poor_65andup2024`, `change_income_medianhh`.

(The `2024` suffix on the `change_prop_*` names is a naming artifact, not a vintage indicator — these variables are 2024 − 2017 differences.)

Hospital ownership and rural-urban classification are treated as time-invariant (using the 2024 values), entered as categorical fixed effects in the change model.

## 7. Statistical analysis

All models are estimated by ordinary least squares with Huber-White robust standard errors (`reg ..., robust`). The regressions are unweighted (the `numberofcompletedsurveys` weight is used only in the map pipeline (§8)). The seven primary specifications exported to `t2.txt` (lines 379–419 of [stata/hospitallevel_do.do](stata/hospitallevel_do.do)) are:

| Model | Outcome | Specification |
|-------|---------|---------------|
| **t1** | Star 2024 (cross-sectional) | i.ownership + 2024 ED time + 2024 hospitals/1k + 2023 poor health + 2024 ACS demographics + i.rural-urban |
| **t2** | Star 2024 (cross-sectional) | t1 + sub-domain stars 2024 (#1–6, 8, 10) |
| **t3** | Star 2017 (cross-sectional) | i.ownership + 2017 ED time + 2017 hospitals/1k + 2019 poor health + 2017 ACS demographics + i.rural-urban |
| **t4** | Star 2017 (cross-sectional) | t3 + sub-domain stars 2017 (#1–6, 8, 10) |
| **t5** | Δ Star (change) | i.ownership + Δ ED time + Δ hospitals/1k + Δ poor health + Δ ACS demographics + i.rural-urban |
| **t6** | Δ Star (change) | t5 + 2017 baseline levels of every covariate |
| **t7** | Δ Star (change) | t6 + Δ sub-domain stars (#1–6, 8, 10) + 2017 baseline sub-domain stars |

The main R² contrast is computed from t1 and t3 (cross-sectional: ~24% per CLAUDE.md) versus t5 (change: <6% per CLAUDE.md). The augmented specifications (t2, t4, t6, t7) test whether unobserved-sub-domain heterogeneity, baseline values, or sub-domain-change channels close the gap.

**Subgroup analysis.** A second results table (`t3.txt`, lines 422–450 of [stata/hospitallevel_do.do](stata/hospitallevel_do.do)) re-estimates the change model on three rural-urban strata, plus a fourth subgroup model adding sub-domain changes within the small/isolated rural stratum:

| Model | Subsample | Specification |
|-------|-----------|---------------|
| **t5 (subgroup)** | Urban (RUCA 1–3) | t6 specification (Δ + 2017 baselines) |
| **t6 (subgroup)** | Large rural / micropolitan (RUCA 4–6) | t6 specification |
| **t7 (subgroup)** | Small / isolated rural (RUCA 7–10) | t6 specification |
| **t8 (subgroup)** | Small / isolated rural | t7 specification (adds Δ sub-domain stars + 2017 baseline sub-domain stars) |

(In `t3.txt`, models t1–t4 are carried over from the previous estout block and are identical to t1–t4 in `t2.txt`.)

**Sensitivity with nurse-per-bed.** Adding `nurse_perbed` to the levels (2017 and 2024) and change specifications (lines 458–473) tests whether a hospital staffing-intensity proxy alters the conclusions. Only one estimate (`t2` on 2017 levels) is stored, and the table is not exported.

## 8. Geographic visualization

County maps are produced in [stata/do 1.do](stata/do%201.do) and [stata/do 2.do](stata/do%202.do) using the `maptile` Stata package with the `county2014` geography file (Michael Stepner's shapefile, fetched once via `maptile_install`).

**Star-rating maps.** For each of eight selected release waves — `date_id` 1, 4, 8, 9, 11, 15, 19, 23, approximately one per calendar year from 2017 through 2024 — Mean overall star ratings within each ZIP are computed weighted by `numberofcompletedsurveys` (analytic weights `[aw=numberofcompletedsurveys]`). For map years 2018–2024, fixed cut values (2.83, 3.18, 3.49, 3.78, 4.08) are applied so panels are visually comparable; 2017 uses the default `maptile` quantile breaks. The color palette is `Reds`.

**Difference map.** A separate difference map shows `dif_score = star_2024 − star_2017` (county-mean of within-ZIP differences). It uses the diverging `RdBu` palette and explicit cut values (−1, −0.33, 0, 0.5), so red shading denotes worsening and blue improving.

**ZIP-to-county fan-out (map pipeline only).** Because ZIP codes can span up to four counties, the map pipeline merges sequentially against four ZIP-to-county crosswalk files (`zip_county3_id1.dta` … `zip_county3_id4.dta`), collecting up to four candidate county codes per ZIP. The dataset is then split into four copies (one per crosswalk slot), each filtered to non-missing county codes, and the four are appended. The result is collapsed by `county` to take the unweighted mean of the per-ZIP rating across all ZIPs assigned to a county. This means a single ZIP that touches three counties contributes to each of those three county means.

**ACS demographic maps** ([stata/do 2.do](stata/do%202.do), lines 100–138) display 2017 levels and 2017→2024 differences for share white, share foreign-born, share poor, and share with bachelor's-plus education, using the same `county2014` geography. These provide descriptive context.

## 9. Notes and methodological flags

These items reflect coding choices or apparent issues to resolve or document before drafting the manuscript Methods section.

1. **ZIP-to-county handling differs between maps and regressions.** The maps (§8) fan out each ZIP across up to four counties; the regression pipeline (§3, line 225 of [stata/hospitallevel_do.do](stata/hospitallevel_do.do)) merges only against the primary crosswalk (`zip_county3_id1.dta`), so each hospital is assigned to exactly one county. Either reconcile, or note explicitly that descriptive figures and inferential analyses use different geographic conventions.
2. **`prop_hispanic` construction — resolved.** The analyst confirmed (2026-05-22) that `prop_hispanic` is built from the ACS `A35AA` table (Persons: Hispanic or Latino), not from the Asian-population numerator. The earlier "coding bug" reading of [stata/do 2.do](stata/do%202.do) line 31 is **incorrect**; no re-run is needed. Estimates on `prop_hispanic2017` / `prop_hispanic2024` (and their changes) stand as reported. *Kept here as a closed flag so the resolution is traceable.*
3. **HCAHPS duplicate handling.** Where the same hospital–date–measure appears more than once in `hcahps_all.dta`, the code keeps the first occurrence (`bys hospitalid date hcahpsmeasureid: gen id=_n; keep if id==1`). The frequency of these duplicates and whether the first-occurrence rule matters is not documented.
4. **"Not Available" → missing.** Star ratings and ED times equal to "Not Available" are converted to missing and destrung. Hospitals with missing values on any of the regression covariates are dropped via `sample==1`. Total exclusions and reasons should be tabulated for a CONSORT-style flow diagram if the journal expects one.
5. **`patientsurveystarrating9` (Recommend hospital) is excluded** from every sub-domain-augmented specification. The reason is not annotated; presumed near-collinearity with the overall rating. Worth confirming and reporting.
6. **Ownership recode loses information.** Twelve raw Care Compare ownership categories collapse into three classes (government / non-profit / for-profit). The specific mapping at lines 291–293 of [stata/hospitallevel_do.do](stata/hospitallevel_do.do) should be reproduced in a methods appendix if the recode is non-standard.
7. **ACS variable names use endpoint years, not single years.** `pop2017` is the 2013–2017 ACS 5-year estimate; `pop2024` is the 2020–2024 estimate. CDC PLACES `poorhealth_2019` and `poorhealth_2023` refer to release years. Clarify these conventions when drafting the manuscript Methods.
8. **Subgroup table `t3.txt` mixes content.** Models t1–t4 in `t3.txt` are the cross-sectional and sub-domain-augmented cross-sectional models from `t2.txt`, carried over because the `estimates store` calls were not refreshed before the second `estout`. The analytic content is unaffected, but readers of the raw output file may find this confusing.
9. **Hospitals per 1,000 population** uses ACS county population denominators of two different 5-year vintages (2013–2017 and 2020–2024), not a single year. The CMS POS hospital count is a single-year stock (2017 and 2024). The numerator and denominator timings are therefore mismatched.

## 10. Appendix: do-file → section map

| Do-file | What it produces | Methods section |
|---------|------------------|------------------|
| [stata/do.do](stata/do.do) | `generalinfo.dta` (hospital type, ownership, ED-service flag), `timeliness.dta` (2024 ED median time) | §2 (data sources), §3 (covariate merging) |
| [stata/do 1.do](stata/do%201.do) | `rating_allyears.dta` (long-format hospital × release-wave file); eight county-level star-rating maps; one difference map | §2 (HCAHPS source), §8 (maps) |
| [stata/do 2.do](stata/do%202.do) | `acsdata_all.dta`, `acsdata_mostrecent2017.dta`, `acsdata_mostrecent2024.dta`; four ACS-difference county maps | §2 (ACS), §5 (demographics), §8 (ACS maps) |
| [stata/hospitallevel_do.do](stata/hospitallevel_do.do) | `hcahps2017.dta`, `hcahps2024.dta`; merged analytic file; results tables `t2.txt` and `t3.txt`; sensitivity runs | §3 (sample), §4–§6 (variables), §7 (statistical analysis) |
