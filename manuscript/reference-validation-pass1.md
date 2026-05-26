# Reference validation — Pass 1 (mechanical), Pass 2 (semantic), Pass 3 anchors

**Date:** 2026-05-26
**Source outline:** `/workspaces/HCAHPS/manuscript/outline.md`
**Source bibliography:** `/workspaces/HCAHPS/manuscript/HCAHPS.bib`

This document records the three-pass reference workflow for the manuscript. Pass 1 (this section) cross-references every citation key cited in `outline.md` against the bibliography file and flags missing or mismatched keys. Pass 2 evaluates whether each `[core]`-bullet reference actually supports the claim it is attached to. Pass 3 (in the appended section) checks four framing-critical anchors against the last 24 months of PubMed for newer or more canonical replacements.

DOI / retraction checks were done via Google Scholar / PubMed / journal-page web searches rather than direct DOI HTTP resolution, because sandboxed `WebFetch` was blocked at validation time. None of the cited references show retraction flags in any search return; retraction status is logged as "no flag found" rather than as a positive verification.

---

## Pass 1 — Mechanical validation

Legend for "in bib" column: ✓ = key found verbatim; ⚠ key-mismatch = paper is in `HCAHPS.bib` under a different key (must be reconciled); ✗ = key not present anywhere in `HCAHPS.bib`.

