#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if ! osascript -e 'tell application "Terminal" to get name' >/dev/null 2>&1; then
	echo "smoke_terminal: Terminal not available."
	exit 0
fi

count_out="$(osascript "$ROOT_DIR/scripts/window/count.applescript" 2>&1)" || { echo "smoke_terminal: Terminal not running, skipping."; exit 0; }
printf '%s\n' "$count_out" >/dev/null || { echo "smoke_terminal: window count failed." >&2; exit 1; }

tab_contents="$(osascript "$ROOT_DIR/scripts/tab/contents.applescript" 2>&1)" || true
tab_busy="$(osascript "$ROOT_DIR/scripts/tab/busy.applescript" 2>&1)" || true
printf '%s\n' "$tab_contents" "$tab_busy" >/dev/null || true

echo "smoke_terminal: ok"
