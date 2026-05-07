#!/usr/bin/env python3
"""
Export Claude Code session transcripts.

Source: ~/.claude/projects/-workspaces-HCAHPS/*.jsonl
Output:
  transcripts/raw/<session-id>.jsonl       (verbatim copy)
  transcripts/readable/<session-id>.md     (human-readable rendering)

Usage:
  python3 scripts/export-transcript.py                # export all sessions
  python3 scripts/export-transcript.py <id-prefix>    # filter by prefix

Idempotent: re-running refreshes existing exports with any new turns.
"""
from __future__ import annotations

import json
import shutil
import sys
from pathlib import Path

PROJECT_DIR = Path("/workspaces/HCAHPS")
SOURCE_DIR = Path.home() / ".claude/projects/-workspaces-HCAHPS"
RAW_DIR = PROJECT_DIR / "transcripts/raw"
READABLE_DIR = PROJECT_DIR / "transcripts/readable"

SKIP_TYPES = {
    "queue-operation",
    "ai-title",
    "file-history-snapshot",
    "last-prompt",
    "attachment",
}


def fmt_ts(ts: str) -> str:
    if not ts:
        return ""
    return ts.replace("T", " ").rstrip("Z")[:19] + "Z"


def summarize_tool_input(name: str, inp: dict) -> str:
    if name == "Bash":
        cmd = inp.get("command", "")
        return f"`{cmd[:160]}`" + ("…" if len(cmd) > 160 else "")
    if name in ("Read", "Edit", "Write"):
        return f"`{inp.get('file_path', '?')}`"
    if name == "Grep":
        return f"pattern=`{inp.get('pattern', '?')}` path=`{inp.get('path', '.')}`"
    if name == "Glob":
        return f"`{inp.get('pattern', '?')}`"
    if name == "AskUserQuestion":
        qs = inp.get("questions", [])
        return f"{len(qs)} question(s)"
    if name == "Agent":
        return inp.get("description", "")[:160]
    if name == "TodoWrite":
        return f"{len(inp.get('todos', []))} todo(s)"
    if name == "Skill":
        return f"`{inp.get('skill', '?')}` args=`{inp.get('args','')}`"
    if name == "WebFetch":
        return f"`{inp.get('url', '?')}`"
    if name == "WebSearch":
        return f"`{inp.get('query', '?')}`"
    keys = ", ".join(inp.keys())
    return f"input keys: {keys}"


def render_assistant(content: list) -> str:
    text_parts: list[str] = []
    tool_calls: list[str] = []
    for block in content:
        bt = block.get("type")
        if bt == "text":
            t = block.get("text", "").strip()
            if t:
                text_parts.append(t)
        elif bt == "thinking":
            # Private chain-of-thought; deliberately omitted from the readable
            # rendering. The raw JSONL preserves it if needed.
            pass
        elif bt == "tool_use":
            name = block.get("name", "?")
            tool_calls.append(f"- **{name}** — {summarize_tool_input(name, block.get('input', {}))}")
    pieces: list[str] = []
    if text_parts:
        pieces.append("\n\n".join(text_parts))
    if tool_calls:
        pieces.append("**Tool calls:**\n" + "\n".join(tool_calls))
    return "\n\n".join(pieces)


def render_user(content, is_meta: bool) -> str | None:
    if is_meta:
        return None
    if isinstance(content, str):
        s = content.strip()
        meta_prefixes = (
            "<local-command-caveat>",
            "<command-name>",
            "<local-command-stdout>",
            "<local-command-stderr>",
        )
        if s.startswith(meta_prefixes):
            return None
        return s or None
    if isinstance(content, list):
        # If everything is a tool_result, this is feedback to the assistant,
        # not a user prompt — skip.
        non_tool = [b for b in content if b.get("type") != "tool_result"]
        if not non_tool:
            return None
        parts: list[str] = []
        for b in non_tool:
            if b.get("type") == "text":
                t = b.get("text", "").strip()
                if t and not t.startswith("<local-command-caveat>"):
                    parts.append(t)
        return "\n\n".join(parts) or None
    return None


def render_session(jsonl_path: Path, out_md_path: Path) -> None:
    events = []
    for line in jsonl_path.read_text().splitlines():
        try:
            events.append(json.loads(line))
        except json.JSONDecodeError:
            continue

    first = next(
        (e for e in events if e.get("type") in ("user", "assistant")),
        {},
    )
    session_id = first.get("sessionId", jsonl_path.stem)
    cwd = first.get("cwd", "?")
    version = first.get("version", "?")
    first_ts = first.get("timestamp", "")

    model = "?"
    for e in events:
        if e.get("type") == "assistant":
            model = e.get("message", {}).get("model", "?")
            break

    # Count only the turns that survive filtering and actually render.
    user_count = sum(
        1
        for e in events
        if e.get("type") == "user"
        and render_user(e.get("message", {}).get("content"), e.get("isMeta", False))
    )
    assistant_count = sum(
        1
        for e in events
        if e.get("type") == "assistant"
        and render_assistant(e.get("message", {}).get("content", []))
    )

    lines = [
        f"# Transcript — {session_id}",
        "",
        f"- **Started**: {fmt_ts(first_ts)}",
        f"- **CWD**: `{cwd}`",
        f"- **Claude Code version**: {version}",
        f"- **Model**: {model}",
        f"- **User turns**: {user_count}",
        f"- **Assistant turns**: {assistant_count}",
        "",
        "*Note: assistant `thinking` blocks are stripped from this rendering "
        "for readability. The raw JSONL in `transcripts/raw/` retains them.*",
        "",
        "---",
        "",
    ]

    turn = 0
    for e in events:
        t = e.get("type")
        if t in SKIP_TYPES:
            continue
        ts = fmt_ts(e.get("timestamp", ""))
        if t == "user":
            content = e.get("message", {}).get("content")
            rendered = render_user(content, e.get("isMeta", False))
            if rendered:
                turn += 1
                lines.append(f"## Turn {turn} — User · {ts}")
                lines.append("")
                lines.append(rendered)
                lines.append("")
        elif t == "assistant":
            content = e.get("message", {}).get("content", [])
            rendered = render_assistant(content)
            if rendered:
                lines.append(f"### Assistant · {ts}")
                lines.append("")
                lines.append(rendered)
                lines.append("")

    out_md_path.parent.mkdir(parents=True, exist_ok=True)
    out_md_path.write_text("\n".join(lines))


def main() -> int:
    selector = sys.argv[1] if len(sys.argv) > 1 else None
    if not SOURCE_DIR.exists():
        print(f"No source directory: {SOURCE_DIR}", file=sys.stderr)
        return 1

    RAW_DIR.mkdir(parents=True, exist_ok=True)
    READABLE_DIR.mkdir(parents=True, exist_ok=True)

    files = sorted(SOURCE_DIR.glob("*.jsonl"))
    if selector:
        files = [f for f in files if f.stem.startswith(selector)]
    if not files:
        print("No transcripts to export.", file=sys.stderr)
        return 0

    for f in files:
        shutil.copy2(f, RAW_DIR / f.name)
        out = READABLE_DIR / (f.stem + ".md")
        render_session(f, out)
        print(f"  {f.name} -> {out.name}")
    print(f"Exported {len(files)} session(s).")
    return 0


if __name__ == "__main__":
    sys.exit(main())
