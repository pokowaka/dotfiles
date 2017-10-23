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
call plug#begin()
Plug 'Yggdroot/indentLine'
Plug 'bronson/vim-trailing-whitespace'
Plug 'easymotion/vim-easymotion'
Plug 'flazz/vim-colorschemes'
Plug 'godlygeek/tabular'
Plug 'junegunn/fzf',  { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'mileszs/ack.vim'
Plug 'pokowaka/vim-plugin-random-colorscheme-picker'
Plug 'qpkorr/vim-bufkill'
Plug 'scrooloose/nerdtree',  { 'on':  'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rhysd/vim-clang-format'
call plug#end()

" Disable syntax highlighting for large files
autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax clear | endif


let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'


set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set number

" Lets make fzf easy to use
nnoremap <leader>p :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :GFiles<CR>

" Let's use ripgrep

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

autocmd BufNewFile,BufRead *.shi set syntax=sh
set grepprg=rg\ --vimgrep
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//

" Turn plugins on.
filetype plugin indent on
syntax enable
