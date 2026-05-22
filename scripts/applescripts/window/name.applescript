-- Get name (title) of front window.
on run argv
	tell application "Terminal"
		if (count of windows) is 0 then
			return ""
		end if
		return name of front window
	end tell
end run
