# Citation key mapping after Zotero re-export — 2026-05-28

**Status: RESOLVED 2026-05-28.** Analyst pinned BBT-default keys in Zotero and re-exported; this file records the remapping that was applied to `outline.md`, `findings.md`, and `reference-research.md` so the manuscript markdown matches the bib. The two missing entries (HCRIS, Star Ratings Tech Notes) were deliberately removed from Zotero because their URLs no longer resolve, and the corresponding outline citations were dropped (see `reference-research.md` Q10/Q11 for the removal note).

---

After the Better BibTeX re-export, the bib has **33 entries** (down from 35 — two were removed because their URLs no longer resolve). Sixteen `[@key]` references in `outline.md` / `findings.md` / `reference-research.md` no longer matched the bib and have been remapped.

## Mismatches — outline cites a clean key, bib has the BBT-generated / raw-URL key

| Outline / markdown cites | Bib currently has | Notes |
|---|---|---|
| `@aca2010Sec3001HVBP` | `HttpsWwwcongressgovBill` | raw-URL key |
| `@ahaImpactCOVID19RuralHospitals2024` | `HttpsWwwahaorgGuidesreports` | raw-URL key |
| `@aspeRuralHospitalClosures2024` | `HttpsAspehhsgovSites` | raw-URL key |
| `@cmsHCAHPSPatientsPerspectives` | `HttpsWwwhcahpsonlineorg` | raw-URL key |
| `@cmsHospitalCareCompare` | `HttpsWwwmedicaregovCarecompare` | raw-URL key |
| `@cmsProviderOfServicesFile` | `HttpsDatacmsgovProvidercharacteristics` | raw-URL key |
| `@cmsHospitalOQRSpecsManual` | `HttpsQualitynetcmsgovOutpatient` | raw-URL key |
| `@fedreg85FR58432_FY2021IPPSFinalRule` | `HttpsWwwfederalregistergovDocuments` | raw-URL key |
| `@usdaERSRUCACodes2023` | `HttpsWwwersusdagovDataproducts` | raw-URL key |
| `@wwamiRUCAClassification` | `HttpsDeptswashingtoneduUwruca` | raw-URL key |
| `@nationalacademiesAccountingSocialRisk2016` | `committeeonaccountingforsocioeconomicstatusinmedicarepaymentprogramsAccountingSocialRisk2016` | 94-char BBT key |
| `@mansonIPUMSNHGIS2024` | `mansonNationalHistoricalGeographic2024` | BBT used full title, not "IPUMS NHGIS" |
| `@fitzpatrickRosenbaumHospitalPerformance2024` | `rosenbaumHospitalPerformanceHospital2024` | first author is "Rosenbaum, Kathleen E. Fitzpatrick" — BBT picked Rosenbaum |
| `@cassidySmithDisconfirmationParadigm2007` | `cassidy-smithDisconfirmationParadigmThroughput2007` | hyphen in author name + extra title word |
| `@soremekunFrameworkWaitTimes2011` | `soremekunFrameworkAnalyzingWait2011` | BBT picked "Analyzing", outline picked "WaitTimes" |
| `@wernerMedicareNewHospital2012` | `wernerMedicaresNewHospital2012` | possessive "Medicare's" → "Medicares" |

## Possibly missing from the re-export — bib has no entry, outline cites them

| Outline cites | What it was (in pre-export bib) | Status |
|---|---|---|
| `@cmsHCRIS` | `HttpsWwwcmsgovMedicare` (CMS HCRIS data page) | not in new export — was it removed from the Zotero collection, or did it fail to export? |
| `@cmsHCAHPSStarRatingsTechNotes2024` | `HttpsWwwhcahpsonlineorgGlobalassets` (HCAHPS Star Ratings Technical Notes) | same question |

If these items are still in the Zotero HCAHPS collection, the export may have skipped them (silent error?). If they were intentionally removed, the outline needs to drop the corresponding citations — flag for analyst decision.

## OK — outline key matches bib exactly

These 15 work as-is:

- `@beckettHospitalPatientExperience2025`
- `@beckettInpatientCareExperiences2025`
- `@beckettInterventionsHospitalCharacteristics2024`
- `@beckettTrendsHCAHPSSurvey2024`
- `@blandChallengesFacingCAHPS2022`
- `@bleusteinWaitTimesPatient2014`
- `@chenEffectPatientQuality2023`
- `@elliottChangesPatientExperiences2023`
- `@elliottUpdatedAdjustmentHCAHPS2025`
- `@gettelCalculationOverallHospital2024`
- `@greenlundPLACESLocalData2022`
- `@herrinHCAHPSScoresCommunity2018`
- `@mostafaStrategiesMeasureImprove2024`
- `@vuPatientSatisfactionRural2024`
- `@westreichTable2Fallacy2013`

## In bib, not cited anywhere yet

These 3 entries are in the bib but no `[@key]` reference exists for them yet:

- `fawadRuralityPatientsHospital2024` — Fawad et al. PLOS ONE 2024 (rurality and HCAHPS, multisite)
- `hungUnveilingDriversPatient2025` — Hung et al. PLOS One 2025 (regional patient-satisfaction drivers)

(Both are reasonable Discussion-section anchors if/when needed.)
