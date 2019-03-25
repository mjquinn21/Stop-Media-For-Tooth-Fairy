set volume with output muted
set pauseScript to "
			var v = document.querySelector('video');
			if (v.paused) {
				// do nothing 
			  }
			else { 
			  v.pause(); 
			}
			"
set pauseSpotify to "var classes = document.getElementsByClassName('control-button spoticon-pause-16 control-button--circled');
var Rate = classes[0];
Rate.click();"
set pauseHulu to "
			var v = document.querySelector('video');
			if (v.paused) {
				// do nothing 
			  }
			else { 
			  document.getElementsByClassName('controls__playback-button keep-mouse-active controls__playback-button--playing')[0].click();
			}
			"

tell application "Google Chrome"
	repeat with t in tabs of windows
		
	end repeat
end tell

tell application "Google Chrome"
	repeat with t in tabs of windows
		if URL of t contains "www.netflix.com/watch" then
			tell t to execute javascript pauseScript
		else if URL of t contains "www.youtube.com/watch?" then
			tell t to execute javascript pauseScript
		else if URL of t contains "open.spotify.com" then
			tell t to execute javascript pauseSpotify
		else if URL of t contains "www.hulu.com/watch" then
			tell t to execute javascript pauseHulu
		end if
	end repeat
end tell


tell application "Spotify"
	if it is running and player state is playing then pause
end tell


tell application "iTunes"
	if it is running and player state is playing then pause
end tell

tell application "QuickTime Player"
	if it is running then
		repeat with d in documents of windows
			tell d
				if playing is true then pause
			end tell
		end repeat
	end if
end tell

tell application "Noizio"
	if it is running and playing is true then set playing to false
end tell

set volume without output muted

--tell application "BetterTouchTool" to refresh_widget "AirPod Widget UUID"
