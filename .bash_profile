# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

. ~/.shell/function
. ~/.shell/alias
. ~/.shell/export

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

if [ -f ~/.nvm/nvm.sh ]; then
  . ~/.nvm/nvm.sh
fi

# git completion
if [ -f ~/.shell/script/.git-completion.bash ]; then
  . ~/.shell/script/.git-completion.bash
fi

if [ -f ~/.shell/script/.git-prompt.sh ]; then
  . ~/.shell/script/.git-prompt.sh
fi
