set nocompatible                " Avoid legacy sillyness.
set backspace=indent,eol,start  " Make backspace sane.
set cursorline                  " Highlight the current line.
set hidden                      " Allow buffer backgrounding.
set scrolloff=3                 " Add top/bottom scroll margins.
set ttyfast lazyredraw          " Make drawing faster.
set visualbell                  " Don't make noise.
set backup                      " Be safe.
set clipboard=unnamed           " Allow vim to use the X clipboard.
set formatoptions=cqn1j         " See :help fo-table.
set history=1000                " Remember a lot.
set incsearch                   " Search incrementally as I type.
set showcmd                     " Show the last command.
set showmatch                   " When a bracket is typed show its match.
set smartcase                   " Be smart about when case sensitivity matters.
set smarttab                    " Only respect shiftwidth for code indents.
set splitbelow splitright       " Windows are created in the direction I read.
set undofile                    " Saves undo history across sessions.
set viewoptions=cursor,folds    " Save cursor position and folds.

" Make hidden characters look nice when shown.
set listchars=tab:»·,trail:·,eol:¶,extends:»,precedes:«

" use jk to escape
inoremap jk <esc>

" pokowaka@-specific plugins.
"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Bundle "https://github.com/Yggdroot/indentLine"
Bundle "https://github.com/bronson/vim-trailing-whitespace"
Bundle "https://github.com/easymotion/vim-easymotion"
Bundle "https://github.com/flazz/vim-colorschemes"
Bundle "https://github.com/godlygeek/tabular"
Bundle "https://github.com/majutsushi/tagbar"
Bundle "https://github.com/mileszs/ack.vim"
Bundle "https://github.com/pokowaka/vim-plugin-random-colorscheme-picker.git"
Bundle "https://github.com/qpkorr/vim-bufkill"
Bundle "https://github.com/rking/ag.vim"
Bundle "https://github.com/scrooloose/nerdtree"
Bundle "https://github.com/scrooloose/syntastic"
Bundle "https://github.com/tpope/vim-commentary"
Bundle "https://github.com/junegunn/fzf.vim"
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
call vundle#end()

" Disable syntax highlighting for large files
autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif

" Setup the ag hack:w
"
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev aG Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack

let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'


set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set number

autocmd BufNewFile,BufRead *.shi set syntax=sh

" Turn plugins on.
filetype plugin indent on
syntax enable
