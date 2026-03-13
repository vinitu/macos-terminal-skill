# macOS Terminal Skill

A skill for Terminal.app automation on macOS via AppleScript.

## Installation

```bash
skills.sh add vinitu/macos-terminal-skill
```

## Scope

- Open new windows and tabs
- Run commands in specific windows/tabs
- Read terminal output and history
- Check if commands are still running
- Manage window size, position, layout
- Switch profiles and themes
- Get/set tab properties (title, busy, processes)

## Prerequisites

- macOS with Terminal.app
- Automation permission for your terminal app
- Accessibility permission (for tab creation via keystrokes)

## How To Use

From the skill directory (or path where scripts are installed):

```bash
# Run command in new window (or front-window)
osascript scripts/window/run-script.applescript "echo hello"
# Get contents of selected tab in front window
osascript scripts/tab/contents.applescript
# Check if selected tab is busy (true/false)
osascript scripts/tab/busy.applescript
```

See `SKILL.md` for the full command reference and scripts under `scripts/`.
