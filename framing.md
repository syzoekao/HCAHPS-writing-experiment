# Study framing — HCAHPS overall star ratings, 2017 vs 2024

**Working document — alignment before outlining**
**Manuscript title (working, per analyst):** *Determinants of Hospital HCAHPS Star Ratings and Changes Over Time, 2017-2024*
**Date:** 2026-05-16 (updated after analyst review of 2026-05-01 draft)
**Target journal:** American Journal of Public Health (AJPH; primary); Health Affairs, JAMA Health Forum, and Health Affairs Scholar as alternates
**Word budget:** 3,500 words main text; 180 words abstract (per AJPH Original Research guidelines)

---

## 0. Headline frame

Community context explains most of what Hospital Consumer Assessment of Healthcare Providers and Systems (HCAHPS) overall star ratings *look like*, but almost none of how they *move*. Where trajectories shift, they track hospital-controllable operations — most visibly emergency department (ED) throughput. The asymmetry carries a paired policy message:

- **Levels are environment-driven** → payment-linked ratings systematically penalize hospitals for community context they cannot change. *Bad news for incentive programs as currently designed.*
- **Change is operations-driven** → hospitals retain meaningful agency over trajectory through narrow but real operational improvements. *Good news for hospital management.*

This dual reading is the analyst's framing and replaces the earlier single-message options (methodological asymmetry alone, policy-forward alone, or rural-forward).

---

## 1. Key findings

### Headline numbers
- **National decline in overall star rating**: mean 3.45 (2017) → 3.27 (2024), a drop of ≈0.18 stars.
- **ED throughput improved sharply**: median time in ED 292 → 181 minutes.
- **Sample**: N = 2,380 hospitals (66.5% for-profit, 18.7% non-profit, 14.8% government; 69.5% urban, 20.8% large rural, 9.7% small rural).

### Two regression stories
| Model | Variation explained | What it tells us |
|---|---|---|
| 2017 levels | ≈24% | Hospital and community factors explain about a quarter of cross-sectional variation |
| 2024 levels | ≈24% | Same magnitude as 2017 — pattern is stable |
| **2017→2024 change** | **4–6%** | Same covariates explain almost nothing about *trajectories* |

This **levels-vs-change asymmetry** is the single most important quantitative finding.

### Levels — what predicts higher ratings (consistent across 2017 and 2024)
- **Ownership** (vs government): non-profit −0.58 stars (2024), for-profit −0.11 (2024). Government is the highest-scoring category.
- **Rural advantage**: small rural +0.61 vs urban (2024); large rural close to zero in levels.
- **Operations**: longer ED time → lower; more hospitals per 1,000 population → higher.
- **Community**: higher % 65+, % foreign-born, % poor → lower; higher % bachelor's+ → higher.
- **Counterintuitive flag**: % subjective poor health → *higher* ratings; high % poor *and* high % poor 65+ → both lower (collinear; needs care in interpretation).

### Change — what predicts gaining or losing stars 2017→2024
- **Rural hospitals improved relative to urban**: large rural +0.20, small rural +0.28.
- **Non-profit and for-profit declined more than government**: −0.11 and −0.13 respectively.
- **ED time reduction** associated with small rating gains.
- **Almost no community-change variable** is associated with the change in ratings — the population-shift story does not explain the rating-shift story.

---

## 2. Literature gap (refined after review)

The HCAHPS literature has three established threads:

1. **Cross-sectional determinants** — Beckett et al. (2024) review; Herrin et al. (2018) on community factors; Fitzpatrick Rosenbaum et al. (2024) on nursing.
2. **National COVID-era trend** — Elliott et al. (2023, JAMA Health Forum) documents the pandemic decline through Q4 2021; Beckett et al. (2025, Med Care Res Rev) extends it through 2023 and shows persistence.
3. **Risk-adjustment / Star Ratings methodology** — Elliott et al. (2025) on CMS patient-mix adjustment; Gettel et al. (2024) on Star Ratings peer grouping; National Academies (2016) on social risk factors.

**What none of these do** — and what this study adds:

> A **hospital-level analysis that uses a 2017 (mature pre-COVID baseline) vs 2024 (post-pandemic stabilization) horizon, jointly modeling hospital, operational, and community covariates for both rating levels and rating change, and showing that observable factors explain ~24% of cross-sectional variation but <6% of trajectory variation.**

The decomposition matters because it changes how we should interpret rating changes for policy use.

---

## 3. Policy implications

Organized around the two sides of the levels-vs-change asymmetry.

### A. Levels are environment-driven — implications for incentive programs

