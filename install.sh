#!/usr/bin/env bash

set -e

# TODO: dependencies should be installed first such as git, zsh, vim, tmux, nvm, etc..

YELLOW="\033[33m"
RESET="\033[0m"

export PATH=/opt/homebrew/bin:$PATH # should prefer M1 homebrew over intel homebrew

# install oh-my-zsh
if [ ! -d $HOME/.oh-my-zsh ]; then
  if [ ! -f ./install-oh-my-zsh.sh ]; then
      wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O install-oh-my-zsh.sh
  fi

  # this script doesn't do an installation if it's already installed
  sh ./install-oh-my-zsh.sh
fi

# Use zsh if needed
TARGET_SHELL=zsh
if [ $SHELL != "/bin/$TARGET_SHELL" ]
then
    echo -e $YELLOW"You're now using $SHELL as a default. Trying to change it to $TARGET_SHELL."$RESET
    chsh -s /bin/$TARGET_SHELL
    echo -e $YELLOW"You may reopen the session or logout and login again to see the change."$RESET
fi

git config --global --edit
git_username="`git config --global user.name`"
git_email="`git config --global user.email`"

# sync files

echo -e $YELLOW"Show diff"$RESET
diff -r home $HOME | grep -v "Only in $HOME"

echo -e $YELLOW"Dry run.."$RESET
rsync -anP home/ ~

echo ''
read -n 1 -p "Do you want to proceed? (yN)? " yn
echo -e $RESET
case $yn in
      y ) ;;
      * ) exit 0 ;;
esac

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

mkdir -p ~/bin
mkdir -p ~/.local/bin
touch ~/.zshrc.local

~/.shell/scripts/check-terminal-color

# https://apple.stackexchange.com/a/31955
defaults write -g ApplePressAndHoldEnabled -bool false
