#! /usr/bin/env bash

YELLOW="\033[33m"
RESET="\033[0m"

if [ $SHELL != "/bin/bash" ]
then
    echo -e $YELLOW"You're now using $SHELL as a default. Trying to change it to bash."$RESET
    chsh -s /bin/bash
    echo -e $YELLOW"You should reopen the session to see the change."$RESET
fi

git_username="`git config --global user.name`"
git_email="`git config --global user.email`"

# sync files
rsync -aP home/ ~

if [ -n "`~/.shell/scripts/is_mac`" ]; then
    rsync -aP osx/ ~
fi

# git config
if [ -z "$git_username" ]; then
    read -r -p "git user name: " git_username
fi

if [ -z "$git_email" ]; then
    read -p "git user email: " git_email
fi

git config --global user.name "$git_username"
git config --global user.email "$git_email"

~/.shell/scripts/check-terminal-color