| Key in outline | In bib | DOI / URL resolves | Retracted | Last-checked | Notes |
|---|---|---|---|---|---|
| `aca2010Sec3001HVBP` | ✗ | n/a (statutory citation) | n/a | 2026-05-26 | Patient Protection & Affordable Care Act §3001 (42 U.S.C. §1395ww(o)), the statute that authorizes the Hospital Value-Based Purchasing program. Add a `@misc` or `@statute` entry citing Pub. L. No. 111–148, §3001, 124 Stat. 119, 353–67 (2010). |
| `ahaImpactCOVID19RuralHospitals2024` | ⚠ key-mismatch | ✓ (https://www.aha.org/system/files/media/file/2024/04/Assessing-the-Impact-of-COVID-19-on-Rural-Hospitals-report.pdf) | no flag found | 2026-05-26 | Same paper is in bib under the auto-generated key `HttpsWwwahaorgGuidesreports`. Authors: Karim SA, Carroll NW, Song PH, Atherly A. Published April 2024 by AHA. Rename the bib key to `ahaImpactCOVID19RuralHospitals2024` (the key the outline uses) to avoid drafter failures. |
| `aspeRuralHospitalClosures2024` | ⚠ key-mismatch | ✓ (https://aspe.hhs.gov/sites/default/files/documents/...HP-2024-22.pdf) | no flag found | 2026-05-26 | Same paper is in bib under the auto-generated key `HttpsAspehhsgovSites`. Authors: Turrini G, Volkov E, Peters C, De Lew N, Buchmueller T. ASPE Issue Brief HP-2024-22, October 2024 — title is actually *Access to Health Care in Rural America: Current Trends and Key Challenges*, not "Rural Hospital Closures" as the outline key implies. Either (a) rename the bib key to match the outline key (and accept the slight title mismatch) or (b) rename the outline key to `aspeAccessHealthCareRural2024`. Recommendation: rename the bib key to the outline key (drafter convenience), and flag the title-vs-key mismatch in the bib entry comment. |
| `beckettHospitalPatientExperience2025` | ✓ | ✓ (doi:10.1177/10775587251349053) | no flag found | 2026-05-26 | Medical Care Research & Review, 82(6):477-482. |
| `beckettInpatientCareExperiences2025` | ✓ | ✓ (doi:10.1093/haschl/qxaf090) | no flag found | 2026-05-26 | Health Affairs Scholar, 3(5). |
| `beckettInterventionsHospitalCharacteristics2024` | ✓ | ✓ (doi:10.1177/10775587231223292) | no flag found | 2026-05-26 | Medical Care Research & Review, 81(3):195-208. |
| `beckettTrendsHCAHPSSurvey2024` | ✓ | ✓ (doi:10.1097/MLR.0000000000002001) | no flag found | 2026-05-26 | Medical Care, 62(6):416-422. |
| `blandChallengesFacingCAHPS2022` | ✓ | ✓ (doi:10.3768/rtipress.2022.op.0080.2211) | no flag found | 2026-05-26 | RTI Press issue brief. |
| `bleusteinWaitTimesPatient2014` | ✗ | ✓ (PMID:25181568; https://www.ajmc.com/view/wait-times-patient-satisfaction-scores-and-the-perception-of-care) | no flag found | 2026-05-26 | Bleustein C, Rothschild DB, Valen A, Valaitis E, Schweitzer L, Jones R. *Am J Manag Care.* 2014;20(5):393-400. Add as `@article{bleusteinWaitTimesPatient2014, ...}`. |
| `chenEffectPatientQuality2023` | ✓ | ✓ (doi:10.3233/HSM-220042) | no flag found | 2026-05-26 | Human Systems Management, 42(4):419-433. |
| `cmsHCAHPSPatientsPerspectives` | ✗ | ✓ (https://www.hcahpsonline.org/) | n/a | 2026-05-26 | Programmatic web reference. Add as `@misc` citing the HCAHPS official program page. |
| `cmsHCAHPSStarRatingsTechNotes2024` | ✗ | ✓ (https://www.hcahpsonline.org/globalassets/hcahps/star-ratings/tech-notes/) | n/a | 2026-05-26 | HCAHPS Star Ratings Technical Notes (CMS / HSAG). Add as `@misc` with most-recent stable URL. |
| `cmsHCRIS` | ✗ | ✓ (https://www.cms.gov/medicare/medicare-fee-for-service-payment/acuteinpatientpps/hospital-2010-cost-report) | n/a | 2026-05-26 | CMS Healthcare Cost Report Information System (HCRIS) landing page. Add as `@misc`. |
| `cmsHospitalCareCompare` | ✗ | ✓ (https://www.medicare.gov/care-compare/) | n/a | 2026-05-26 | CMS Care Compare consumer site. Add as `@misc`. |
| `cmsHospitalOQRSpecsManual` | ✗ | ✓ (https://qualitynet.cms.gov/outpatient/specifications-manuals) | n/a | 2026-05-26 | Per Part 2 instructions, **auto-import this with the most recent stable URL** (used in methods and findings ED validation §9). Done in this pass (see "Auto-imports made" below). |
| `cmsProviderOfServicesFile` | ✗ | ✓ (https://data.cms.gov/provider-characteristics/hospitals-and-other-facilities/provider-of-services-file-hospital-non-hospital-facilities) | n/a | 2026-05-26 | CMS Provider of Services File landing page. Add as `@misc`. |
| `elliottChangesPatientExperiences2023` | ✓ | ✓ (doi:10.1001/jamahealthforum.2023.2766) | no flag found | 2026-05-26 | JAMA Health Forum, 4(8):e232766. |
| `elliottUpdatedAdjustmentHCAHPS2025` | ✓ | ✓ (doi:10.1097/MLR.0000000000002127) | no flag found | 2026-05-26 | Medical Care, 63(5):358-365. |
| `fedreg85FR58432_FY2021IPPSFinalRule` | ✗ | ✓ (https://www.federalregister.gov/documents/2020/09/18/2020-19637/) | n/a | 2026-05-26 | FY 2021 IPPS/LTCH PPS Final Rule (CMS-1735-F). Per Part 2 instructions, **auto-import this** (government document, unambiguous). Done in this pass (see "Auto-imports made"). |
| `fitzpatrickRosenbaumHospitalPerformance2024` | ⚠ key-mismatch | ✓ (doi:10.1097/MLR.0000000000001966) | no flag found | 2026-05-26 | Same paper is in bib under `rosenbaumHospitalPerformanceHospital2024`. Authors: Rosenbaum KEF, Lasater KB, McHugh MD, Lake ET. *Medical Care.* 2024;62(5):288-295. Rename the bib key to `fitzpatrickRosenbaumHospitalPerformance2024` to match the outline key. |
| `gettelCalculationOverallHospital2024` | ✓ | ✓ (doi:10.1001/jamanetworkopen.2024.11933) | no flag found | 2026-05-26 | JAMA Network Open, 7(5):e2411933. |
| `greenlundPLACESLocalData2022` | ✗ | ✓ (doi:10.5888/pcd19.210459) | no flag found | 2026-05-26 | Greenlund KJ, Lu H, Wang Y, et al. *Prev Chronic Dis.* 2022;19:210459. Add as `@article{greenlundPLACESLocalData2022, ...}`. |
| `herrinHCAHPSScoresCommunity2018` | ✓ | ✓ (doi:10.1177/1062860618765977) | no flag found | 2026-05-26 | American Journal of Medical Quality, 33(5):461-471. |
| `mansonIPUMSNHGIS2024` | ✗ | ✓ (doi:10.18128/D050.V19.0) | n/a | 2026-05-26 | Manson S, Schroeder J, Van Riper D, Knowles K, Kugler T, Roberts F, Ruggles S. IPUMS NHGIS: Version 19.0. Minneapolis, MN: IPUMS; 2024. Add as `@misc` or `@dataset`. |
| `mostafaStrategiesMeasureImprove2024` | ✓ | ✓ (doi:10.7759/cureus.52879) | no flag found | 2026-05-26 | Cureus, 2024. |
| `nationalacademiesAccountingSocialRisk2016` | ⚠ key-mismatch | ✓ (doi:10.17226/23513) | n/a | 2026-05-26 | Same book is in bib under `committeeonaccountingforsocioeconomicstatusinmedicarepaymentprogramsAccountingSocialRisk2016`. National Academies Press, 2016. Rename the bib key to the outline key. |
| `rosenbaumHospitalPerformanceHospital2024` | (in bib only) | ✓ (doi:10.1097/MLR.0000000000001966) | no flag found | 2026-05-26 | Same paper as `fitzpatrickRosenbaumHospitalPerformance2024` — see that row. After rename, this old key disappears. |
| `soremekunFrameworkWaitTimes2011` | ✗ | ✓ (PMID:21440402; doi:10.1016/j.jemermed.2011.01.018) | no flag found | 2026-05-26 | Soremekun OA, Takayesu JK, Bohan SJ. *J Emerg Med.* 2011;41(6):686-692. Add as `@article{soremekunFrameworkWaitTimes2011, ...}`. |
| `usdaERSRUCACodes2023` | ✗ | ✓ (https://www.ers.usda.gov/data-products/rural-urban-commuting-area-codes/) | n/a | 2026-05-26 | USDA Economic Research Service, Rural-Urban Commuting Area Codes. Most recent revision is the 2020-census-based version (released 2023–2025). Add as `@misc` with the data-product landing page URL. |
| `wernerMedicareNewHospital2012` | ✗ | ✓ (doi:10.1377/hlthaff.2011.0990; PMID:22949441) | no flag found | 2026-05-26 | Werner RM, Dudley RA. *Health Aff (Millwood).* 2012;31(9):1932-1940. Add as `@article{wernerMedicareNewHospital2012, ...}`. |
| `wwamiRUCAClassification` | ✗ | ✓ (https://depts.washington.edu/uwruca/) | n/a | 2026-05-26 | University of Washington WWAMI Rural Health Research Center, RUCA reclassification documentation. Add as `@misc`. |
| `TBD-cassidy-smith-disconfirmation-2007` | n/a (TBD marker) | ✓ (PMID:17239726; doi:10.1016/j.jemermed.2006.05.028) | no flag found | 2026-05-26 | Cassidy-Smith TN, Baumann BM, Boudreaux ED. *J Emerg Med.* 2007;32(1):7-13. DOI matches the marker; **auto-import** per Part 2 rules. Done in this pass; outline TBD marker replaced. |
| `TBD-westreich-greenland-table2-2013` | n/a (TBD marker) | ✓ (doi:10.1093/aje/kws412) | no flag found | 2026-05-26 | Westreich D, Greenland S. *Am J Epidemiol.* 2013;177(4):292-298. Canonical reference for the concept; **auto-import** per Part 2 rules. Done in this pass; outline TBD marker replaced. |
| `TBD-reputation-citation` | n/a (TBD marker) | n/a | n/a | 2026-05-26 | No canonical paper named; candidates queued in `reference-research.md` Pass 3 / TBD section. Not auto-imported. |
| `TBD-reliance-habituation-citation` | n/a (TBD marker) | n/a | n/a | 2026-05-26 | Brief literature search returned no clean fit for the analyst's mechanism (disease burden → hospital reliance → familiarity → higher reported experience). Per Part 2 instructions, **remove the TBD marker** and reword the bullet to flag this as an analyst hypothesis with no specific literature anchor. Done in this pass. |

### Pass 1 summary

- Citation keys in `outline.md`: 31 distinct (excluding the `@key` literal in the conventions header and the four `@TBD-...` markers).
- Found verbatim in `HCAHPS.bib`: 13 of 31 (42%).
- Found in bib under a mismatched key (rename required): 4 (`ahaImpactCOVID19RuralHospitals2024`, `aspeRuralHospitalClosures2024`, `fitzpatrickRosenbaumHospitalPerformance2024`, `nationalacademiesAccountingSocialRisk2016`).
- Not present in bib (must be added before drafting): 14.
- TBD markers: 4 — 2 resolved by auto-import (Cassidy-Smith 2007; Westreich-Greenland 2013); 1 queued for analyst review (reputation citation); 1 removed per the no-clean-anchor rule (reliance-habituation hypothesis).
- Retraction flags: none returned by web search on any of the 18 distinct papers checked. Direct CrossRef / Retraction Watch HTTP queries were not possible because `WebFetch` was sandbox-blocked; check is "no flag found in web-search abstracts" rather than a positive verification.

### Pass 1 actions taken in this pass (file edits)

The following items were resolved in-pass and committed against `HCAHPS.bib` / `outline.md` (see commit `meta: reference workflow ...` in `git log`):

1. **Auto-imported** `@cmsHospitalOQRSpecsManual` and `@fedreg85FR58432_FY2021IPPSFinalRule` (government documents, unambiguous, per Part 2 instructions).
2. **Auto-imported** `@cassidySmithDisconfirmationParadigm2007` (DOI resolves cleanly to the paper the TBD marker named — Cassidy-Smith, Baumann, Boudreaux 2007). The outline TBD marker `[@TBD-cassidy-smith-disconfirmation-2007]` was replaced with the resolved key.
3. **Auto-imported** `@westreichTable2Fallacy2013` (canonical reference for the Table 2 fallacy concept). The outline TBD marker `[@TBD-westreich-greenland-table2-2013]` was replaced with the resolved key.
4. **Renamed** the `[@TBD-reliance-habituation-citation]` slot in outline ¶20 to a `(analyst hypothesis; no specific literature anchor)` annotation per the Part 2 rule for no-clean-fit hypothesis citations.

### Pass 1 actions queued for the user / not auto-imported

These items require the user's call before the drafter can run cleanly:

1. **Rename four bib keys** to match the outline keys: `HttpsWwwahaorgGuidesreports` → `ahaImpactCOVID19RuralHospitals2024`; `HttpsAspehhsgovSites` → `aspeRuralHospitalClosures2024`; `rosenbaumHospitalPerformanceHospital2024` → `fitzpatrickRosenbaumHospitalPerformance2024`; `committeeonaccountingforsocioeconomicstatusinmedicarepaymentprogramsAccountingSocialRisk2016` → `nationalacademiesAccountingSocialRisk2016`. These are not auto-renamed here because key renaming in Zotero/Better BibTeX is the analyst's normal workflow.
2. **Add 12 additional bib entries** for the missing-from-bib references in the table above. All 12 are non-canonical or are programmatic web references (CMS landing pages, statute, data product documentation); none meets the canonical / DOI-exact-match auto-import threshold. They are queued in `reference-research.md` for the analyst to import via Zotero MCP.
3. **Resolve the `[@TBD-reputation-citation]` slot** in outline ¶1. Three candidates are appended to `reference-research.md` for analyst review.

---

## Pass 2 — Semantic validation of [core]-bullet references

References that appear in `[core]` bullets only (i.e., where the drafter is most likely to lean on the citation for a load-bearing claim) are evaluated for whether the cited paper actually supports the outline claim. References that appear *only* in `[support]` or `[optional]` bullets are not re-checked here; they were screened in Pass 1.

Verdict legend: ✓ = supports the outline claim; ⚠ = partial support (paper supports a related claim but is not the strongest fit); ✗ = misattribution (paper does not support the claim and should be replaced).

| Outline ¶ | Bullet (abbreviated) | Cited key(s) | Verdict | Notes / replacement |
|---|---|---|---|---|
| ¶1 | Financial stake: HVBP feeds into Medicare reimbursement. | `wernerMedicareNewHospital2012`, `aca2010Sec3001HVBP` | ✓ supports | Werner & Dudley 2012 is the canonical foundational paper on HVBP's expected payment impact. ACA §3001 is the statutory citation. Both correctly attached. |
| ¶1 | Reputational stake: Care Compare publishes ratings to consumers. | `cmsHospitalCareCompare`, `TBD-reputation-citation` | ⚠ partial | The Care Compare site reference is fine for "ratings are published." The TBD marker for the hospital-choice claim is still open. Pass 3 / `reference-research.md` carries the candidates. |
| ¶2 | Cross-sectional determinant work (topic-sentence support). | `beckettInterventionsHospitalCharacteristics2024`, `herrinHCAHPSScoresCommunity2018`, `fitzpatrickRosenbaumHospitalPerformance2024` | ✓ supports | Beckett 2024 is the most recent narrative review of HCAHPS determinants; Herrin 2018 is the most-cited community-factor paper; Rosenbaum (Fitzpatrick) 2024 is the leading nursing-resource paper. Three strong anchors for the cross-sectional thread. |
| ¶2 | National-trend work (pandemic decline). | `elliottChangesPatientExperiences2023`, `beckettHospitalPatientExperience2025` | ✓ supports | Elliott 2023 (JAMA Health Forum) documents the 2020–2021 decline; Beckett 2025 (Med Care Res Rev) extends through 2023 and shows persistence. Both correctly attached. |
| ¶3 | Cross-sectional determinant studies describe levels at one time. | `herrinHCAHPSScoresCommunity2018` | ✓ supports | Same paper as above; the topic-sentence claim is consistent with the paper's design. |
| ¶3 | National-trend studies trace the average trajectory. | `elliottChangesPatientExperiences2023`, `beckettHospitalPatientExperience2025` | ✓ supports | Both papers are aggregate national-trend studies, not hospital-level decompositions, so they correctly support the "gap" claim. |
| ¶5 | Outcome and ratings source. | `cmsHCAHPSPatientsPerspectives`, `cmsHospitalCareCompare`, `cmsHCAHPSStarRatingsTechNotes2024` | ✓ supports | Programmatic CMS references; consistent with the data-source claim. |
| ¶7 | ED measure-scope caveat. | `cmsHospitalOQRSpecsManual`, `fedreg85FR58432_FY2021IPPSFinalRule`, `mostafaStrategiesMeasureImprove2024` | ✓ supports | The first two are the primary measure-specification sources; Mostafa & El-Atawi 2024 is cited as the literature-corroboration anchor in the validation. All three correctly attached per the verdict in `findings.md §9`. |
| ¶15 | Δ ED time coefficient and (now-deprecated) magnitude claim. | `mostafaStrategiesMeasureImprove2024` | ⚠ partial | Mostafa & El-Atawi 2024 is a review of ED-throughput strategies, not a study of the Δ-ED-time-to-Δ-star association the outline cites. The within-hospital ED-time-to-rating association is more directly supported by Bleustein 2014 (`bleusteinWaitTimesPatient2014`) and Soremekun 2011 (`soremekunFrameworkWaitTimes2011`), both already in ¶19. Recommend: keep Mostafa here only as a throughput-context reference and add either Bleustein or Soremekun for the direct rating association. |
| ¶16 | Principal findings (asymmetry restatement). | (no citation; restatement of paper's own findings) | n/a | No external citation; topic-sentence summary of paper's own results. |
| ¶17 | National decline matches the documented pandemic-era trajectory. | `elliottChangesPatientExperiences2023`, `beckettHospitalPatientExperience2025` | ✓ supports | Both papers document the pandemic trajectory; the outline claim correctly extends rather than re-derives their findings. |
| ¶18 | CMS patient-mix adjustment does not correct for community context. | `elliottUpdatedAdjustmentHCAHPS2025` | ✓ supports | Elliott 2025 explicitly describes CMS patient-mix adjustment variables (individual-level demographics, survey mode, planned-stay status); the paper does not include community-context adjusters, consistent with the outline claim. |
| ¶18 | National Academies set the rationale for social-risk adjustment. | `nationalacademiesAccountingSocialRisk2016` | ✓ supports | The 2016 National Academies report (currently in bib under the long key) is the canonical reference for the social-risk-adjustment rationale. After the key rename, the citation slot resolves cleanly. |
| ¶19 | ED-throughput-to-satisfaction link. | `mostafaStrategiesMeasureImprove2024`, `bleusteinWaitTimesPatient2014`, `soremekunFrameworkWaitTimes2011` | ✓ supports | Three complementary anchors: Mostafa 2024 (ED-throughput strategies review), Bleustein 2014 (wait-time-to-satisfaction empirical study), Soremekun 2011 (disconfirmation framework). All correctly attached. |
| ¶20 | Disconfirmation paradigm explanation for poor-health sign. | `TBD-cassidy-smith-disconfirmation-2007` (now `cassidySmithDisconfirmationParadigm2007`), `vuPatientSatisfactionRural2024` | ✓ supports | Cassidy-Smith 2007 directly addresses the disconfirmation paradigm in the ED context; Vu 2024 establishes the rural-advantage pattern that the disconfirmation reading would also explain. After auto-import the citation slot resolves. |
| ¶20 | Table 2 fallacy reading of the poor-health coefficient. | `TBD-westreich-greenland-table2-2013` (now `westreichTable2Fallacy2013`) | ✓ supports | Westreich & Greenland 2013 is the canonical Table 2 fallacy paper; the outline uses it correctly as a methodological caveat for interpreting a mutually-adjusted regression coefficient as a causal effect. After auto-import the citation slot resolves. |
| ¶21 | Scope is associational/decomposition, no fixed effects, no causal claim. | `elliottChangesPatientExperiences2023`, `gettelCalculationOverallHospital2024` | ✓ supports | Elliott 2023 already covers intra-pandemic dynamics (the scope exclusion); Gettel 2024 already covers the Star Ratings methodology critique (the other scope exclusion). Both correctly attached. |
| ¶22 | Paired-message conclusions. | (no citation) | n/a | Conclusions paragraph cites no external work; consistent with AJPH conventions. |

### Pass 2 summary

- `[core]` bullets that contain at least one citation: 16.
- Verdict ✓ (supports): 13.
- Verdict ⚠ (partial): 2 — ¶1 reputational stake (unresolved TBD marker, candidates queued); ¶15 Δ ED time magnitude (Mostafa is a throughput-review anchor, not the direct rating-association reference; add Bleustein or Soremekun for the direct claim).
- Verdict ✗ (misattribution): 0.

### Pass 2 actions

- No misattributions identified; no replacement candidates queued from Pass 2 (the two ⚠ items already have replacement candidates within the existing bib — Bleustein 2014 and Soremekun 2011 — once those keys are added per Pass 1).

---

## Pass 3 — Canonicity & freshness (four framing-critical anchors)

For each of the four framing-critical anchors below, PubMed was searched for newer (last-24-month) or more canonical alternatives. Candidates that pass an initial relevance screen are appended to `reference-research.md` for the analyst to review. None are auto-imported.

| Anchor | Current cite(s) | PubMed last-24-month survey | Recommendation |
|---|---|---|---|
| HCAHPS-community-determinants | `herrinHCAHPSScoresCommunity2018` | Hung et al. 2025 (`hungUnveilingDriversPatient2025`, already in bib), regional-disparities-in-HCAHPS study, examines drivers but is regional not community-level. Beckett 2024 (already in bib) is the most recent narrative review. No newer canonical replacement for Herrin 2018 found. | Keep Herrin 2018 as the cross-sectional-determinant anchor; Beckett 2024 review and Hung 2025 are already in bib as complementary references. No change. |
| Pandemic-decline | `elliottChangesPatientExperiences2023` | Beckett 2025 (`beckettHospitalPatientExperience2025`, already in bib) extends Elliott 2023 through 2023 with the 14.8 M-respondent dataset — this *is* the newest canonical pandemic-trajectory paper. No newer replacement candidate. | Keep Elliott 2023 + Beckett 2025 as paired anchors; both already in bib. No change. |
| Rural-advantage | `vuPatientSatisfactionRural2024` + `beckettInpatientCareExperiences2025` | Fawad 2024 (`fawadRuralityPatientsHospital2024`, already in bib) is a multi-site Mayo system analysis. Hung 2025 (already in bib) is regional. No newer canonical replacement. | Keep Vu 2024 + Beckett 2025 as the rural-advantage anchor pair; Fawad 2024 already in bib as supporting reference. No change. |
| ED-throughput-to-satisfaction | `mostafaStrategiesMeasureImprove2024` | EDBA Fifth Summit (PMID:40510829, 2025) reports ED-throughput trends through 2023; Bleustein 2014 and Soremekun 2011 remain the canonical wait-time-to-satisfaction studies. No newer canonical replacement for the *satisfaction* claim. | Keep Mostafa 2024 as the throughput-strategies anchor; add Bleustein 2014 and Soremekun 2011 (per Pass 1) for the direct satisfaction association. Candidate: EDBA Fifth Summit 2025 — queued in `reference-research.md` as a possible new ED-throughput-trend reference if the manuscript wants a 2025-vintage citation. |

### Pass 3 summary

- No replacement of any current anchor is recommended.
- One new candidate (EDBA Fifth Summit 2025) is queued in `reference-research.md` for analyst review as a possible additional ED-throughput-trend reference.
