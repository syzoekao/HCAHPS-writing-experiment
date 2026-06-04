# Draft revisions — prose-reviser log

Section reviewed: **Methods** (Data Sources and Study Sample; Measures; Statistical Analysis).
Artifact: manuscript. Target journal: American Journal of Public Health (general public-health dialect).
Mode: **rewrite**.

## Linter output

Raw output of
`python3 ~/.claude/skills/scientific-writing-style/style-lint.py draft.md --section methods --artifact manuscript`:

```
# style-lint — 1 file(s)

## draft.md  (19 hit(s))
  draft.md:38: [packing_words/medium] "level" (level) | msgovOutpatient]. County-level factors came from severa
  draft.md:40: [packing_words/medium] "context" (context) | h hospital to its county context through its ZIP code and
  draft.md:40: [packing_words/medium] "models" (model) | every factor used in the models. The resulting complete-
  draft.md:44: [possessive_noun/medium] "bachelor's degree" (A's B → B of A) | are; the share holding a bachelor's degree or above; the poverty sh
  draft.md:46: [packing_words/medium] "model" (model) | tion, entered the change model as fixed categorical fac
  draft.md:50: [packing_words/medium] "levels" (level) | y associated with rating levels in 2017 and 2024 against
  draft.md:50: [packing_words/medium] "model" (model) | : a 2017 cross-sectional model, a 2024 cross-sectional
  draft.md:50: [packing_words/medium] "model" (model) | , a 2024 cross-sectional model, and a model of the 2017
  draft.md:50: [packing_words/medium] "model" (model) | s-sectional model, and a model of the 2017
  draft.md:50: [packing_words/medium] "model" (model) | in that year; the change model regressed the change in
  draft.md:50: [packing_words/medium] "model" (model) | ors. An augmented change model additionally controlled
  draft.md:50: [packing_words/medium] "models" (model) | dasticity, fitting three models: a 2017 cross-sectional
  draft.md:50: [packing_words/medium] "models" (model) | nge. The cross-sectional models regressed the rating in
  draft.md:50: [possessive_noun/medium] "hospital's starting" (A's B → B of A) | mn 4), testing whether a hospital's starting rating predicted its sub
  draft.md:38: [long_sentence/low] "51 words" (split if 3+ propositions) | County-level factors came from several sources: self-reported poor health from t…
  draft.md:40: [long_sentence/low] "36 words" (split if 3+ propositions) | acute-care hospital entered the analytic sample only if it reported an overall H…
  draft.md:40: [long_sentence/low] "36 words" (split if 3+ propositions) | We matched each hospital to its county context through its ZIP code and a ZIP-to…
  draft.md:44: [long_sentence/low] "54 words" (split if 3+ propositions) | County community factors comprised the prevalence of self-reported poor health; …
  draft.md:46: [long_sentence/low] "50 words" (split if 3+ propositions) | The change measure for the outcome was the 2024 overall star rating minus the 20…

## counts by class
  packing_words: 12
  long_sentence: 5
  possessive_noun: 2

HIGH-priority hits: 0
```

**HIGH-priority hits: 0** — deterministic floor satisfied with no forced rewrites. All 19 hits are
medium/low, adjudicated below.

---

## Methods

### DR-1 — packing-word ("level")
**Quote:** "County-level factors came from several sources..."
**Issue:** Drop test passes — "County factors came from several sources" preserves the meaning;
"county" already names the granularity, so "-level" is redundant (SKILL.md §4c packing words, which
gives the parallel example *"County-level demographics" → "county demographics"*). The document also
uses the plainer "County community factors" at the start of the Measures section, so keeping
"County-level" here mixes registers for the same concept (§4c, artifact-wide drop test).
**Fix:** "County factors came from several sources..."
**Status:** applied

### DR-2 — possessive (A's B → B of A)
**Quote:** "...testing whether a hospital's starting rating predicted its subsequent trajectory."
**Issue:** Inanimate/institutional noun possessor; formal academic prose prefers the of-construction
(SKILL.md §3 sentence structure). The pronoun possessor "its subsequent trajectory" correctly stays.
**Fix:** "...testing whether the starting rating of a hospital predicted its subsequent trajectory."
**Status:** applied

### packing-word ("model" / "models") — lines 46, 50
**Quote:** "fitting three models: a 2017 cross-sectional model, a 2024 cross-sectional model, and a
model of the 2017-to-2024 change... the change model regressed... An augmented change model..."
**Issue:** Linter flags "model"/"models" as packing words.
**Adjudication:** Not applied. In Methods, "model" names a genuine object — a regression model — and
the drop test fails ("a 2017 cross-sectional" alone loses the referent). SKILL.md §4c explicitly
endorses "the change model" and "model" as the *preferred* plain substitutes for "specification."
**Status:** not-applied — load-bearing (genuine object; preferred plain wording per §4c)

### packing-word ("levels") — line 50
**Quote:** "...which factors were significantly associated with rating levels in 2017 and 2024 against
which were significantly associated with the 2017-to-2024 change."
**Issue:** Linter flags "levels."
**Adjudication:** Not applied. The levels-vs-change contrast is the point of the sentence; "levels"
carries a contrast the document is actively making (§4c — keep when it names a contrast the document
is making). Dropping it would obscure the comparison.
**Status:** not-applied — load-bearing (names the levels-vs-change contrast)

