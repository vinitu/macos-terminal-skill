-- Get or set zoomed state of front window. argv: get|set [true|false]
on run argv
	if (count of argv) < 1 then
		return "Usage: zoomed.applescript <get|set> [true|false]"
	end if
	set cmd to item 1 of argv

	tell application "Terminal"
		if (count of windows) is 0 then
			return "No window"
		end if
		set w to front window
		if cmd is "set" and (count of argv) ≥ 2 then
			set zoomed of w to (item 2 of argv is "true")
			return "set"
		else
			return (zoomed of w) as text
		end if
	end tell
end run
