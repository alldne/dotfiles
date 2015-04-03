# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# for shopt options, 'man bash' and find 'The list of shopt options'
shopt -s histappend
shopt -s checkwinsize
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# 256 color support
# http://askubuntu.com/a/379472
if [ "$COLORTERM" = "gnome-terminal" ] || [ "$COLORTERM" = "xfce4-terminal" ]; then
    export TERM=xterm-256color
elif [ "$COLORTERM" = "rxvt-xpm" ]; then
    export TERM=rxvt-256color
fi

source ~/.shell/look
source ~/.shell/aliases
source ~/.shell/exports

if [ -f ~/.nvm/nvm.sh ]; then
    source ~/.nvm/nvm.sh
fi

if [ -f ~/.bashrc.local ]; then
    source ~/.bashrc.local
fi