### packing-word ("context") — line 40
**Quote:** "We matched each hospital to its county context through its ZIP code and a ZIP-to-county
crosswalk..."
**Issue:** "county context" is a mild packing construction; "context" is the abstract container.
**Adjudication:** Flagged, not rewritten. The concrete referent ("the county's community, demographic,
and supply factors") would have to be invented or would bloat the sentence; the matching mechanic is
the ZIP-to-county merge, which the sentence already states. Whether "context" is load-bearing here
(it gestures at the bundle of county measures) is an author meaning-judgment I cannot make cold.
Candidate fix if the author agrees: "We matched each hospital to its county..." (drop "context").
**Status:** flagged — needs author judgment

### possessive ("bachelor's degree") — line 44
**Quote:** "...the share holding a bachelor's degree or above..."
**Issue:** Linter flags "bachelor's degree" as an A's B possessive.
**Adjudication:** Not applied. "bachelor's degree" is an idiomatic fixed term, not an inanimate
possessor; SKILL.md §3 yields when the 's is idiomatic.
**Status:** not-applied — idiomatic possessive

### long-sentence (Q5) — line 38 (51 words)
**Quote:** "County factors came from several sources: self-reported poor health from the CDC PLACES
file...; hospital counts from the CMS Provider of Services file...; demographics from ACS...; rural-
urban classification from RUCA codes...; and nurse salary and bed count from the CMS Healthcare Cost
Report Information System."
**Adjudication (Q5):** Cleared. The length comes from a parallel, semicolon-delimited list (one
source per item) introduced by a colon, not from stacked independent propositions. Splitting would
break a clean enumeration. Length aids the reader here.
**Status:** not-applied — parallel list; length aids the reader

### long-sentence (Q5) — line 40 (two 36-word sentences)
**Quote (a):** "A U.S. acute-care hospital entered the analytic sample only if it reported an overall
HCAHPS star rating in both the 2017 and the 2024 release wave and had complete data, in both years,
on every factor used in the models."
**Quote (b):** "We matched each hospital to its county context through its ZIP code and a ZIP-to-county
crosswalk, merged community factors on county FIPS code, and combined the sources into one record per
hospital."
**Adjudication (Q5):** Cleared. (a) is right-branching — a single inclusion criterion with conditions
in series. (b) chains three assembly steps with "and," but they are parallel verbs of one process
(matched / merged / combined), right-branching, and read cleanly. Neither stacks three independent
propositions that tax the parser.
**Status:** not-applied — right-branching / parallel; length aids the reader

### long-sentence (Q5) — line 44 (54 words)
**Quote:** "County community factors comprised the prevalence of self-reported poor health; the local
supply of hospitals (hospitals per 1,000 county residents); population; the share aged 65 and over;
race and ethnicity shares; the foreign-born share; the share holding a bachelor's degree or above;
the poverty share overall and among adults 65 and over; and median household income."
**Adjudication (Q5):** Cleared. A semicolon-delimited enumeration of measures, parallel throughout.
This is the longest flagged sentence, but it is a list, not chained propositions.
**Status:** not-applied — parallel list; length aids the reader

### long-sentence (Q5) — line 46 (50 words)
**Quote:** "The change measure for the outcome was the 2024 overall star rating minus the 2017 rating;
the explanatory change measures covered ED time, the local hospital supply, and each county community
factor — the share aged 65 and over, racial and ethnic composition, the foreign-born share, education,
poverty, median household income, and poor-health prevalence."
**Adjudication (Q5):** Cleared. Two propositions joined by a semicolon, the second trailing an
enumerated list set off by a dash. Parallel and right-branching.
**Status:** not-applied — parallel list; length aids the reader

---

## Rubric pass (Q1–Q6 per paragraph; Q7 n/a — not Results)

**¶1 (Data Sources opener):**
- Q1 cleared: one point — "We assembled a hospital-level dataset that paired two snapshots for each
  hospital." Stated once.
- Q2 cleared (section opener): subject "We" arrives immediately; no derived fact or appositive delays it.
- Q3 cleared: "two snapshots" is standard panel-data register.
- Q4 cleared: "a rolling 12-month survey window that closes before its release wave" is concrete.
- Q5 cleared: no flagged sentence; closing sentence is right-branching.
- Q6 cleared: ends on "the window CMS reported publicly in early 2017" — concrete.

**¶2 (sources continued):** see DR-1 and the line-38 Q5 entry. Q1 cleared — one point (where each
factor came from). Q3/Q4/Q6 cleared.

**¶3 (sample definition):** see line-40 Q5 entries and the "context" flag. Q1 cleared — inclusion +
assembly cohere as one sample-construction point. Q6 cleared: ends on "one record per hospital."

**¶4 (Measures, outcome + factors):** see line-44 Q5 entry. Q1 cleared. Q3 cleared. Q6 cleared:
closing clause ends on "cannot themselves change over the window" — concrete. The final sentence's
reasoning ("because they can predict the trajectory of a hospital but cannot themselves change") is a
methods rationale, appropriate in Methods.

**¶5 (change measures):** see line-46 Q5 entry. Q1 cleared. Q6 cleared.

**¶6 (Statistical Analysis):**
- Q1 cleared: one point — three models and the central comparison.
- Q2 cleared (section opener): "We estimated the overall star rating using linear regression with
  standard errors robust to heteroskedasticity" — subject "We" direct.
- Q3 cleared: register uniform.
- Q6 cleared: closing sentence ends on "the 2017-to-2024 change" — concrete, not filler. (Note: "The
  central comparison was which factors were..." opens with a ranking-flavored "central," but in Methods
  this names the analysis design rather than narrating a finding, so it is not a finding-narration slip.)

No paragraph restructuring proposed.
