-- Get history of tab. argv: [tabIndex] (default: selected tab of front window)
on run argv
	tell application "Terminal"
		if (count of windows) is 0 then
			return ""
		end if
		if (count of argv) ≥ 1 then
			set idx to (item 1 of argv) as integer
			set t to tab idx of front window
			return t's history
		end if
		set sel to selected of front window
		return sel's history
	end tell
end run
