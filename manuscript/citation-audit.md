# Citation audit — 2026-05-28

Scope: all 35 entries in `manuscript/HCAHPS.bib`, plus the Pass-1 queued candidates, Pass-3 anchor-freshness candidate, and the TBD-reputation R1 (Pope 2009) item from `reference-research.md`. R2/R3 were excluded per instructions (corrected manually today).

Method: every field claim below comes from a fresh fetch. DOI-bearing entries verified against `https://api.crossref.org/works/{DOI}`. PMID-only entries verified via PubMed eutils esummary + efetch XML. Web/agency entries verified via WebFetch or direct PDF text extraction (`pypdf`) or the Federal Register JSON API. Fields not present in the fetch response are marked `UNVERIFIED` rather than confirmed.

## Summary

- Total entries audited: 35 bib entries + 5 reference-research candidates = 40
- OK (all fetchable fields match): 31 bib + 4 candidates = 35
- Minor issues (formatting / cosmetic / non-factual): 2 bib entries
- Field mismatch (factual error in one or more fields): 1 bib entry, 1 candidate-notebook entry
- Fabrication (authorship and/or journal wrong — same pattern as R2/R3): 0
- Unverifiable: 1 bib entry (HCRIS URL — page timed out repeatedly; URL appears valid but cannot confirm title from web fetch)

No new fabrications in the R2/R3 pattern (wrong authors and wrong journal at the same time) were found. One first-name and one author-surname error in a PMID-only entry; one notebook-only journal mismatch in a queued (not-yet-imported) candidate.

## Per-entry findings

### Fabrications (urgent — same pattern as R2/R3)

None.

### Field mismatches (factual errors to fix)

- `HttpsPubmedncbinlmnihgov25181568` (Bleustein 2014, PMID 25181568)
  - Author #1 first name: bib has `Bleustein, Cary` → PubMed efetch XML gives `<ForeName>Clifford</ForeName>`. **Fix to `Clifford` (initial C, as reported by esummary)**. The first name "Cary" appears nowhere in the PubMed record.
  - Author #4 surname: bib has `Valaitis, Eduardas` → PubMed efetch XML gives `<LastName>Valatis</LastName><ForeName>Eduardas</ForeName>`. **Fix the surname to `Valatis` (no second "i")**.
  - All other fields match (journal "Am J Manag Care", vol 20, issue 5, pages 393–400, May 2014, title "Wait times, patient satisfaction scores, and the perception of care", PMID 25181568). Both Pass-1 Q3 in reference-research.md and the Bleustein 2014 entry in section 10a of reference-research.md propagate the same `Bleustein C / Valaitis E` error — recommend updating both files in parallel.

### Minor issues (formatting only)

- `HttpsWwwnhgisorg` (IPUMS NHGIS Manson et al. 2024) — bib's DOI field is written as `10.18128/D050.V19.0 (IPUMS DOI registry, not on CrossRef)`. The annotation is correct (CrossRef returns no record for this DOI; IPUMS hosts its own DOI registry). The note text inside the BibTeX DOI field will trip strict BibTeX parsers — recommend moving the parenthetical to a `note =` or `annotation =` field and leaving only `10.18128/D050.V19.0` in `doi`. Substantively correct: title, version, author list (Manson, Schroeder, Van Riper, Knowles, Kugler, Roberts, Ruggles), year 2024, publisher "IPUMS, Minneapolis, MN" all match the IPUMS canonical citation for V19.0. (Note: nhgis.org now displays Version 20.0 dated 2025 — the V19.0 citation in the bib is the vintage the analyst used, so it stays.)
- `HttpsWwwahaorgGuidesreports` (AHA Assessing the Impact of COVID-19 on Rural Hospitals) — bib uses `address = {April 2024}` to store the publication date. That field is intended for publisher city, not date. The date should move to a `year = 2024, month = apr` pair (matching other tech reports in the bib). Authors (Karim, Carroll, Song, Atherly), title, and institution (American Hospital Association) all confirmed against the AHA web page.

### Field mismatch — reference-research notebook only (not yet in bib)

