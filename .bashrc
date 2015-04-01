# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

case "$TERM" in
xterm*|rxvt*)
     PS1="\[\033[01;34m\]["
     PS1="${PS1}\[\033[01;36m\]\t"
     PS1="${PS1}\[\033[01;34m\]]"
     PS1="${PS1}\[\033[01;33m\]:"
     PS1="${PS1}\[\033[01;35m\]\W"
     PS1="${PS1}\[\033[01;33m\]\$(__git_ps1 '(%s)')$DEFAULT"
     PS1="${PS1}\[\033[01;31m\]\$ "
     PS1="${PS1}\[\033[00;37m\]"
     PS1="${PS1}\[\033[0m\]"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

source ~/.shell/aliases
source ~/.shell/exports

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

if [ -f ~/.nvm/nvm.sh ]; then
    source ~/.nvm/nvm.sh
fi

