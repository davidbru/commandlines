#!/bin/sh

defaults write com.apple.finder AppleShowAllFiles -boolean false
killall Finder
osascript -e 'tell application "Terminal" to close (every window whose name contains ".command")' &
exit