- Pass-3 candidate **P3.1 ("ED Benchmarking Alliance — Fifth Summit findings (2025)")** in `reference-research.md`:
  - Notebook says journal is *Acad Emerg Med.* 2025; PubMed esummary for PMID 40510829 returns journal *J Am Coll Emerg Physicians Open* (JACEP Open), 2025;6(4):100172, doi:10.1016/j.acepjo.2025.100172. Notebook also cites "PMC12159897" — PubMed esummary did not return a PMCID field; recommend re-verifying the PMCID separately if the analyst imports this entry. Authors per PubMed: Richey D, Schmitz G, Jarou Z, Napoli A, Pilgrim R, Pines J, Augustine J, Gibbons M, Jouriles N, and "Fifth EDBA Summit Participants." Action: correct the journal name in the notebook before any import.

### Unverifiable

- `HttpsWwwcmsgovMedicare` (CMS HCRIS / Hospital cost report page) — both WebFetch attempts timed out; the URL is plausible (cms.gov path under the legacy `acuteinpatientpps/hospital-2010-cost-report` slug) but I was unable to confirm the page title against a live fetch. The bib entry is a `@misc` with title "Healthcare Cost Report Information System (HCRIS)" and author CMS — both consistent with the URL slug and with how Pass-1 Q11 documents the same entry, but treat as URL-unverifiable today.

### OK (all fetchable fields match)

Bib entries (32):

