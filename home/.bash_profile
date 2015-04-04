# __git_ps1
if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

# git completion
if [ -f ~/.git-completion.bash ]; then
   . ~/.git-completion.bash
fi

source ~/.bashrc
