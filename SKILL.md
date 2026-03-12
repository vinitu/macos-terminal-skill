---
name: apple-terminal
description: Terminal.app automation on macOS for AI agents via AppleScript. Open windows/tabs, run commands, read output, manage layout, and switch profiles.
---

# Apple Terminal Skill

Control macOS Terminal.app using AppleScript (`osascript`).

## Opening Windows and Tabs

```bash
# New window (empty)
osascript -e 'tell application "Terminal" to do script ""'

# New window running a command
osascript -e 'tell application "Terminal" to do script "echo hello"'

# New tab in frontmost window (via System Events keystroke)
osascript -e 'tell application "System Events" to tell process "Terminal" to keystroke "t" using command down'
```

Note: There is no native AppleScript command to open a new tab — System Events keystroke is required (needs Accessibility permission).

## Running Commands

```bash
# Run in a new window
osascript -e 'tell application "Terminal" to do script "ls -la"'

# Run in the front window
osascript -e 'tell application "Terminal" to do script "pwd" in front window'

# Run in a specific tab
osascript -e 'tell application "Terminal" to do script "date" in tab 1 of front window'

# Multiple commands
osascript -e 'tell application "Terminal" to do script "cd ~/Projects && git status"'
```

## Reading Output

```bash
# Get contents of selected tab
osascript -e 'tell application "Terminal" to get contents of selected tab of front window'

# Get full history of a tab
osascript -e 'tell application "Terminal" to get history of tab 1 of front window'

# Check if tab is busy (command still running)
osascript -e 'tell application "Terminal" to get busy of selected tab of front window'
```

## Managing Windows

```bash
# Count windows
osascript -e 'tell application "Terminal" to count windows'

# Resize window (x, y, width, height)
osascript -e 'tell application "Terminal" to set bounds of front window to {0, 0, 800, 600}'

# Move window
osascript -e 'tell application "Terminal" to set position of front window to {100, 100}'

# Close window
osascript -e 'tell application "Terminal" to close front window'

# Minimize
osascript -e 'tell application "Terminal" to set miniaturized of front window to true'

# Bring to front
osascript -e 'tell application "Terminal" to activate'
```

## Profiles and Themes

```bash
# List available profiles
osascript -e 'tell application "Terminal" to get name of every settings set'

# Apply profile to current tab
osascript -e 'tell application "Terminal"
  set current settings of selected tab of front window to settings set "Pro"
end tell'

# Set default profile
osascript -e 'tell application "Terminal" to set default settings to settings set "Pro"'

# Set startup profile
osascript -e 'tell application "Terminal" to set startup settings to settings set "Homebrew"'
```

## Tab Properties

```bash
# Custom title
osascript -e 'tell application "Terminal" to get custom title of selected tab of front window'

# Set custom title
osascript -e 'tell application "Terminal"
  set custom title of selected tab of front window to "My Task"
  set title displays custom title of selected tab of front window to true
end tell'

# Busy status
osascript -e 'tell application "Terminal" to get busy of selected tab of front window'

# Running processes
osascript -e 'tell application "Terminal" to get processes of selected tab of front window'

# Rows and columns
osascript -e 'tell application "Terminal" to get number of rows of selected tab of front window'
osascript -e 'tell application "Terminal" to get number of columns of selected tab of front window'
```

## Window Properties

```bash
# Window name
osascript -e 'tell application "Terminal" to get name of front window'

# Tab count
osascript -e 'tell application "Terminal" to count tabs of front window'

# Bounds
osascript -e 'tell application "Terminal" to get bounds of front window'

# Visible
osascript -e 'tell application "Terminal" to get visible of front window'
```

## Common Workflows

### Run a command and wait for completion

```bash
osascript <<'EOF'
tell application "Terminal"
  set t to do script "sleep 3 && echo DONE"
  repeat
    delay 0.5
    if not busy of t then exit repeat
  end repeat
  return contents of t
end tell
EOF
```

### Split layout (two windows side by side)

```bash
osascript -e 'tell application "Terminal"
  do script "echo left"
  set bounds of front window to {0, 0, 960, 1080}
  do script "echo right"
  set bounds of front window to {960, 0, 1920, 1080}
end tell'
```

## Limitations

- No native tab creation via AppleScript — requires System Events keystrokes and Accessibility permission
- No direct stdin input — `do script` sends text as if typed
- Output capture is approximate — `contents` returns the scrollback buffer which may be truncated; use file redirection for large outputs
- No per-command exit code — check `$?` inside the terminal
- `busy` only reflects child processes — a shell at a prompt is "not busy"
- Profile names are case-sensitive

## Troubleshooting

| Problem | Fix |
|---------|-----|
| "Access not allowed" | Grant Automation permission in System Settings |
| Keystrokes do nothing | Grant Accessibility permission in System Settings |
| `contents` returns empty | Add `delay 0.5` before reading |
| `busy` always true | Shell profile runs a long init script; simplify `.zshrc` |
| Profile not found | Check exact name with `get name of every settings set` |
| `do script` opens new window | Specify `in front window` to reuse existing |
| Output truncated | Redirect to file: `cmd > /tmp/output.txt 2>&1` |
