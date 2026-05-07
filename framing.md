# Study framing — HCAHPS overall star ratings, 2017 vs 2024

**Working document — alignment before outlining**
**Date:** 2026-05-01
**Target journal:** Health Affairs (primary); JAMA Health Forum and Health Affairs Scholar as alternates

---

## 1. Key findings

### Headline numbers
- **National decline in overall star rating**: mean 3.45 (2017) → 3.27 (2024), a drop of ≈0.18 stars.
- **ED throughput improved sharply**: median time in ED 292 → 181 minutes.
- **Sample**: N = 2,380 hospitals (66.5% for-profit, 18.7% non-profit, 14.8% government; 69.5% urban, 20.8% large rural, 9.7% small rural).

### Two regression stories
| Model | R² | What it tells us |
|---|---|---|
| 2017 levels | ≈0.24 | Hospital + community factors explain a meaningful share of variation |
| 2024 levels | ≈0.24 | Same story, same magnitude — pattern is stable |
| **2017→2024 change** | **0.04–0.06** | Same covariates explain almost nothing about *trajectories* |

This **levels-vs-change asymmetry** is the single most important quantitative finding.

### Levels — what predicts higher ratings (consistent across 2017 and 2024)
- **Ownership** (vs government): non-profit −0.58 stars (2024), for-profit −0.11 (2024). Government is the highest-scoring category.
- **Rural advantage**: small rural +0.61 vs urban (2024); large rural roughly null in levels.
- **Operations**: longer ED time → lower; more hospitals per 1,000 population → higher.
- **Community**: higher % 65+, % foreign-born, % poor → lower; higher % bachelor's+ → higher.
- **Counterintuitive flag**: % subjective poor health → *higher* ratings; high % poor *and* high % poor 65+ → both lower (collinear; needs care in interpretation).

### Change — what predicts gaining or losing stars 2017→2024
- **Rural hospitals improved relative to urban**: large rural +0.20, small rural +0.28.
- **Non-profit and for-profit declined more than government**: −0.11 and −0.13 respectively.
- **ED time reduction** associated with small rating gains.
- **Almost no community-change variable** reaches significance — the population-shift story does not explain the rating-shift story.

---

## 2. Literature gap (refined after review)

The HCAHPS literature has three established threads:

1. **Cross-sectional determinants** — Beckett et al. (2024) review; Herrin et al. (2018) on community factors; Fitzpatrick Rosenbaum et al. (2024) on nursing.
2. **National COVID-era trend** — Elliott et al. (2023, JAMA Health Forum) documents the pandemic decline through Q4 2021; Beckett et al. (2025, Med Care Res Rev) extends it through 2023 and shows persistence.
3. **Risk-adjustment / Star Ratings methodology** — Elliott et al. (2025) on CMS patient-mix adjustment; Gettel et al. (2024) on Star Ratings peer grouping; National Academies (2016) on social risk factors.

**What none of these do** — and what this study adds:

> A **hospital-level analysis that uses a 2017 (mature pre-COVID baseline) vs 2024 (post-pandemic stabilization) horizon, jointly modeling hospital, operational, and community-level covariates for both rating levels and rating change, and showing that observable factors explain ~24% of cross-sectional variation but <6% of trajectory variation.**

The decomposition matters because it changes how we should interpret rating changes for policy use.

---

## 3. Policy implications

Three, in order of confidence:

### A. Risk adjustment for community context deserves reconsideration
- ~24% of *level* variation tracks community demographics that hospitals can't change (% foreign-born, % poor, age structure).
- CMS patient-mix adjustment (Elliott et al. 2025) operates only at the individual patient level; community context is not adjusted.
- The National Academies (2016) framework already laid out the rationale for social risk adjustment; our results provide updated empirical support specifically for HCAHPS.
- **Implication**: hospitals serving structurally disadvantaged communities are systematically penalized in payment-linked ratings, even after current CMS adjustments. Either community-level adjusters should be added, or context-adjusted scores should be reported alongside raw stars.

### B. The rural advantage is real, growing, and policy-relevant
- Rural hospitals score higher (Vu 2024; Beckett et al. 2025 *Health Affairs Scholar*) and **gained ground** 2017→2024.
- They do so against a backdrop of severe financial fragility (AHA 2024; ASPE 2024 documenting continuing closures).
- **Implication**: HCAHPS is one of the few quality measures where rural hospitals consistently outperform. This deserves visibility in policy conversations about rural hospital sustainability.

### C. Be cautious about attributing national rating changes to specific causes
- Community-change variables explain almost none of the trajectory; observable structural factors are not the driver.
- This is consistent with the staffing-resilience story in Elliott et al. (2023, 2025) — and complementary to it: change is largely within-hospital, operational, and idiosyncratic.
- **Implication**: ratings shifts are not a clean signal of community-driven structural change. Attributing post-2017 declines to "the pandemic" or "demographic change" requires more granular, within-hospital analysis than published data currently support.

A weaker fourth: **ownership matters for trajectories, not just levels** — for-profit and non-profit hospitals declined more than government. Worth a sentence; not the policy headline.

---

## 4. Scope decisions (what we are NOT doing)

To keep the paper tight and Health Affairs-ready:

- **Not** analyzing all 10 HCAHPS sub-domain ratings. Overall star rating is the dependent variable; sub-ratings appear only as covariates in some specifications.
- **Not** examining intra-pandemic dynamics (Elliott 2023 already covers this).
- **Not** modeling hospital fixed effects beyond the change-score specification (the change model is already a first-difference).
- **Not** building a causal claim about what *caused* the decline. The framing is associational and decomposition-based.
- **Not** including HCAHPS Star Ratings methodology critique as primary content — Gettel 2024 already does this; we cite it.

---

## 5. Open framing questions for alignment

Before we outline, I'd like your read on these:

1. **Headline sentence** — would you prefer the framing to lead with:
   - **(a) Methodological asymmetry**: "Community context explains hospital star-rating levels but not changes" — the cleanest novel claim.
   - **(b) Policy-forward**: "Star ratings systematically penalize structurally disadvantaged hospitals; a national rating decline cannot be explained by community change" — packs both contributions but is busier.
   - **(c) Rural-forward**: "Rural hospitals lead and are widening the patient-experience gap" — narrower but most striking single message.

2. **How prominent should the COVID story be?** We're not the first to document the decline (Elliott 2023, Beckett 2025). Three options:
   - Foreground it as the empirical motivation, then pivot to our decomposition.
   - Mention it briefly and lead with the levels-vs-change finding.
   - Treat it as backdrop only.

3. **Should the maps be a primary exhibit or relegated to appendix?** They're descriptive, not analytic; Health Affairs likes visual evidence but is exhibit-constrained.

Once these are settled, I'll draft the manuscript outline (IMRaD adapted to Health Affairs format).
