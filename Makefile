.PHONY: dictionary-terminal compile check test test-dictionary test-smoke

dictionary-terminal:
	@sdef /System/Applications/Utilities/Terminal.app

compile:
	@set -euo pipefail; \
	find scripts -name '*.applescript' -print | while IFS= read -r file; do \
		osacompile -o /tmp/$$(echo "$$file" | tr '/' '_' | sed 's/\.applescript$$/.scpt/') "$$file"; \
	done

check:
	@osascript -e 'tell application "Terminal" to get name' >/dev/null || { echo "check: Terminal not available"; exit 1; }
	@echo "Terminal is available"

test: test-dictionary test-smoke

test-dictionary:
	@bash tests/dictionary_contract.sh

test-smoke:
	@bash tests/smoke_terminal.sh
