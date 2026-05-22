.PHONY: dictionary dictionary-terminal dictionary-standard compile check test test-dictionary test-smoke

dictionary:
	@printf '### Terminal.app\n'
	@sdef /System/Applications/Utilities/Terminal.app
	@printf '\n### CocoaStandard.sdef\n'
	@cat /System/Library/ScriptingDefinitions/CocoaStandard.sdef

dictionary-terminal:
	@sdef /System/Applications/Utilities/Terminal.app

dictionary-standard:
	@cat /System/Library/ScriptingDefinitions/CocoaStandard.sdef

compile:
	@set -euo pipefail; \
	find scripts/applescripts -name '*.applescript' -print | while IFS= read -r file; do \
		osacompile -o /tmp/$$(echo "$$file" | tr '/' '_' | sed 's/\.applescript$$/.scpt/') "$$file" || exit 1; \
	done; \
	find scripts/tests scripts/commands -name '*.sh' -print | while IFS= read -r file; do \
		bash -n "$$file" || exit 1; \
	done

check:
	@osascript -e 'tell application "Terminal" to get name' >/dev/null || { echo "check: Terminal not available"; exit 1; }
	@echo "Terminal is available"

test: test-dictionary test-smoke

test-dictionary:
	@bash scripts/tests/dictionary_contract.sh

test-smoke:
	@bash scripts/tests/smoke_terminal.sh
