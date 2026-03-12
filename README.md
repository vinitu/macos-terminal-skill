# Apple Terminal Skill

A skill for Terminal.app automation on macOS via AppleScript.

## Installation

```bash
skills.sh add vinitu/apple-terminal-skill
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

```bash
osascript -e 'tell application "Terminal" to do script "echo hello"'
osascript -e 'tell application "Terminal" to get contents of selected tab of front window'
osascript -e 'tell application "Terminal" to get busy of selected tab of front window'
```

See `SKILL.md` for the full command reference.
