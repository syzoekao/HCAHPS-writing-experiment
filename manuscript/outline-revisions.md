# Outline revision log — outline.md

Style-skill silent-revision pass (scientific-writing-style §4) applied to `outline.md`.
Run mode: `--rewrite` (high-confidence mechanical edits applied; judgment calls flagged).
Each entry is keyed to an `<!-- OR-N -->` marker at the change site.
Artifact: manuscript (AJPH Original Research) — full scope; no appendix narrowing.
Stale `<!-- OR-* -->` markers from the prior (2026-05-28) run were stripped; numbering restarts at OR-1.

**Note on the prior pass.** The 2026-05-28 receipt reported 7 applied + 3 flagged and a "no additional entries" sweep. This pass ran the deterministic linter (`style-lint.py`), which surfaced several classes the prior pass missed or wrongly cleared: a reserved word (`null`) in a Results finding, `consumer-facing` corporate jargon, the `anchor` reserved word, the `stakes` register-elevation noun (the skill names it explicitly in §4a — the prior pass kept it as "load-bearing," but the skill's own example targets exactly this construction), a bare `coefficient` in Results prose, and a genuine register split (`community context` / `community measures` vs the dominant `community factors`). The carried-over curse-of-knowledge flag (prior OR-8) is also still unaddressed and is re-flagged below as OR-7.

---

## Linter output (style-lint.py, raw)

```
## counts by class
  packing_words: 56
  long_sentence: 18
  vague_causal_verbs: 13
  stats_jargon: 10
  possessive_noun: 10
  reserved_words: 5
  register_elevation_nouns: 1
  corporate_jargon: 1
HIGH-priority hits: 7
```

High-priority hits resolved below: `stakes` (L39 → OR-1), `consumer-facing` (L42 → OR-2), `null` (L151 → OR-3), `anchor` (L203 → OR-4; L238/L243 noun uses in resolved-status meta-notes ruled out of scope — see sweep). Medium hits triaged in the sweep table.

---

### OR-1 — register-elevation noun (applied)
**Location:** Introduction ¶1, topic sentence
**Quote (before):** "HCAHPS scores carry financial and reputational stakes for hospitals"
**Issue:** `stakes` is on the skill's register-elevation list (§4a) — a noun borrowed from gambling/journalism that reads as colloquial elevation; the skill's own example is *"Both stakes make ratings worth scrutinizing"* → name the concrete consequence. The adjectives "financial and reputational" already name the two mechanisms, so the abstract container "stakes" adds nothing.
**Fix:** "carry financial and reputational stakes for hospitals" → "matter to hospitals both financially and reputationally".
**Status:** applied

### OR-2 — corporate-jargon (applied)
**Location:** Introduction ¶1, reputational-stake sub-bullet
**Quote (before):** "Care Compare publishes the star ratings on a consumer-facing site"
**Issue:** `consumer-facing` is on the skill's corporate-jargon seed list (§4c) — boardroom register. The concrete meaning is simply that the site is public.
**Fix:** "on a consumer-facing site" → "on a public website".
**Status:** applied

### OR-3 — reserved-word (applied)
**Location:** Results ¶14, topic sentence
**Quote (before):** "the latter was practically null"
**Issue:** `null` is a reserved/forbidden word (§4c) — barred in prose for "absent / no association / near zero"; it reads as statistics jargon to a public-health and policy audience. This is a Results bullet stating a finding, so the prose use is exactly the case the rule targets. (Δ notation left unchanged — it appears consistently across ¶7/¶15/¶16/¶19/¶21; translating it only here would half-apply the class.)
**Fix:** "the latter was practically null" → "the latter was near zero in magnitude".
**Status:** applied

### OR-4 — reserved-word (applied)
**Location:** Discussion ¶20, three-explanations sub-bullet, mechanism (b)
**Quote (before):** "(analyst hypothesis; no specific literature anchor)"
**Issue:** `anchor` is a reserved word (§4c) — barred for grounding a claim/design in something. This is a draftable `[support]` sub-bullet.
**Fix:** "no specific literature anchor" → "no specific supporting study in the literature".
**Status:** applied

### OR-5 — vague-causal-verb (flagged — needs author judgment)
**Location:** Introduction ¶1 (cluster): financial-stake bullet, reputational-stake bullet, why-scrutinize bullet, and transition (lines 41–44). Marker placed on the transition bullet.
**Quotes:**
- "scores **feed** the Hospital Value-Based Purchasing program"
- "ratings also **feed** prospective patients' hospital-choice decisions"
- "survey trends **shape** both incentives"
- "because ratings **drive** both payment and reputation"
**Issue:** `feed`, `shape`, `drive` as bare causal connectors (§4c, *vague causal verbs*) hide the actual mechanism. The skill gives this paper's own examples: *"scores feed the HVBP program"* → *"Under the HVBP program, HCAHPS scores determine a portion of Medicare reimbursement"*; *"Ratings drive patient choice"* → *"Patients consult ratings when choosing a hospital."* The prior pass missed these entirely.
**Proposed recasts (author to choose):**
- "scores feed the HVBP program, so a rating gain or loss affects reimbursement" → "Under the HVBP program, the overall rating determines a portion of a hospital's Medicare reimbursement."
- "ratings also feed prospective patients' hospital-choice decisions" → "prospective patients consult the ratings when choosing a hospital."
- "survey trends shape both incentives" → name the channel, or drop if the bullet is cut for budget ([optional]).
- "because ratings drive both payment and reputation" → "because ratings affect both payment and reputation" (mechanical) or restate the two channels.
**Status:** APPLIED 2026-05-29 (author chose "apply all recommended recasts"). Final wording: financial-stake → "under the Hospital Value-Based Purchasing program, the overall rating determines a portion of a hospital's Medicare reimbursement"; reputational-stake → "prospective patients consult the ratings when choosing a hospital, and the ratings become part of a hospital's public reputation independent of any payment formula" (used "become part of … reputation" to avoid `shape`, itself a flagged verb); [optional] why-scrutinize → "measurement choices and survey-response trends affect both the payment and reputational signals"; transition → "because ratings affect both payment and reputation".
**Note:** compound-adjective uses of `driven` ("ED-driven star gain," "community-driven structural change") are *not* flagged — the mechanism is named in the compound, so they are not bare causal connectors.

### OR-6 — vague-causal-verb (flagged — needs author judgment)
**Location:** Discussion ¶20, broader-caution sub-bullet
**Quote:** "because observable structural factors do not **drive** rating change"
**Issue:** Same rule as OR-5. Here "drive" stands in for the associational relation the paper is careful to claim. Note the matching-failure risk (§ Calibrated certainty): the paper is associational, so a causal verb is doubly off here.
**Proposed fix:** "do not drive rating change" → "are not associated with rating change" (preserves the associational framing the rest of the bullet relies on).
**Status:** APPLIED 2026-05-29 (author confirmed). "do not drive rating change" → "are not associated with rating change".

### OR-7 — curse-of-knowledge (flagged — needs author judgment) [carried over from prior OR-8, still unaddressed]
**Location:** Introduction ¶2, methodological-studies sub-bullet
**Quote:** "examines how the rating is built and adjusted — CMS patient-mix adjustment and peer grouping"
**Issue:** `patient-mix adjustment` and `peer grouping` are named technical chunks used in passing (§4d). `peer grouping` in particular names a construct the reader cannot resolve from the phrase. (¶18's later use of "patient-mix adjustment" *is* glossed in-line — "corrects for individual patient characteristics but not community context" — and needs no flag; this ¶2 first use does not.)
**Proposed fix:** gloss at first use, e.g., "peer grouping (CMS compares each hospital only against others in its size and patient-mix band)", or recast to avoid naming the chunks where their mechanics are not load-bearing.
**Status:** APPLIED 2026-05-29 (author chose "recast to avoid naming" — leaner on the ~3,000-word budget than glossing). The em-dash insertion "— CMS patient-mix adjustment and peer grouping —" was removed: "examines how the rating is built and adjusted — CMS patient-mix adjustment and peer grouping — and motivates cautious interpretation" → "examines how the rating is built and adjusted and motivates cautious interpretation". (¶18's glossed use of patient-mix adjustment is retained.)

### OR-8 — register-consistency (flagged — needs author judgment)
**Location:** artifact-wide; marker on the abstract Conclusions bullet (representative site). Other sites: Discussion ¶18 (L183, L186), ¶22 (L218), and Methods ¶6 "community measures" (L86).
**Quote (representative):** "payment-linked ratings reflect community context hospitals cannot change"
**Issue:** The outline names the model's community variables **community factors** ~17 times (the deliberate plain-language substitute for "covariates," used consistently in the abstract Objectives/Methods/Results, ¶3, ¶4, ¶7, ¶9, ¶11–13, ¶16–17, Table 1). It switches to **community context** at the abstract Conclusions, ¶18 (twice), and ¶22, and to **community measures** once in Methods ¶6. Per §4c (drop test runs artifact-wide) and the register-consistency rule, swapping synonyms for one concept reads as careless.
**Why flagged, not auto-harmonized:** "context" carries a defensible shade of difference in the policy framing — it names the *environment* a hospital sits in (which it cannot change), not the *variables in the model*. Blindly harmonizing "community context" → "community factors" in "ratings reflect community context hospitals cannot change" could flatten the levels-side policy point. The author should decide: either (a) keep "community context" only in the policy-framing sentences and use "community factors" everywhere the model variables are meant, applied deliberately and consistently, or (b) harmonize to one term. "community measures" in Methods ¶6 (L86) is a loose third variant for the same data and should fold into whichever term wins.
**Status:** APPLIED 2026-05-29 (author chose option (a): keep "context" in policy-framing sentences only, "community factors" for the model variables). The three "community context" sites are all policy-framing and were kept: abstract Conclusions (L30), ¶18 heading (L183), ¶18 adjustment line (L186). The lone "community measures" in Methods ¶6 (L86) was folded to "community factors". Net effect: "community factors" carries the model variables consistently; "community context" is reserved, by intent, for the levels-side policy point (the environment a hospital cannot change). "county context" (L80 label, L86 linkage) left as is — a geographic-data grouping label, outside the community-term family.

### OR-9 — stats-jargon (applied)
**Location:** Results ¶15, ED-time sub-bullet
**Quote (before):** "a small rating gain (Δ ED time coefficient ≈ −0.002 stars per minute)"
**Issue:** Bare `coefficient` stating a finding magnitude in Results prose (§4c) — the skill directs stating the association directly. The value was already expressed in stars-per-minute, so dropping the jargon word is plain-word-over-fancy-word and preserves the number exactly.
**Fix:** "(Δ ED time coefficient ≈ −0.002 stars per minute)" → "(about 0.002 stars per additional minute of ED time)".
**Status:** applied
**Note:** the second use in the same bullet — "do not multiply the coefficient by the 111-minute observed drop" — is an instruction to the drafter (a methodological caution), not prose stating a finding, and is left as is. The marker sits at the bullet end and covers the applied fix.

---

## Pattern-class consistency sweep

Ran `style-lint.py` artifact-wide; each fired class audited against §4 with morphology- and section-aware judgment.

| Class | Sites | Verdict |
|---|---|---|
| register_elevation_nouns (`stakes`) | 1 (L39) | Fixed (OR-1). The bullet *labels* "Financial stake:" / "Reputational stake:" (L41–42) function as structural scaffolding naming each consequence, not as the register-elevation container inside a sentence; the linter did not flag them and they are kept as labels. |
| corporate_jargon (`consumer-facing`) | 1 (L42) | Fixed (OR-2). Only instance. |
| reserved_words (`null`) | 1 (L151) | Fixed (OR-3). Results-prose finding. |
| reserved_words (`anchor`) | 4 (L203, L238, L243×2) | L203 fixed (OR-4) — draftable `[support]` prose. L238 ("does not anchor any finding") and L243 ("selected as the ¶1 anchors"; "external-validity anchor is wanted") are inside **resolved-status / citation-bookkeeping meta-notes** in the Open-questions block — scaffolding the drafter reads and discards, never copied into manuscript prose. The reserved-word rule exists to keep the banned sense out of the *manuscript*; rewriting a resolved-decision log adds noise without protecting any drafted text. Ruled out of scope, recorded here for the record. Class verdict: every prose-bound site fixed; non-prose meta-notes deliberately untouched. |
| vague_causal_verbs (`feed`, `shape`, `drive`) bare | 5 prose (L41, L42, L43, L44, L204) | All flagged, none auto-applied (OR-5, OR-6) — consistent deferral; recasts name a mechanism = substantive. |
| vague_causal_verbs (`driven` in compounds) | 6 (L96, L158, L172×2, L193, L204) | Rule does not fire — "ED-driven," "community-driven" name the channel in the compound; not bare causal connectors. |
| stats_jargon `coefficient` (Results prose, finding) | 1 (L158) | Fixed (OR-9). |
| stats_jargon `coefficient` (Methods/Limitations/meta caveats) | 6 (L96, L113, L203, L211, L236, L237) | Rule does not fire — all are methodological notes on the estimate's interpretability or bookkeeping caveats ("not yet verifiable"), not Results findings stating a magnitude. L203 ("its coefficient is a mutually-adjusted residual") is a Discussion explanation of the Table 2 fallacy where the coefficient-as-statistical-object IS the subject; glossed in-line. §4c targets bare `coefficient` reporting a finding. |
| stats_jargon `covariate` | 1 (L88) | Methods — the one section where `covariate` is the technical term (§4c). Kept. |
| packing_words `level`/`levels` | many (L55, 57, 58, 59, 60, 66, 110, 147, 149, 151, 177, 179, 183, 185, 238, 249) | Load-bearing throughout — the **levels-vs-change** contrast is the paper's central framing (rating *levels* vs the 2017→2024 *change*), and "hospital-level decomposition / movement" marks granularity against the national-average literature (§4c carve-out: contrast-bearing and granularity-naming uses are kept). L249 is project-CLAUDE.md echo in a resolved-status note. No `*-level` redundancy of the OR-2-type (prior run) remains. Class kept; no entries. |
| packing_words `model`/`models` | many (L57, 66, 85, 92, 102, 103, 107×4, 108×2, 109×3, 111, 112, 153, 157, 210, 212, 238×2) | Load-bearing — a regression model genuinely is a model (§4c: "a health-economic model really is a model"); "the change model," "cross-sectional models" name genuine objects. Kept. |
| packing_words `context` | 6 (L30, 80, 86, 183, 186, 188×?) | "community context" / "county context" — folded into the register-consistency flag (OR-8); not separately auto-dropped because "context" names the environment, a defensible distinct sense. |
| possessive_noun (A's B → B of A) | 10 (L42, 50, 52, 53, 95, 108, 179, 205, 238, 241) | **Out of this agent's scope.** "Prefer B of A for institutional possessors" is a §3 *drafting* preference with explicit *yield* conditions, not a §4 silent-revision fix. Several flagged are idiomatic and stay regardless ("bachelor's degree," "this paper's window/subject," "the study's limits"). No entries; recorded for the drafter. |
| long_sentence | 18 (low) | These are outline *bullets*, not draftable single sentences; many pack list items the drafter expands into a paragraph (e.g., the 108-word L203 carries three lettered explanations). Sentence-splitting is a §3 rule and out of this agent's §4 scope; the agent's sentence-construction pass targets only doubled verbs / aspect mismatches / stacked participles — none found. No entries. |
| curse-of-knowledge chunks | `patient-mix adjustment` + `peer grouping` ¶2 (L52, flagged OR-7); ¶18 patient-mix (glossed, no flag); "mutually-adjusted residual" / "Table 2 fallacy" ¶20 (glossed in-line, no flag) | OR-7 carried over from prior run, still unaddressed. Others glossed in place. |
| redundancy / nominalizations / hedges / double hedges / metadiscourse / metaphorical-filler / there-is-are / doubled verbs / aspect mismatch / bureaucratic Latinate (utilize/facilitate/leverage) / bureaucratic constructions | 0 | No instances. (The prior run's `backdrop`→`background`, `bears on`→`affects`, `warrants a cautious reading`→`should be read cautiously`, and the `noticeably`/`real` intensifier fixes are already present in the current text.) |

---

## Scan summary

- **Reserved/forbidden words:** 2 fixed (OR-3 `null`, OR-4 `anchor`); 3 further `anchor` occurrences in resolved-status meta-notes ruled out of scope.
- **Corporate jargon:** 1 fixed (OR-2 `consumer-facing`).
- **Register-elevation nouns:** 1 fixed (OR-1 `stakes`).
- **Vague causal verbs:** 5 prose instances flagged for author judgment (OR-5 cluster, OR-6); 6 compound-adjective `driven` uses correctly not firing.
- **Stats-jargon in Results prose:** 1 fixed (OR-9 bare `coefficient`); 6 `coefficient` meta/Methods uses and 1 Methods `covariate` correctly not firing.
- **Register-consistency:** 1 flagged (OR-8 community context/measures vs community factors).
- **Curse-of-knowledge chunks:** 1 flagged, carried over and still unaddressed (OR-7 patient-mix adjustment / peer grouping).
- **Packing words (`level`/`model`/`context`):** reviewed artifact-wide; all load-bearing (levels-vs-change contrast, genuine model objects) or folded into OR-8. No new drops.
- **Possessive-noun, long-sentence:** detected by linter but out of this agent's §4 scope (§3 drafting rules); recorded for the drafter, no entries.
- **Redundancy / nominalization / hedge / double hedge / metadiscourse / metaphorical-filler / there-is-are / sentence-construction / bureaucratic Latinate & constructions:** 0.

**Total applied:** 9 (all). OR-1–OR-4, OR-9 applied mechanically during the pass; OR-5, OR-6, OR-7, OR-8 applied 2026-05-29 after author judgment (see per-entry Status notes above).
**Flagged, needs author judgment:** 0 remaining.
