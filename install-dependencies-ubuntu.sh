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

function install-if-needed {
    if dpkg -l $1 > /dev/null ; then
        __system '[OK]' $1
    else
        __system 'Install' $1 '...'
        sudo apt install $1
    fi
}

assert-deps git

install-if-needed wget
install-if-needed curl
install-if-needed zsh
install-if-needed tmux
install-if-needed vim
install-if-needed silversearcher-ag
install-if-needed caddy

install-if-needed g++
install-if-needed make
install-if-needed build-essential

if [ -z "$(ls -A $HOME/.ssh/*id_* 2>/dev/null)" ]; then
    __system "Generate ssh key"
    ssh-keygen
else
    __system "[OK] ssh key exists under $HOME/.ssh"
fi


echo ""
__system "Make sure you've installed zsh-completions"
__system "https://github.com/zsh-users/zsh-completions"
