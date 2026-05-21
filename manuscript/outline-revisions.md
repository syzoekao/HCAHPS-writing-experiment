# Outline revision log — outline.md

Style-skill silent-revision pass (scientific-writing-style §4) applied to `outline.md`.
Run mode: `--rewrite` (high-confidence edits applied; flag-only entries marked).
Each entry is keyed to an `<!-- OR-N -->` marker at the change site.
Artifact: manuscript (AJPH Original Research) — full scope; no appendix narrowing.
Stale `<!-- OR-* -->` markers from the prior run were stripped; numbering restarts at OR-1.

---

### OR-1 — metaphorical-filler
**Location:** Introduction ¶2, third supporting sub-bullet
**Quote:** "kept brief, as backdrop, not as this paper's motivation"
**Issue:** `backdrop` is on the skill's metaphorical-filler list (§4a) — a theatrical noun used decoratively, with no literal stage scenery meant. Reads as register elevation.
**Fix:** "as backdrop" → "as background".
**Status:** applied

### OR-2 — packing-word
**Location:** Methods ¶5, topic sentence
**Quote:** "we built a hospital-level dataset with two snapshots per hospital"
**Issue:** `hospital-level` fails the drop test here because the same sentence already names the granularity — "two snapshots **per hospital**". Per SKILL.md §4c ("a panel of hospitals → hospital-level panel repeats itself; cut hospital-level"), when another word in the sentence carries the granularity, `level` is redundant. This is the one redundant site; the contrast-bearing uses elsewhere (¶3, ¶17 — hospital-level decomposition vs national-average trend literature) are load-bearing and kept.
**Fix:** "a hospital-level dataset with two snapshots per hospital" → "a dataset with two snapshots per hospital".
**Status:** applied

### OR-3 — bureaucratic-construction
**Location:** Methods ¶7, second *Caveat to flag* sub-bullet
**Quote:** "which bears on how the ED finding is read"
**Issue:** `bears on` is a phrase-level bureaucratic construction (SKILL.md §4a, *has bearing on / bears on* → name the relation or use a concrete verb).
**Fix:** "bears on how the ED finding is read" → "affects how the ED finding is read".
**Status:** applied

### OR-4 — intensifier
**Location:** Results ¶10, topic sentence
**Quote:** "several factors shifted noticeably between 2017 and 2024"
**Issue:** `noticeably` is a vague intensifier (§4a) — it places the shift on an unspecified scale without quantifying it. The concrete magnitudes follow in the next sub-bullet ("mean overall rating fell 3.45 → 3.27 stars; median ED time fell 292 → 181 minutes"), so the intensifier carries no information the bullet does not already supply.
**Fix:** "several factors shifted noticeably between 2017 and 2024" → "several factors shifted between 2017 and 2024".
**Status:** applied

### OR-5 — intensifier
**Location:** Introduction ¶1, topic sentence
**Quote:** "HCAHPS scores carry real financial and reputational stakes for hospitals"
**Issue:** `real` is an empty intensifier (§4a) — "stakes" already denotes consequences that matter, and "financial and reputational" makes them concrete. The skill's note applies: the intensifier invites the reader to wonder how far up a scale the stakes sit rather than reading them as categorical. Distinct from the contrastive uses of `real` in ¶7/¶19 ("real operational gain," "real, if narrow, agency"), which mark a real-vs-apparent contrast and are kept.
**Fix:** "carry real financial and reputational stakes" → "carry financial and reputational stakes".
**Status:** applied

### OR-6 — bureaucratic-construction
**Location:** Discussion ¶20, topic sentence
**Quote:** "runs against expectation and warrants a cautious reading"
**Issue:** `warrants a cautious reading` is a bureaucratic verb-plus-nominalization construction (§4a) — the nominalized "reading" hides the action. The plain verb form is shorter and more direct and preserves the claim exactly.
**Fix:** "warrants a cautious reading" → "should be read cautiously".
**Status:** applied

### OR-7 — register-consistency
**Location:** Open questions, item 5
**Quote:** "Which change R² to lead with."
**Issue:** The outline body states explained variation as a percentage everywhere it reports the finding (¶11, ¶14: "about a quarter of the variation"; the abstract *Note* explicitly directs "no R² symbol"). The Open Questions heading reverts to `R²` for the same concept — register-mixing per SKILL.md §4c, where one concept appears in two registers in one artifact. The plainer construction is already the artifact-wide choice; harmonize.
**Fix:** "Which change R² to lead with." → "Which change explained-variation figure to lead with."
**Status:** applied

### OR-8 — curse-of-knowledge
**Location:** Introduction ¶2, fourth supporting sub-bullet
**Quote:** "examines how the rating is built and adjusted — CMS patient-mix adjustment and peer grouping"
**Issue:** `patient-mix adjustment` and `peer grouping` are named technical chunks used in passing (SKILL.md §4d) — insider noun phrases the drafter will expand into prose without unpacking unless flagged. `peer grouping` in particular names a construct (CMS compares each hospital only against others in its size and patient-mix band) the reader cannot resolve from the phrase alone.
**Fix:** Gloss each chunk in-line at first use, or recast to avoid naming it where its mechanics are not load-bearing. The gloss is substantive content and depends on the audience and space budget.
**Status:** not-applied — needs author judgment (per process note 9, curse-of-knowledge glosses are not auto-rewritten under --rewrite)

