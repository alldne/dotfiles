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

function assert-deps {
    command -v $1 >/dev/null 2>&1 || { echo >&2 "install ""$1"" first"; exit 1; }
    __system '[OK]' $1
}

function brew-install-if-needed {
    if brew ls $1 > /dev/null; then
        __system '[OK]' $1
    else
        brew install $1
    fi
}

function open-install-page-if-needed {
    if [ ! -d "/Applications/$1.app" ]; then
        __system "Install $1"
        open $2
    else
        __system "[OK] $1"
    fi
}

assert-deps xcodebuild
assert-deps git

__system 'Current xcode path'
xcode-select -p

# install brew
if command -v brew > /dev/null; then
    brew update
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
    eval "$(/opt/homebrew/bin/brew shellenv)" >> $HOME/.zprofile
fi

assert-deps brew

brew-install-if-needed wget
brew-install-if-needed zsh
brew-install-if-needed zsh-completions
brew-install-if-needed tmux
brew-install-if-needed vim
brew-install-if-needed ag

brew install --cask openinterminal

if [ ! -f "$HOME/.ssh/id_rsa" ]; then
    __system "Generate ssh key"
    ssh-keygen
else
    __system "[OK] ssh key under $HOME/.ssh"
fi

# x86 brew
arch --x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

open-install-page-if-needed "Visual Studio Code" "https://code.visualstudio.com/docs/setup/mac"
open-install-page-if-needed "Sublime Merge" "https://www.sublimemerge.com"
open-install-page-if-needed "Clipy" "https://clipy-app.com"
open-install-page-if-needed "Magnet" "https://magnet.crowdcafe.com"
open-install-page-if-needed "Mac Mouse Fix" "https://mousefix.org/"

ICLOUD_DOC="$HOME/Library/Mobile\ Documents/com\~apple\~CloudDocs"
if [ -d "$ICLOUD_DOC" ]; then
    if [ ! -L $HOME/icloud ]; then
        __system "Create a symlink to iCloud at $HOME/icloud"
        ln -s $ICLOUD_DOC $HOME/icloud
        ls -al $HOME/icloud
    else
        __system "[OK] symlink to iCloud at ~/icloud"
    fi
fi

__system "Import a terminal theme: Pro_modified"
open Pro_modified.terminal

open "https://www.sublimemerge.com/docs/command_line"

__system "Completed"
