-- Check if selected tab is busy. Returns true/false.
on run argv
	tell application "Terminal"
		if (count of windows) is 0 then
			return "false"
		end if
		set sel to selected of front window
		return (busy of sel) as text
	end tell
end run
