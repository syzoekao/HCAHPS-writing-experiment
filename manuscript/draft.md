---
title: "Determinants of Hospital HCAHPS Star Ratings and Changes Over Time, 2017-2024"
---

::: {custom-style="TitlePage"}
[TBD Author], [TBD Degree]^1^

1\. [TBD Department, TBD Institution, City, State, Country]

**Corresponding author:**\
[TBD]\
[TBD]\
[TBD]\
Email: [TBD]\
Phone: [TBD]

**Target journal:** American Journal of Public Health

**Article type:** Original Research

**Word count:** 1,215 (Methods and Results sections; full body [TBD])

**Figures and tables:** Table 1, Table 2, Figure 1 (cited in Results; full draft [TBD])

**References:** 8 (Methods and Results sections; Results adds none; full draft [TBD])
:::

```{=openxml}
<w:p><w:r><w:br w:type="page"/></w:r></w:p>
```

# Methods

## Data Sources and Study Sample

We assembled a hospital-level dataset that combined patient-experience ratings with operational, county, demographic, and geographic measures in 2017 and 2024. The overall Hospital Consumer Assessment of Healthcare Providers and Systems (HCAHPS) star rating came from the Centers for Medicare & Medicaid Services (CMS) Care Compare HCAHPS file, drawn from the first-quarter 2017 and fourth-quarter 2024 data releases. Each release wave summarizes a rolling 12-month survey window that closes before the data became publicly available. The first-quarter 2017 wave reflects patient surveys collected over 12 months across 2015 and 2016, and the fourth-quarter 2024 wave reflects surveys collected over the entire year of 2023 [@HttpsWwwhcahpsonlineorg; @HttpsWwwmedicaregovCarecompare].

Hospital characteristics came from the CMS Hospital General Information file, and emergency department (ED) throughput was obtained from the CMS Timely and Effective Care file in its 2017 and 2024 vintages [@HttpsWwwmedicaregovCarecompare; @HttpsQualitynetcmsgovOutpatient]. County factors were drawn from several sources: self-reported poor health from the Centers for Disease Control and Prevention (CDC) PLACES file [@greenlundPLACESLocalData2022]; hospital counts from the CMS Provider of Services file [@HttpsDatacmsgovProvidercharacteristics]; demographics from American Community Survey (ACS) 5-year estimates obtained through the IPUMS National Historical Geographic Information System (NHGIS) [@mansonNationalHistoricalGeographic2024]; and rural-urban classification from U.S. Department of Agriculture Rural-Urban Commuting Area (RUCA) codes [@HttpsWwwersusdagovDataproducts; @HttpsDeptswashingtoneduUwruca].

A U.S. acute-care hospital entered the analytic sample only if it reported an overall HCAHPS star rating in both the 2017 and the 2024 release wave and had complete data, in both years, on every factor used in the models. The resulting complete-case sample contained 2,380 hospitals. The reasons a hospital was excluded from the sample were a missing rating, a missing ED time, or a missing county factor. We matched each hospital to its county context through its ZIP code and a ZIP-to-county crosswalk, merged county factors on county Federal Information Processing Standards (FIPS) code, and combined the sources into one record per hospital.

## Measures

The outcome was the overall HCAHPS star rating, reported on a scale of 1 to 5. Hospital factors comprised ownership, recoded as government, non-profit, and for-profit — and rural-urban classification, classified as urban (RUCA 1–3), large rural or micropolitan (RUCA 4–6), and small or isolated rural (RUCA 7–10). The hospital operational factor was the median time a patient spent in the ED (in minutes). County factors comprised the prevalence of self-reported poor health; hospitals per 1,000 county residents; population size; the proportion of residents aged 65 and over; the proportion in each racial and ethnic group; the proportion foreign-born; the proportion with a bachelor's degree or above; the proportion in poverty overall and among adults 65 and over; and median household income. Ownership and rural-urban classification were the same in both years and were treated as time-invariant.

For each factor that could change between 2017 and 2024, we computed a change measure as the 2024 value minus the 2017 value. The change measure for the outcome was the 2024 overall star rating minus the 2017 rating; the explanatory change measures covered ED time, hospitals per 1,000 county residents, and each county factor — the proportion aged 65 and over, racial and ethnic composition, the proportion foreign-born, education, poverty, median household income, and poor-health prevalence.

## Statistical Analysis

We used linear regression with standard errors robust to heteroskedasticity to examine the associations between the overall star rating and the hospital, operational, and county factors, fitting three models: a 2017 cross-sectional model, a 2024 cross-sectional model, and a model of the 2017-to-2024 change. The cross-sectional models regressed the rating in a given year on those factors as measured in that year, identifying which factors were associated with the rating and whether those associations differed between 2017 and 2024. The change model regressed the change in rating on the changes in those factors and accounted for the time-invariant factors (ownership and rural-urban classification), identifying which factor changes were associated with the change in rating. An augmented change model additionally controlled for the 2017 baseline levels of the time-varying factors.

# Results

## Sample Characteristics and National Trends

After excluding hospitals with missing data in either year, the study sample included 2,380 hospitals. Among these hospitals, 66.5% were for-profit, 18.7% non-profit, and 14.8% government; 69.5% were urban, 20.8% large rural, and 9.7% small or isolated rural (Table 1). The mean overall rating declined from 3.45 to 3.27 stars, and the median ED time fell from 292 to 181 minutes. The counties these hospitals served also changed: on average their population grew by 2.4% and became older, less White, more Hispanic, more foreign-born, and more educated, while median household income rose about $12,800.

Rating gains and losses appeared across the country (Figure 1). Improvement concentrated in three areas — Appalachia, Florida, and the West Coast — while gains and declines were more intermixed elsewhere. Due to missing data, much of the sparsely populated interior West is unshaded.

## Factors Associated with Rating Levels in 2017 and 2024

The factors associated with the overall star rating were largely the same in 2017 and 2024, and the direction of each association held across the two years (Table 2, columns 1 and 2). Among hospital factors, non-profit hospitals scored lower than government-owned hospitals in both years, while for-profit hospitals scored similarly to government in 2017 but lower by 2024. Small rural hospitals scored higher than urban hospitals in both years, while large rural hospitals scored lower in 2017 but similar by 2024. A longer median ED time was associated with a lower rating in both years.

Among county factors, higher ratings were associated with more hospitals per 1,000 residents, a higher prevalence of self-reported poor health, and a higher proportion holding a bachelor's degree or above in both years. Lower ratings were associated with higher proportions aged 65 and over and foreign-born in both years. Higher poverty, overall and among adults 65 and over, was associated with lower ratings in 2024 but not in 2017.

## Factors Associated with Rating Change

In contrast to the broad set of factors associated with rating levels in each year, only a few were associated with the 2017-to-2024 change in rating (Table 2, columns 3 and 4). Among the factors that changed between 2017 and 2024, only the change in ED time and the change in median household income were associated with the change in rating. A reduction in ED time was associated with a small rating gain, about 0.002 stars per minute, while the change in median household income reached significance but was near zero in magnitude. No other county shift was associated with the change in rating. Among the hospital characteristics that did not change over the window, rural hospitals gained more relative to urban hospitals — large rural by about 0.12 stars and small rural by about 0.19 stars — and for-profit and non-profit hospitals declined more than government hospitals.
