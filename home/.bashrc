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

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ "${TERM%%-*}" != "screen" ]; then
    # 256 color support
    # http://askubuntu.com/a/379472
    if [ "$COLORTERM" = "gnome-terminal" ] || [ "$COLORTERM" = "xfce4-terminal" ]; then
        export TERM=xterm-256color
    elif [ "$COLORTERM" = "rxvt-xpm" ]; then
        export TERM=rxvt-256color
    fi
fi

function source-if-exists {
    [[ -s $1 ]] && source $1
}

source ~/.shell/look
source ~/.shell/aliases
source ~/.shell/exports

source-if-exists ~/.nvm/nvm.sh
source-if-exists ~/.rvm/scripts/rvm
source-if-exists ~/.bashrc.local