### OR-9 — curse-of-knowledge
**Location:** Results ¶14, second supporting sub-bullet
**Quote:** "the basic-versus-baseline gap is consistent with regression toward the mean"
**Issue:** `regression toward the mean` is a named technical chunk (SKILL.md §4d). For an AJPH public-health and policy readership, the phrase names a mechanism without explaining why adding 2017 baseline values would shrink the explained-variation gap.
**Fix:** Gloss in-line (one clause on why baseline-controlled change models attribute part of the apparent movement to starting position) or recast.
**Status:** not-applied — needs author judgment

### OR-10 — curse-of-knowledge
**Location:** Discussion ¶20, second supporting sub-bullet
**Quote:** "or collider-style confounding — without overclaiming"
**Issue:** `collider-style confounding` is a named technical chunk (SKILL.md §4d) — a causal-inference term that reads as gatekeeping to a clinical or policy reader and is not unpacked.
**Fix:** Gloss the mechanism in plain language (how conditioning on a common effect could induce the positive poor-health association) or recast to describe the mechanism without naming it.
**Status:** not-applied — needs author judgment

---

## Pattern-class consistency sweep

After the per-bullet pass, each fired construction class was grepped artifact-wide and audited.

| Class | Sites found | Verdict |
|---|---|---|
| metaphorical-filler (`backdrop` etc.) | 1 (line 49) | Fixed (OR-1). No other instances. |
| packing-word `*-level` | 8 (lines 54, 58, 65, 75, 114, 180, 182, 246) | Line 75 fixed (OR-2) — granularity already named by "per hospital". Lines 54/58/65/180/182 load-bearing — the hospital-level-vs-national-average contrast is the explicit point of those sentences (§4c carve-out). Lines 114/246 ("public, de-identified, hospital-level data") load-bearing — `level` marks the data are aggregated to hospital, not patient-level, which is material to the ethics/IRB statement. Class consistently handled. |
| intensifier (`real`, `noticeably`) | `noticeably` 1 (line 122); `real` 5 (lines 39, 96, 196, 199, 214) | `noticeably` fixed (OR-4). `real` line 39 fixed (OR-5). Lines 96/214 ("real operational gain") and 196/199 ("real, if narrow, agency"; "but it is real") are contrastive — real vs measurement artifact, real vs apparent agency — load-bearing, kept. Class consistently handled. |
| bureaucratic-construction | `bears on` 1 (line 96); `warrants` 1 (line 205) | Both fixed (OR-3, OR-6). No other phrase-level instances. |
| stats-jargon `R²` | 2 (lines 31, 244) | Line 244 fixed (OR-7). Line 31 is the abstract *Note* that names the symbol in order to forbid it ("no R² symbol") — correct as written; rule does not fire. |
| `coefficient` | 3 (lines 31, 113, 243) | Rule does not fire at any site — all three are meta-notes (abstract translation note; "coefficients not yet verifiable" caveat; open-question on unverified estimates), not Results prose stating a finding. §4c targets bare `coefficient` in Results prose. No entries. |
| curse-of-knowledge chunks | 3 (lines 51, 154, 206) | All flagged, none rewritten (OR-8, OR-9, OR-10) — consistent deferral per process note 9. |
| there-is/are; doubled verbs; aspect mismatch; bureaucratic Latinate (utilize/facilitate/leverage) | 0 substantive | Greps returned no instances or only false positives ("built and adjusted", "publicly reported and tied to" — distinct actions, not doubled verbs). No entries. |

The sweep produced no additional entries.

## Scan summary

- **Reserved/forbidden words** (thin, coverage, anchor, clean, bottleneck, enrich, null): 0 found.
- **Packing words** (level, model, context, framework, approach, etc.): 1 fixed (OR-2); 7 `*-level` sites reviewed and kept as load-bearing. "factors" / "community factors" confirmed as the deliberate plain-language substitute for "covariates" (used consistently artifact-wide) — kept.
- **Unintroduced acronyms / methods-slang**: 0 — HCAHPS, CMS, ED, CDC, ACS, NHGIS, RUCA, STROBE, FIPS all spelled out at first use; "ordinary least squares" written in full, bare "OLS" never used. IPUMS appears as the data provider's brand name (IPUMS NHGIS) with NHGIS spelled out — not flagged.
- **Stats-jargon in prose** (R², coefficient, specification, first-differenced, covariate): 1 register-consistency fix (OR-7). Explained variation stated as a percentage throughout the body; "models" over "specifications"; no bare coefficient in Results prose.
- **Metaphorical filler**: 1 fixed (OR-1).
- **Bureaucratic constructions**: 2 fixed (OR-3, OR-6).
- **Intensifiers**: 2 fixed (OR-4, OR-5).
- **Curse-of-knowledge chunks**: 3 flagged for author judgment (OR-8, OR-9, OR-10).
- **Redundancy / nominalizations / hedges / double hedges / corporate jargon / sentence-construction**: 0 found.
- **Total applied:** 7 (OR-1 through OR-7). **Flagged, not applied:** 3 (OR-8, OR-9, OR-10 — curse-of-knowledge glosses need author judgment).
