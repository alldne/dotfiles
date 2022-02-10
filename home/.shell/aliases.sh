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

# https://unix.stackexchange.com/a/479990
alias -g ___='"$(eval "$(fc -ln -1)" | tail -n 1)"'

alias save='git commit -a -m "saved `date`"'

alias be="bundle exec"

# https://egeek.me/2020/03/01/upgrading-xcode-and-xvim/
alias xcodesign="sudo codesign -f -s XcodeSigner /Applications/Xcode.app && sudo codesign -v -s XcodeSigner -f --timestamp=none /Applications/Xcode.app/Contents/Developer/usr/bin/xcodebuild"

alias deletemerged='git branch --merged | egrep -v "(^\*|master|release)" | xargs git branch -D'

alias ibrew='arch -x86_64 /usr/local/bin/brew'

alias kblog='kubectl logs -f -n'
alias kbpod='kubectl get pod -n'
alias kbdeploy='kubectl get pod -n'
