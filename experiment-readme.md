# Claude-Code writing experiment — overview

This project doubles as a writing experiment: I'm using Claude Code in an
agentic mode to draft, revise, and review the HCAHPS manuscript, while keeping
a full audit trail of what was tried, what worked, and what didn't.

## Goal

End-to-end: produce a publication-quality manuscript (target: *Health Affairs*)
through a Claude-driven workflow — outline → draft → self-review →
peer-review → revise — while documenting the process well enough that someone
else could read this repo afterwards and understand *exactly* what happened.

## Scope of the experiment

- **In scope**: the manuscript prose itself (introduction, methods, results,
  discussion, abstract), supporting reference research, and the iterative
  loop between writing and review.
- **Out of scope**: the underlying data analysis (Stata do-files are inputs,
  not subjects of the experiment) and the empirical findings themselves
  (those are determined by the analysis, not by the writing process).

## Stance

Exploratory with a full audit trail. There is **no pre-registered hypothesis**
and **no formal evaluation rubric** in advance. Claims about "what Claude can
or can't do" should come *out of* this work, not be tested by it. If patterns
emerge that warrant a tighter follow-up study, that's a separate experiment.

## What is captured

Three layers, in increasing interpretation:

1. **Writing state over time** — every change to the manuscript and supporting
   files is committed to git. Tags mark workflow handoffs (`v1-outline`,
   `v1-draft`, `v1-after-peer-review`, etc.) so `git diff <tag1> <tag2>`
   shows exactly what one stage produced.

2. **Raw transcripts** — every Claude Code session is saved as JSONL by the
   tool itself at `~/.claude/projects/-workspaces-HCAHPS/`. The
   `scripts/export-transcript.py` script copies these into
   `transcripts/raw/` and renders a human-readable markdown version into
   `transcripts/readable/`.

3. **Running journal** — `experiment-log.md` is a hand-written log of what I
   tried each session, what surprised me, what I'd change. This is the layer
   transcripts can't give: my interpretation in the moment.

## Conventions

### Commit messages

Each commit message starts with a stage prefix:

- `outline:` — building or revising an outline
- `draft:` — first-pass prose generation
- `self-review:` — Claude's self-review pass on its own draft
- `peer-review:` — peer-review-agent critique
- `revise:` — revisions in response to review
- `meta:` — changes to experiment infrastructure (this readme, scripts, logs)
- `manual:` — edits I made by hand, not via an agent

Commit messages name the agent / skill that produced the change
(`drafter agent`, `outline skill`, `manual edit`, etc.) so `git log` is
itself a provenance record.

### Tags

Tag at workflow handoffs so versions of the artifact are easy to retrieve:

- `v{N}-outline`, `v{N}-draft`, `v{N}-self-reviewed`, `v{N}-peer-reviewed`,
  `v{N}-revised`, where `N` is the iteration number.

### When to export transcripts

End of each working session, or after any milestone worth tagging:

```bash
python3 scripts/export-transcript.py
git add transcripts/
git commit -m "meta: export transcripts through <date>"
```

The export script is idempotent and incremental — re-running it just refreshes
existing files with any new turns.

## File map

| Path | What it is |
|---|---|
| `experiment-readme.md` | This file. |
| `experiment-log.md` | Running session-by-session journal. |
| `scripts/export-transcript.py` | Exports Claude Code JSONL sessions into `transcripts/`. |
| `transcripts/raw/` | Verbatim copies of session JSONL files. |
| `transcripts/readable/` | Human-readable markdown rendering of each session. |
| `framing.md` | Pre-existing alignment doc — read before writing. |
| `reference-research.md` | Pre-existing reference notebook. |
| `CLAUDE.md` | Project-level instructions for Claude Code. |
| `*.do` | Stata analysis pipeline (input to the experiment, not modified by it). |

## Environment baseline

Recorded once at experiment start; update if the environment changes
materially mid-experiment.

- **Date started**: 2026-05-07
- **Claude Code version**: 2.1.132
- **Model**: claude-opus-4-7 (Opus 4.7, 1M context)
- **Working directory**: `/workspaces/HCAHPS`
- **Project skills available**: outline, draft, self-review, peer-review,
  grade, grade-comments, find-reference, scientific-writing-style.
