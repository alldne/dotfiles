#!/usr/bin/env bash

if [ -n `~/.shell/scripts/is_mac` ]; then
  script=~/.vim/bundle/gruvbox/gruvbox_256palette_osx.sh
else
  script=~/.vim/bundle/gruvbox/gruvbox_256palette.sh
fi

if [ -f $script ]; then
  $script
fi
