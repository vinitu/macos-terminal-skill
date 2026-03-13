-- Run command in Terminal. argv: command [front-window|new-window]
on run argv
	if (count of argv) < 1 then
		return "Usage: run-script.applescript <command> [front-window|new-window]"
	end if
	set cmd to item 1 of argv
	set target to "new-window"
	if (count of argv) ≥ 2 then set target to item 2 of argv

	tell application "Terminal"
		if target is "front-window" and (count of windows) > 0 then
			do script cmd in front window
		else
			do script cmd
		end if
	end tell
	return "done"
end run
