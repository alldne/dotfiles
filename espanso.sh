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

CONFIG=`espanso path config`
echo $CONFIG

__system "Dry run.."

rsync -anP home/.espanso/ $CONFIG

echo ''
read -n 1 -p "Do you want to proceed? (yN)? " yn
echo -e $RESET
case $yn in
      y ) ;;
      * ) exit 0 ;;
esac

rsync -aP home/.espanso/ $CONFIG
EDITOR=vim espanso edit
