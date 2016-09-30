# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands. Use like so:
#   sleep 10; alert
if [ -n "`~/.shell/scripts/is_mac`" ]; then
    function alert { \
        osascript -e "tell app \"System Events\" to display dialog \"$1\"" \
    }
else
    alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
fi

alias subl='sublime_text'

alias f='find . -name '

alias ..='cd ..'

alias tt='tmux attach -t'

# note: only working for `ack`, not `ack-grep`.
alias ackp='ack --pager="less -R"'
