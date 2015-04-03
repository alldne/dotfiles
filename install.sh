#! /usr/bin/env bash

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

# warn
RED="\e[31m"
RESET="\e[0m"
if [ `tput colors` -ne 256 ]; then
    echo -e $RED"This terminal does not support 256 color. 'tput colors' for more detail"$RESET
fi
