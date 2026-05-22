# macOS Terminal Skill

This repo stores an AI agent skill for Apple Terminal.app on macOS.

The public interface is `scripts/commands`.
`scripts/applescripts` stores internal AppleScript backends and dictionary-aligned coverage.

## Installation

```bash
npx skills add vinitu/macos-terminal-skill
```

Or with [skills.sh](https://skills.sh):

```bash
skills.sh add vinitu/macos-terminal-skill
```

## Prerequisites

- macOS with Terminal.app
- Automation permission granted to your terminal app

## Public Interface

Run skill actions with:

```bash
scripts/commands/<entity>/<action>.sh [args...]
```

Output rules:

- Commands return JSON by default unless noted otherwise.
- `--json`, `--plain`, and `--format=plain|json` are not supported.

## Backend Map

- `scripts/commands/tab/*` → AppleScript in `scripts/applescripts/tab/*`
- `scripts/commands/window/*` → AppleScript in `scripts/applescripts/window/*`

`scripts/applescripts` is internal. Do not call it directly from the skill instructions.

## Command Surface

Tab:

- `scripts/commands/tab/busy.sh`
- `scripts/commands/tab/contents.sh`
- `scripts/commands/tab/history.sh`

Window:

- `scripts/commands/window/bounds.sh`
- `scripts/commands/window/close.sh`
- `scripts/commands/window/count.sh`
- `scripts/commands/window/miniaturized.sh`
- `scripts/commands/window/name.sh`
- `scripts/commands/window/run-script.sh`
- `scripts/commands/window/zoomed.sh`

## Validation

```bash
make compile
make test
```

`make test` runs live checks against Terminal.app and expects Terminal to be available.

## Known Limits

- Terminal must be running for most commands to work.
- TCC permissions (Automation) must be granted to the terminal or parent process.
