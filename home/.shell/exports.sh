export PATH=~/bin:$PATH
export PATH=$PATH:~/.shell/scripts

export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/Applications/Visual\ Studio\ Code.app/Contents/Resources/app/bin
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:$PATH" # For m1
export PATH=$PATH:$HOME/.cargo/bin

if [ -d "/opt/homebrew/opt/ruby/bin" ]; then
  export PATH=/opt/homebrew/opt/ruby/bin:$PATH
  export PATH=`gem environment gemdir`/bin:$PATH
fi

if [ -d "$HOME/.nvm" ]; then
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

if [ -d "$HOME/.codeium/windsurf/bin" ]; then
  export PATH="$PATH:$HOME/.codeium/windsurf/bin"
fi

export LC_ALL="en_US.UTF-8"

export EDITOR=vi
