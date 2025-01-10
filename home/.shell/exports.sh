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

export LC_ALL="en_US.UTF-8"

export EDITOR=vi
