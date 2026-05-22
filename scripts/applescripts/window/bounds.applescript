-- Get or set window bounds. argv: get|set [x y w h]
on run argv
	if (count of argv) < 1 then
		return "Usage: bounds.applescript <get|set> [x y w h]"
	end if
	set cmd to item 1 of argv

	tell application "Terminal"
		if (count of windows) is 0 then
			return "No window"
		end if
		set w to front window
		if cmd is "set" and (count of argv) ≥ 5 then
			set bounds of w to {(item 2 of argv) as integer, (item 3 of argv) as integer, (item 4 of argv) as integer, (item 5 of argv) as integer}
			return "set"
		else
			return (bounds of w) as text
		end if
	end tell
end run
