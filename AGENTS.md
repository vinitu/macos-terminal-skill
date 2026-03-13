# Repo Guide

This repo stores the macos-terminal skill for Terminal.app automation on macOS.

## Goal

- Document AppleScript commands for Terminal.app accurately.
- Prefer runnable examples over long prose.
- Never execute destructive commands in user terminals without explicit approval.

## Repo Layout

- `AGENTS.md`: this file; rules for coding agents.
- `SKILL.md`: the skill contract and usage instructions for agents.
- `README.md`: public project overview and installation notes.
- `Makefile`: targets `dictionary-terminal`, `check`, `compile`, `test` (test-dictionary + test-smoke).
- `scripts/window/count.applescript`, `run-script.applescript`, `close.applescript`, `bounds.applescript`, `name.applescript`, `miniaturized.applescript`, `zoomed.applescript`.
- `scripts/tab/contents.applescript`, `history.applescript`, `busy.applescript`.
- `tests/dictionary_contract.sh`: contract test against Terminal scripting dictionary.
- `tests/smoke_terminal.sh`: smoke test for script layer (skips when Terminal not available).
- `.github/workflows/ci-pr.yml`, `ci-main.yml`: CI on PR and push to main.

## Validation

After making changes:
- run `make check` to ensure Terminal is available;
- run `make test` to run dictionary contract and smoke tests;
- run `make compile` to compile all AppleScript files (syntax check);
- update `SKILL.md` when command coverage changes.

## Editing Rules

- Keep docs in simple English.
- Do not claim support for a feature unless it is verified with Terminal.app AppleScript.
- Never execute destructive commands in user terminals without explicit approval.
