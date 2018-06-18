#!/usr/bin/env bash

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

assert-deps xcodebuild
assert-deps git

__system 'Current xcode path'
xcode-select -p

# install brew
if command -v brew > /dev/null; then
    brew update
else
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

assert-deps brew

brew-install-if-needed wget
brew-install-if-needed zsh
brew-install-if-needed zsh-completions
brew-install-if-needed tmux
brew-install-if-needed vim
brew-install-if-needed ag

if [ ! -f "$HOME/.ssh/id_rsa" ]; then
    __system "Generate ssh key"
    ssh-keygen
else
    __system "[OK] ssh key under $HOME/.ssh"
fi

if [ ! -d "/Applications/Visual Studio Code.app" ]; then
    __system "Install Visual Studio Code"
    open https://code.visualstudio.com/docs/setup/mac
else
    __system "[OK] Visual Studio Code"
fi
