#!/usr/bin/env bash

set -e

# TODO: dependencies should be installed first such as git, zsh, vim, tmux, nvm, etc..

YELLOW="\033[33m"
RESET="\033[0m"

TARGET_SHELL=zsh
if [ $SHELL != "/bin/$TARGET_SHELL" ]
then
    echo -e $YELLOW"You're now using $SHELL as a default. Trying to change it to $TARGET_SHELL."$RESET
    if [ ! -f ./install-oh-my-zsh.sh ]; then
        wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O install-oh-my-zsh.sh
    fi

    # this script doesn't do an installation if it's already installed
    sh ./install-oh-my-zsh.sh
    chsh -s /bin/$TARGET_SHELL
    echo -e $YELLOW"You may reopen the session or logout and login again to see the change."$RESET
fi

git_username="`git config --global user.name`"
git_email="`git config --global user.email`"

# sync files
rsync -aP home/ ~

# git config
if [ -z "$git_username" ]; then
    read -r -p "git user name: " git_username
fi

if [ -z "$git_email" ]; then
    read -p "git user email: " git_email
fi

git config --global user.name "$git_username"
git config --global user.email "$git_email"

echo -e $YELLOW"Inject gitconfig-override at the end of the .gitconfig.."$RESET
echo "[include]"                      >> ~/.gitconfig
echo "  path = ~/.gitconfig-override" >> ~/.gitconfig

~/.shell/scripts/check-terminal-color
