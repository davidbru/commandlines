#!/bin/sh

defaults write com.apple.finder AppleShowAllFiles -boolean true
killall Finder
osascript -e 'tell application "Terminal" to close (every window whose name contains ".command")' &
exit