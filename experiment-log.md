# Experiment log

Running journal of the Claude-Code writing experiment. One entry per session
(or per meaningful milestone within a long session). Keep entries short:
the transcripts capture *what* happened; this log is for *why* and *what I
learned*.

Entry template:

```
## YYYY-MM-DD — short title

**Goal**: what I set out to do this session.
**What I asked Claude to do**: one or two sentences.
**What happened**: outcome — drafts produced, files changed, problems hit.
**Surprises / lessons**: anything unexpected, good or bad.
**Decisions made**: anything I want to remember for next time.
**Next**: what comes next, if known.
```

---

## 2026-05-07 — Experiment infrastructure setup

**Goal**: Stand up the audit-trail scaffolding so the writing experiment
itself becomes documentable.

**What I asked Claude to do**: Set up git, gitignore, this log, an
experiment readme, and a transcript-export script.

**What happened**: Two commits — a baseline of pre-existing project files,
then the experiment scaffolding. Export script tested against the two
existing JSONL session files; renders cleanly to `transcripts/readable/`.

**Surprises / lessons**: Claude Code already saves complete JSONL session
logs at `~/.claude/projects/-workspaces-HCAHPS/`, so transcript capture is
just a copy-and-render step rather than instrumentation.

**Decisions made**: Track both raw JSONL and rendered markdown in git. Same
repo as the manuscript (not a sibling repo) for now — can split later if
the manuscript history needs to be shared without the experiment exhaust.

**Next**: First real writing session — likely starting with an outline of
the introduction, since `framing.md` is already mature enough to feed it.
