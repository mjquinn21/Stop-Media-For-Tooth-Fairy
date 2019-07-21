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

tell application "Spotify"
	if it is running and player state is playing then pause
	delay 0.25
end tell


tell application "Music"
	if it is running and player state is playing then pause
	delay 0.25
end tell

tell application "Google Chrome"
	if it is running then
		repeat with t in tabs of windows
			if URL of t contains "www.netflix.com/watch" then
				tell t to execute javascript pauseScript
				delay 0.25
			else if URL of t contains "www.youtube.com/watch?" then
				tell t to execute javascript pauseScript
				delay 0.25
			else if URL of t contains "open.spotify.com" then
				tell t to execute javascript pauseSpotify
				delay 0.25
			else if URL of t contains "www.hulu.com/watch" then
				tell t to execute javascript pauseHulu
				delay 0.25
			end if
		end repeat
	end if
end tell


tell application "Safari"
	if it is running then
		repeat with t in tabs of windows
			if URL of t contains "www.netflix.com/watch" then
				tell t to do JavaScript pauseScript
				delay 0.25
			else if URL of t contains "www.youtube.com/watch?" then
				tell t to do JavaScript pauseScript
				delay 0.25
			else if URL of t contains "open.spotify.com" then
				tell t to do JavaScript pauseSpotify
				delay 0.25
			else if URL of t contains "www.hulu.com/watch" then
				tell t to do JavaScript pauseHulu
				delay 0.25
			end if
		end repeat
	end if
end tell


tell application "QuickTime Player"
	if it is running then
		repeat with d in documents of windows
			tell d
				if playing is true then pause
			end tell
			delay 0.25
		end repeat
	end if
end tell

set volume without output muted

--tell application "BetterTouchTool" to refresh_widget "AirPod Widget UUID"
