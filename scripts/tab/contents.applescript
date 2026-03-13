-- Get contents of selected tab in front window.
on run argv
	tell application "Terminal"
		if (count of windows) is 0 then
			return ""
		end if
		set sel to selected of front window
		return contents of sel
	end tell
end run
