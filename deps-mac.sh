#!/usr/bin/env bash

if [ ! -s /Applications/Xcode.app ]
then
  echo "Install Xcode first"
  exit 1
fi

# check if git is installed (included in xcode command line tool)
which -s git
if [[ $? != 0 ]]; then
    echo "Install git first (xcode command line tool)"
    exit 1
fi

# install brew
which -s brew
if [[ $? != 0 ]]; then
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

brew install wget
brew install zsh zsh-completions
brew install tmux
brew install vim
