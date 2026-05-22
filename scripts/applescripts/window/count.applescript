-- Return the number of Terminal windows.
tell application "Terminal"
	return (count of windows) as string
end tell
