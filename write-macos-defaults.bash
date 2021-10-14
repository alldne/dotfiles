#!/usr/bin/env bash

set -e

# https://stackoverflow.com/a/28938235
# Reset
RESET='\033[0m'       # Text Reset

# Regular Colors
BLACK='\033[0;30m'        # Black
RED='\033[0;31m'          # Red
GREEN='\033[0;32m'        # Green
YELLOW='\033[0;33m'       # Yellow
BLUE='\033[0;34m'         # Blue
PURPLE='\033[0;35m'       # Purple
CYAN='\033[0;36m'         # Cyan
WHITE='\033[0;37m'        # White

function __system {
    echo -e $GREEN$*$RESET
}

function write {
    __system "[OK]" $4
    defaults write "$1" "$2" "$3"
}

write "Apple Global Domain" "com.apple.swipescrolldirection" 0 "System Preferences > Trackpad > Scroll & Zoom > Scroll directional: Natural = false"
write "Apple Global Domain" "AppleEnableSwipeNavigateWithScrolls" 0 "System Preferences > Trackpad > More Gestures > Swipe between pages = Swipe with three fingers"
write "com.apple.AppleMultitouchTrackpad" "TrackpadThreeFingerHorizSwipeGesture" 1 "System Preferences > Trackpad > More Gestures > Swipe between full-screen apps = Swipe left or right with four fingers"

write "com.apple.dock" "wvous-bl-corner" 3 "System Preferences > Mission Control > Hot Corners > Bottom-left = Application Windows"
write "com.apple.dock" "wvous-tl-corner" 4 "System Preferences > Mission Control > Hot Corners > Top-left = Desktop"
write "com.apple.dock" "wvous-tr-corner" 2 "System Preferences > Mission Control > Hot Corners > Top-right = Mission Control"
write "com.apple.dock" "wvous-bl-modifier" 0 "- Bottom-left modifier = 0"
write "com.apple.dock" "wvous-tl-modifier" 0 "- Top-left modifier = 0"
write "com.apple.dock" "wvous-tr-modifier" 0 "- Top-right modifier = 0"

write "Apple Global Domain" "NSUserKeyEquivalents" '<dict><key>Strikethrough</key><string>@$s</string></dict>' "System Preferences > Keyboard > Shortcuts > App Shortcuts > Strikethrough = shift cmd S"

write "Apple Global Domain" "KeyRepeat" 2 "System Preferences > Keyboard > Keyboard > Key Repeat = Fast"
write "Apple Global Domain" "InitialKeyRepeat" 25 "System Preferences > Keyboard > Keyboard > Delay Until Repeat = Short"

# TODO:
# capslock -> control
# ctrl space bar <=> cmd space bar

__system "Completed"
