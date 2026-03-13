-- Close front window.
on run argv
	tell application "Terminal"
		if (count of windows) is 0 then
			return "No window"
		end if
		close front window
	end tell
	return "closed"
end run
