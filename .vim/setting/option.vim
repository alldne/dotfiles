"------------------------------------------------------------------------------
" Standard stuff
"------------------------------------------------------------------------------
set backspace=indent,eol,start  " Allow backspacing over everything in insert mode.
set encoding=utf-8              " Set default encoding to UTF-8.
set esckeys                     " Cursor keys in insert mode.
set fencs=ucs-bom,utf-8,cp949   " Add cp949 to the character encodings for the files
                                " written in the windows.
set fileformats=unix            " Show ^M for a carraige return.
set history=100                 " Number of lines of command line history.
set hlsearch                    " Highlight search matches.
set incsearch                   " Incremental search.
set laststatus=2                " Always show a statusline.
set nobackup                    " Do not keep a backup file.
set noerrorbells                " No beeps.
set nostartofline               " Do not jump to first character with page commands,
set number                      " Show line number.
set ruler                       " Show the line and column numbers of the cursor.
set scrolloff=5                 " Keep a context when scrolling.
set showcmd                     " Show (partial) command in status line.
set showmatch                   " Show matching brackets.
set showmode                    " Show current mode.
set tabpagemax=50               " Extend maximum of tab page to 50 (default 10).
set tags=tags;/                 " http://stackoverflow.com/a/5019111
set textwidth=0                 " Don't wrap words by default.
set ttyfast                     " We have a fast terminal connection.
set ttyscroll=0                 " Turn off scrolling (this is faster).
set undolevels=200              " Number of undo levels.
set viminfo='20,\"50            " Read/write a .viminfo file, don't store more than
                                " 50 lines of registers.
set wildmode=list:longest       " Path/file expansion in colon-mode.
set wildchar=<TAB>              "

"------------------------------------------------------------------------------
" Indentation
"------------------------------------------------------------------------------
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set smartindent
" set copyindent

"------------------------------------------------------------------------------
" Plugin dependent option
"------------------------------------------------------------------------------
let EnhCommentifyPretty='y'     " Put a whitespace between the comment character and
                                " the original line.
let g:rainbow_active=1          " Activate rainbow.
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store'

"------------------------------------------------------------------------------
" Color
"------------------------------------------------------------------------------
colorscheme gruvbox
set background=dark
set t_Co=256
hi Comment cterm=None
