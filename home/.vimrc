" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible " Be iMproved
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

source ~/.vim/setting/package.vim

call neobundle#end()

filetype plugin indent on
syntax on

NeoBundleCheck

source ~/.vim/setting/option.vim
source ~/.vim/setting/key.vim

if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
