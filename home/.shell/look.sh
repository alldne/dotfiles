if [ $SHELL = "/bin/bash" ]; then
    case "$TERM" in
    xterm*|rxvt*|screen*)
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
fi

if [ -n "`~/.shell/scripts/is_mac`" ]; then
    export GREP_OPTIONS='--color=auto'
    export GREP_COLOR='1;35;40'

    # color directory
    export CLICOLOR=1
    export LSCOLORS=ExFxCxDxBxegedabagacad
else
    # enable color support of ls and also add handy aliases
    if [ -x /usr/bin/dircolors ]; then
        test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
        alias ls='ls --color=auto'
        alias grep='grep --color=auto'
        alias fgrep='fgrep --color=auto'
        alias egrep='egrep --color=auto'
    fi
fi

# change color palette for gruvbox (vim color scheme)
source ~/.shell/scripts/gruvbox_256palette.sh
