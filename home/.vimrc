if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
source ~/.vim/setting/package.vim
call plug#end()

source ~/.vim/setting/option.vim
source ~/.vim/setting/key.vim

if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
