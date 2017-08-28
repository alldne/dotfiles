source ~/.shell/aliases.sh
source ~/.shell/exports.sh
source ~/.shell/look.sh
source ~/.shell/functions.sh

source-if-exists ~/.nvm/nvm.sh
source-if-exists ~/.rvm/scripts/rvm
source-if-exists ~/.zshrc.local

# https://www.reddit.com/r/zsh/comments/2n2ikk/in_bash_when_i_run_git_log_the_output_is/
export LESS=-FRSX
