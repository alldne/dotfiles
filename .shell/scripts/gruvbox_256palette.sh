#!/usr/bin/env bash

if [[ "$OSTYPE" == "darwin"* ]]; then
  # Mac OSX
  # http://stackoverflow.com/a/8597411
  script=~/.vim/bundle/gruvbox/gruvbox_256palette_osx.sh
else
  script=~/.vim/bundle/gruvbox/gruvbox_256palette.sh
fi

if [ -f $script ]; then
  $script
fi