- ~24% of *level* variation tracks community demographics hospitals cannot change (% foreign-born, % poor, age structure, education).
- Centers for Medicare & Medicaid Services (CMS) patient-mix adjustment (Elliott et al. 2025) adjusts for individual patient characteristics, not community context.
- The National Academies (2016) laid out the rationale for social risk adjustment; our results provide updated, HCAHPS-specific empirical support.
- **Implication**: payment-linked ratings systematically penalize hospitals serving structurally disadvantaged communities, even after current CMS adjustments. CMS should either add adjusters for community context, or report context-adjusted scores alongside raw stars. This is the "bad news for incentive programs" half of the headline.

### B. Change is operations-driven — implications for hospital agency

- Observable community-change variables explain <6% of the 2017→2024 trajectory. Where the data do identify a modifiable driver, it is **ED throughput**: reductions in ED time associate with small rating gains.
- This is consistent with — and complements — the staffing-resilience story in Elliott et al. (2023, 2025): trajectory is largely within-hospital, operational, and partly idiosyncratic.
- **Implication**: hospitals retain meaningful agency over their rating trajectory. The operational improvements available are narrower than the levels picture suggests, but they are real. This is the "good news for hospitals" half of the headline.

#### Supporting findings under (B) — descriptive, not headline

- **Rural hospitals improved relative to urban** (large rural +0.20, small rural +0.28), against a backdrop of severe financial fragility (American Hospital Association [AHA] 2024; Office of the Assistant Secretary for Planning and Evaluation [ASPE] 2024). Worth flagging because HCAHPS is one of the few quality measures where rural hospitals consistently outperform. Frame as descriptive context, not as the lead story (per analyst).
- **Non-profit and for-profit hospitals declined more than government** (−0.11 and −0.13). Worth a sentence; not a policy headline.

### C. Caution about attributing the national decline to specific causes

- Because observable structural factors are not the driver of change, ratings shifts are not a reliable signal of community-driven structural change. Attributing post-2017 declines to "the pandemic" or "demographic change" requires more granular, within-hospital analysis than published data currently support.

---

### Framing nuance to resolve

The "hospitals can control this" message in (B) is clearest when restricted to **operational** improvements (ED time; by extension staffing/throughput). Ownership type and rural status also predict trajectory, but they are hospital-*fixed* traits rather than operations hospitals can change. Recommend keeping the headline agency claim narrow (operations), and treating ownership/rural trajectory differences as descriptive supporting findings. To confirm with the analyst before outlining.

---

## 4. Scope decisions (what we are NOT doing)

To keep the paper tight and AJPH-ready:

- **Not** analyzing all 10 HCAHPS sub-domain ratings. Overall star rating is the dependent variable; sub-ratings appear only as covariates in some models.
- **Not** examining intra-pandemic dynamics (Elliott 2023 already covers this).
- **Not** modeling hospital fixed effects beyond the change-score model — comparing each hospital's 2017 to 2024 already nets out time-invariant traits.
- **Not** building a causal claim about what *caused* the decline. The framing is associational and decomposition-based.
- **Not** including HCAHPS Star Ratings methodology critique as primary content — Gettel 2024 already does this; we cite it.

---

## 5. Framing decisions (resolved with analyst, 2026-05-16)

1. **Headline sentence** — option **(a) methodological asymmetry**, extended with the analyst's paired policy reading (see Section 0). Option (b) is too busy; option (c) rural-forward is rejected as the lead message (analyst comment on `framing_rs.docx`: *"not sure this is the most striking single message; I did not frame this finding like that in the draft for now"*).

2. **COVID story** — **mention briefly, lead with the levels-vs-change finding** (analyst preferred this option). A sentence or two in the intro acknowledging Elliott 2023 / Beckett 2025; then pivot to factors associated with the change in ratings. Not foregrounded as the empirical motivation.

3. **Maps** — **one primary exhibit** (2017→2024 difference map), per-year maps in appendix. Keeps the exhibit budget tight while preserving visual evidence.

### Remaining alignment item

- Whether "hospital-controllable" in the (B) policy message should be restricted to operational improvements (ED time) or also include hospital-fixed traits (ownership, rurality). Recommendation: narrow to operations; see Section 3 nuance note. Confirm with analyst before outlining.

Once the nuance above is resolved, draft the manuscript outline (Introduction–Methods–Results–Discussion [IMRaD] per AJPH Original Research format).

### Journal switch note (2026-05-16)

Primary target moved from Health Affairs to American Journal of Public Health. Implications:
- **Audience tilts more public-health-academic** than Health Affairs' payer/policy mix — voice can be slightly more methodologically explicit (surface the explained-variation contrast and direction of associations) without losing the policy audience.
- **Word budget is more generous** (3,500 vs ~3,000 main text), giving room for the Methods section to be self-contained rather than appendix-heavy.
- **Exhibit budget**: AJPH typically allows up to ~4–6 tables/figures combined. The "one primary map" decision still holds; per-year maps stay in appendix.
- The paired policy reading — incentive-program problem on the levels side, hospital agency on the change side — sits squarely within AJPH's remit.
