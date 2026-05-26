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

The two largest changes were the **0.18-star decline in mean overall rating** and the **111-minute drop in median ED time**. The ED change was large enough (a 38% reduction) that the underlying CMS measure definition or reporting protocol may have shifted across the window. The analyst flagged this as potentially fundamental to the ED interpretation (review of 2026-05-22): **before this drop is reported as a real operational gain**, it must be validated against (a) the CMS Hospital Outpatient Quality Reporting (OQR) Specifications Manual for the 2017 and 2024 vintages of OP-18b (median ED-arrival-to-departure time) and any FY2021 IPPS Final Rule changes, and (b) the published ED-throughput literature for corroborating national trends. See [§8](#8-notes-and-flags) flag 3. Community shifts were modest in most variables but two stand out: the **10-percentage-point drop in mean % White** and the **$12,800 rise in mean median household income**. Both are larger than would be expected from typical demographic drift across seven years and may reflect American Community Survey (ACS) tabulation or inflation-adjustment differences rather than population change; see [§8](#8-notes-and-flags) flag 4.

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

3. **ED time fell by 111 minutes — a 38% reduction.** A drop this large across seven years is plausible but unusual, and may partly reflect a change in the CMS measure definition, reporting protocol, or coding of "Not Available" cells across the two vintages. Per analyst review (2026-05-22), this is a **potentially fundamental** caveat for the ED interpretation in the manuscript and is **blocking** for any prose that reports the 111-minute drop as a real operational gain. Validation requires two checks: (a) compare the OP-18b specification (median ED arrival-to-departure time, all patients) across the 2017 and 2024 vintages of the CMS Hospital Outpatient Quality Reporting (OQR) Program Specifications Manual, with particular attention to the FY2021 IPPS Final Rule (85 FR 58432) which changed several OQR measures; and (b) cross-check against the published ED-throughput literature (e.g., Mostafa & El-Atawi 2024) for whether a comparable national drop is corroborated. Results of those checks should be added to the manuscript Methods or limitations before the ED finding is drafted.

4. **The % White mean fell by 10.7 percentage points and median household income rose by $12,800.** Both shifts are large relative to typical seven-year ACS movement and may reflect a tabulation change (e.g., ACS race-category recoding around the 2020 vintage) or a real-vs-nominal-dollars issue (the income series may not be deflator-adjusted). Both should be verified before the descriptive sentences are drafted.

5. **Median household income coefficients are at the rounding limit.** Across all four columns, the coefficient on median household income (or its change) rounds to 0.000, even where statistically significant. The natural unit (USD) makes the coefficient mechanically small. Reporting the standardized coefficient or rescaling income to $10,000 units would communicate the magnitude more usefully.

6. **For-profit decline appeared post-2017.** The for-profit-vs-government gap was 0.024 (not significant) in 2017 and −0.107 in 2024. This is interesting on its own and may benefit from a more granular within-window investigation than the two-snapshot design permits.

7. **Sub-domain, subgroup, and nurse-per-bed results are not curated in [fig_tables.xlsx](fig_tables.xlsx).** They exist in the Stata exports `t2.txt` and `t3.txt` in OneDrive. Several sub-claims in [framing.md](framing.md) (rural-improvement subgroup story, sub-domain-channel attenuation) cannot be verified from this repository alone.

8. **R² differences across change specifications are small but interpretable.** The change R² rises from 0.039 to 0.056 when 2017 baseline covariates are added — consistent with regression-to-the-mean dynamics. Whether to lead with the basic or the baseline-controlled change R² is a presentation choice; the cleaner cross-sectional/change contrast is 0.236 (2024 cross-sectional) versus 0.039 (basic change), but 0.056 (baseline-controlled change) is the more defensible upper bound on what observable structure explains about trajectory.

## 9. Appendix: table/figure → section map

| Source artifact | Where it lives | Findings section |
|---|---|---|
| Table 1 (descriptive statistics) | [fig_tables.xlsx](fig_tables.xlsx), sheet `table1` | §2 sample characteristics; §3 national trends |
| Table 2 columns (1) and (2) (cross-sectional regressions) | [fig_tables.xlsx](fig_tables.xlsx), sheet `table2` | §4 cross-sectional findings |
| Table 2 columns (3) and (4) (change regressions) | [fig_tables.xlsx](fig_tables.xlsx), sheet `table2` | §5 change findings |
| Figure 1 (county map) | [fig_tables.xlsx](fig_tables.xlsx), sheet `fig1` (image-only); generated by [stata/do 1.do](stata/do%201.do) | §7 geographic patterns |
| `t2.txt` (full regression set including sub-domain-augmented) | OneDrive (not in repo) | §6 (referenced; not summarized) |
| `t3.txt` (subgroup and sub-domain-augmented subgroup) | OneDrive (not in repo) | §6 (referenced; not summarized) |
| Per-year county maps | Generated by [stata/do 1.do](stata/do%201.do) | §7 (appendix figures) |