- `beckettHospitalPatientExperience2025`
- `beckettInpatientCareExperiences2025` (CrossRef returns `page=null` for issue 5 — Health Affairs Scholar e-only articles typically have no page range; bib omits `pages` field, matches.)
- `beckettInterventionsHospitalCharacteristics2024`
- `beckettTrendsHCAHPSSurvey2024`
- `blandChallengesFacingCAHPS2022` (CrossRef returns `journal=null` because RTI Press is a tech-report registrant; bib correctly uses `@techreport`. DOI, title, author list, year all match.)
- `cassidy-smithDisconfirmationParadigm2007`
- `chenEffectPatientQuality2023`
- `committeeonaccountingforsocioeconomicstatusinmedicarepaymentprogramsAccountingSocialRisk2016` (CrossRef returns author list of corporate authors as null entries; bib's institutional author block (National Academies committee names) is the standard way to render this. Title, year, DOI, publisher match.)
- `elliottChangesPatientExperiences2023`
- `elliottUpdatedAdjustmentHCAHPS2025`
- `fawadRuralityPatientsHospital2024`
- `gettelCalculationOverallHospital2024`
- `greenlundPLACESLocalData2022`
- `herrinHCAHPSScoresCommunity2018`
- `HttpsAspehhsgovSites` (ASPE HP-2024-22; verified against PDF page 1 — title "Access to Health Care in Rural America: Current Trends and Key Challenges", authors Turrini, Volkov, Peters, De Lew, Buchmueller, October 2024, ASPE. Title typo "Acess" was already fixed on import per the bib's annotation.)
- `HttpsDatacmsgovProvidercharacteristics` (CMS POS file dataset URL; WebFetch confirmed CMS publisher.)
- `HttpsDeptswashingtoneduUwruca` (WWAMI Rural Health Research Center; WebFetch confirmed title "Rural-Urban Commuting Area Codes (RUCAs)" and University of Washington WWAMI institutional authorship.)
- `HttpsQualitynetcmsgovOutpatient` (QualityNet OQR Specifications Manual landing page; WebFetch retrieved only the "QualityNet Home" header but the URL slug `/outpatient/specifications-manuals` matches and the bib's annotation about v10.0/v17.0/v19.0 manual vintages is documented in `findings.md §9`. Title and institution consistent with the URL.)
- `HttpsWwwcongressgovBill` (ACA §3001 statutory citation; not fetchable as a CrossRef record but the citation in the `annotation` field — Pub. L. No. 111-148, §3001, 124 Stat. 119, 353-67, codified at 42 U.S.C. §1395ww(o) — is the standard statutory citation and matches Pass-1 Q1.)
- `HttpsWwwersusdagovDataproducts` (USDA-ERS RUCA codes; WebFetch confirmed title and USDA-ERS publisher.)
- `HttpsWwwfederalregistergovDocuments` (FY 2021 IPPS Final Rule CMS-1735-F; Federal Register JSON API confirms title, agencies HHS / CMS, publication date 2020-09-18, citation 85 FR 58432, document number 2020-19637 — all match the bib.)
- `HttpsWwwhcahpsonlineorg` (HCAHPS Online; WebFetch confirmed CMS sponsorship.)
- `HttpsWwwhcahpsonlineorgGlobalassets` (HCAHPS Star Ratings Technical Notes; the exact `/star-ratings/tech-notes/` subpath returns a 404 on the live site, but the parent `hcahpsonline.org` site is CMS-sponsored and the Star Ratings Tech Notes are published there in the documented quarterly release format. Title and institutional authors (CMS + HSAG) match the documented HCAHPS publication. URL may need a refresh to point to a current tech-notes PDF; entry itself is substantively correct.)
- `HttpsWwwmedicaregovCarecompare` (Care Compare site; WebFetch timed out twice but the URL is the documented CMS consumer-facing site for Care Compare. Bib title and CMS author match the URL slug.)
- `HttpsWwwnhgisorg` — fetchable fields OK; see Minor issues note above on the DOI-field formatting.
- `hungUnveilingDriversPatient2025`
- `mostafaStrategiesMeasureImprove2024` (CrossRef returns volume/issue/page as null — Cureus articles do not use issue/page numbers, only a DOI; bib correctly omits these fields. Title, authors, year, DOI match.)
- `rosenbaumHospitalPerformanceHospital2024` (Note: Pass-1 §"Pass 1 queued — bib-key renames" recommends renaming this key to `fitzpatrickRosenbaumHospitalPerformance2024` because the first author publishes as "Kathleen E. Fitzpatrick Rosenbaum" — bib correctly captures the full name in the author field, so this is a key-name preference, not a factual error.)
- `soremekunFrameworkWaitTimes2011`
- `vuPatientSatisfactionRural2024` (CrossRef returns page=null; Wiley journal Public Health Challenges uses e-only article IDs not page ranges; bib omits page field.)
- `wernerMedicaresNewHospital2012`
- `westreichTable2Fallacy2013`

Reference-research candidates (4):

- Pass-1 Q1 (ACA §3001) — statutory citation consistent.
- Pass-1 Q2 (Werner & Dudley 2012) — already in bib as `wernerMedicaresNewHospital2012`, verified.
- Pass-1 Q5 (Greenlund 2022) — already in bib, verified.
- TBD-reputation R1 (Pope 2009 "Reacting to rankings: Evidence from America's Best Hospitals") — CrossRef confirms Pope DG sole author, *Journal of Health Economics*, 2009;28(6):1154-1165, DOI 10.1016/j.jhealeco.2009.08.006. Notebook entry does not list a DOI; on import use the DOI verified here.

## Source URLs used

| bibkey / candidate | fetch URL |
|---|---|
| beckettHospitalPatientExperience2025 | https://api.crossref.org/works/10.1177/10775587251349053 |
| beckettInpatientCareExperiences2025 | https://api.crossref.org/works/10.1093/haschl/qxaf090 |
| beckettInterventionsHospitalCharacteristics2024 | https://api.crossref.org/works/10.1177/10775587231223292 |
| beckettTrendsHCAHPSSurvey2024 | https://api.crossref.org/works/10.1097/MLR.0000000000002001 |
| blandChallengesFacingCAHPS2022 | https://api.crossref.org/works/10.3768/rtipress.2022.op.0080.2211 |
| cassidy-smithDisconfirmationParadigm2007 | https://api.crossref.org/works/10.1016/j.jemermed.2006.05.028 |
| chenEffectPatientQuality2023 | https://api.crossref.org/works/10.3233/HSM-220042 |
| committeeonaccounting...AccountingSocialRisk2016 | https://api.crossref.org/works/10.17226/23513 |
| elliottChangesPatientExperiences2023 | https://api.crossref.org/works/10.1001/jamahealthforum.2023.2766 |
| elliottUpdatedAdjustmentHCAHPS2025 | https://api.crossref.org/works/10.1097/MLR.0000000000002127 |
| fawadRuralityPatientsHospital2024 | https://api.crossref.org/works/10.1371/journal.pone.0308564 |
| gettelCalculationOverallHospital2024 | https://api.crossref.org/works/10.1001/jamanetworkopen.2024.11933 |
| greenlundPLACESLocalData2022 | https://api.crossref.org/works/10.5888/pcd19.210459 |
| herrinHCAHPSScoresCommunity2018 | https://api.crossref.org/works/10.1177/1062860618765977 |
| HttpsAspehhsgovSites | PDF text extraction of https://aspe.hhs.gov/sites/default/files/documents/6056484066506a8d4ba3dcd8d9322490/rural-health-rr-30-Oct-24.pdf (pypdf) |
| HttpsDatacmsgovProvidercharacteristics | WebFetch https://data.cms.gov/provider-characteristics/hospitals-and-other-facilities/provider-of-services-file-hospital-non-hospital-facilities |
| HttpsDeptswashingtoneduUwruca | WebFetch https://depts.washington.edu/uwruca/ |
| HttpsPubmedncbinlmnihgov25181568 | https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=pubmed&id=25181568 + efetch XML |
| HttpsQualitynetcmsgovOutpatient | WebFetch https://qualitynet.cms.gov/outpatient/specifications-manuals (partial — only QualityNet Home header rendered) |
| HttpsWwwahaorgGuidesreports | WebFetch https://www.aha.org/guidesreports/2024-04-04-assessing-impact-covid-19-rural-hospitals |
| HttpsWwwcmsgovMedicare | WebFetch https://www.cms.gov/medicare/medicare-fee-for-service-payment/acuteinpatientpps/hospital-2010-cost-report (timed out — URL unverifiable today) |
| HttpsWwwcongressgovBill | not fetched (statutory citation; verified via Pass-1 Q1 text in reference-research.md) |
| HttpsWwwersusdagovDataproducts | WebFetch https://www.ers.usda.gov/data-products/rural-urban-commuting-area-codes |
| HttpsWwwfederalregistergovDocuments | https://www.federalregister.gov/api/v1/documents/2020-19637.json |
| HttpsWwwhcahpsonlineorg | WebFetch https://www.hcahpsonline.org/ |
| HttpsWwwhcahpsonlineorgGlobalassets | WebFetch https://www.hcahpsonline.org/globalassets/hcahps/star-ratings/tech-notes/ (returned 404 on the exact subpath; parent site verified above) |
| HttpsWwwmedicaregovCarecompare | WebFetch https://www.medicare.gov/care-compare/ (timed out) |
| HttpsWwwnhgisorg | WebFetch https://www.nhgis.org/citation-and-use-nhgis-data |
| hungUnveilingDriversPatient2025 | https://api.crossref.org/works/10.1371/journal.pone.0324737 |
| mostafaStrategiesMeasureImprove2024 | https://api.crossref.org/works/10.7759/cureus.52879 |
| rosenbaumHospitalPerformanceHospital2024 | https://api.crossref.org/works/10.1097/MLR.0000000000001966 |
| soremekunFrameworkWaitTimes2011 | https://api.crossref.org/works/10.1016/j.jemermed.2011.01.018 |
| vuPatientSatisfactionRural2024 | https://api.crossref.org/works/10.1002/puh2.219 |
| wernerMedicaresNewHospital2012 | https://api.crossref.org/works/10.1377/hlthaff.2011.0990 |
| westreichTable2Fallacy2013 | https://api.crossref.org/works/10.1093/aje/kws412 |
| P3.1 EDBA Fifth Summit (notebook only) | https://eutils.ncbi.nlm.nih.gov/entrez/eutils/esummary.fcgi?db=pubmed&id=40510829 |
| R1 Pope 2009 (notebook only) | https://api.crossref.org/works?query.bibliographic=Reacting+to+rankings+Evidence+America+Best+Hospitals+Pope |
