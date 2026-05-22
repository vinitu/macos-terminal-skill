---
name: macos-terminal
description: Terminal.app automation on macOS for AI agents via AppleScript. Open windows/tabs, run commands, read output, manage layout, and switch profiles.
---

# macOS Terminal

Use this skill when the task is about Apple Terminal.app on macOS.

## Main Rule

Use only `scripts/commands`.
Do not call `scripts/applescripts` directly.

## Requirements

- macOS with Terminal.app
- Automation permissions for the terminal.

## Public Interface

Run commands from `scripts/commands`:

- `scripts/commands/tab/*`
- `scripts/commands/window/*`

## Output Rules

- Commands return JSON by default where the AppleScript already produces JSON; otherwise passes through plain text.
- `--json`, `--plain`, and `--format=plain|json` are not supported.

## Commands

### Tabs

```bash
scripts/commands/tab/busy.sh
scripts/commands/tab/contents.sh
scripts/commands/tab/history.sh
```

### Windows

```bash
scripts/commands/window/bounds.sh
scripts/commands/window/close.sh
scripts/commands/window/count.sh
scripts/commands/window/miniaturized.sh
scripts/commands/window/name.sh
scripts/commands/window/run-script.sh
scripts/commands/window/zoomed.sh
```

## JSON Contract

Tab object:

- `index` (integer)
- `name` (string)
- `busy` (boolean)
- `contents` (string)

Window object:

- `index` (integer)
- `name` (string)
- `bounds` (list of integers: {left, top, right, bottom})
- `miniaturized` (boolean)
- `zoomed` (boolean)

Scalar envelopes:

- `count`: `{"count": N}`
- `success/failure`: `{"success": true/false, "error": "..."}`

## Safety Boundaries

- Window close and script execution must be explicit.
- Never run destructive or long-running commands in user shells.
- Internal AppleScript files are not public API.
