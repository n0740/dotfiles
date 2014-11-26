set nocompatible
filetype off


"==============================================================================
" Vundle settings
"==============================================================================

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" NERDTree file manager
Plugin 'scrooloose/nerdtree'

" A Git wrapper so awesome, it should be illegal
Plugin 'tpope/vim-fugitive'

" Plugin for The Silver Searcher (ag)
Plugin 'rking/ag.vim'

" Lean & mean status/tabline for vim that's light as air
" Install fonts before: https://github.com/Lokaltog/powerline-fonts.git
Plugin 'bling/vim-airline'

" Full path fuzzy file, buffer, mru, tag, finder
Plugin 'kien/ctrlp.vim'

" Python-mode. PyLint, Rope, Pydoc, breakpoints from box.
Plugin 'klen/python-mode'

" Display tags in a separate window
Plugin 'majutsushi/tagbar'

call vundle#end()

filetype on
filetype plugin on

" Enable file type detection and do language-dependent indenting.
filetype plugin indent on


"==============================================================================
" General settings
"==============================================================================

" Character encoding used inside Vim, necessary to show Unicode glyphs
set encoding=utf-8

" Number of spaces that a <Tab> in the file counts for.
set tabstop=4

" Number of spaces to use for each step of (auto)indent.
set shiftwidth=4

" Use the appropriate number of spaces to insert a <Tab>.
" Spaces are used in indents with the '>' and '<' commands
" and when 'autoindent' is on. To insert a real tab when
" 'expandtab' is on, use CTRL-V <Tab>.
set expandtab

" When on, a <Tab> in front of a line inserts blanks
" according to 'shiftwidth'. 'tabstop' is used in other
" places. A <BS> will delete a 'shiftwidth' worth of space
" at the start of the line.
set smarttab

" Show (partial) command in status line.
set showcmd

" Show line numbers.
set number

" When a bracket is inserted, briefly jump to the matching
" one. The jump is only done if the match can be seen on the
" screen. The time to show the match can be set with
" 'matchtime'.
set showmatch

" When there is a previous search pattern, highlight all its matches.
set hlsearch

" While typing a search command, show immediately where the so far typed
" pattern matches.
set incsearch

" Ignore case in search patterns.
set ignorecase

" Override the 'ignorecase' option if the search pattern
" contains upper case characters.
set smartcase

" Influences the working of <BS>, <Del>, CTRL-W
" and CTRL-U in Insert mode. This is a list of items,
" separated by commas. Each item allows a way to backspace
" over something.
set backspace=2

" Copy indent from current line when starting a new line
set autoindent

" Maximum width of text that is being inserted. A longer
" line will be broken after white space to get this width.
" set textwidth=79

" This is a sequence of letters which describes how
" automatic formatting is to be done.
"
" letter    meaning when present in 'formatoptions'
" ------    ---------------------------------------
" c         Auto-wrap comments using textwidth, inserting
"           the current comment leader automatically.
" q         Allow formatting of comments with "gq".
" r         Automatically insert the current comment leader
"           after hitting <Enter> in Insert mode.
" t         Auto-wrap text using textwidth (does not apply
"           to comments)
" set formatoptions=c,q,r,t

" When set to "dark", Vim will try to use colors that look good on
" a dark background. When set to "light", Vim will
" try to use colors that look good on a light background.
set background=dark

color desert

" Switch syntax highlighting on
syntax on

" Highlight current line
set cursorline
highlight CursorLine cterm=underline guibg=Grey40

" Highlight column 80
set colorcolumn=80
highlight ColorColumn ctermbg=DarkRed guibg=Grey23

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Do not use arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Display extra whitespace
" set list listchars=tab:▸\ ,eol:¬,trail:·
set list listchars=tab:▸\ ,trail:·

" Always display the status line
set laststatus=2

" Show the line and column number of the cursor position, separated by a comma.
set ruler

" Popup a window showing all matching command above command line when
" autocomplete.
set wildmenu

set wildmode=list:longest,full

" No swap files, use version control instead
set noswapfile

" Open new split panes to right and bottom, which feels more natural
set splitright
set splitbelow

" Use ; for : and vice versa in normal mode
nnoremap ; :
nnoremap : ;

" Use "jj" as of Esc
" Use "jk" as of Esc
inoremap jk <esc>

" Move vertically by visual line (for very long lines)
nnoremap j gj
nnoremap k gk

" Automatically reload file that has changed outside of Vim
set autoread

" Highlight last inserted text
nnoremap gV `[v`]

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Emacs style jump to begin/end of line in insert mode
imap <C-e> <C-o>A
imap <C-a> <C-o>I

" Allow line editing like Emacs in command-line mode
cnoremap <C-A> <Home>
cnoremap <C-B> <Left>
cnoremap <C-E> <End>
cnoremap <C-F> <Right>

" Set global list of ignored files
set wildignore+=.git,*.o,*.pyc,.DS_Store

" Work with the system clipboard
set clipboard=unnamed

" Toggle between modes almost instantly
set ttimeoutlen=0

"
" Leader Shortcuts
"
let mapleader=","

nnoremap <leader>w :NERDTreeToggle<CR>

" Turn off search highlight
nnoremap <silent> <leader><space> :nohlsearch<CR>

" Edit/load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Open ag.vim
nnoremap <leader>a :Ag<space>

" Others
" autocmd vimenter * if !argc() | NERDTree | endif
let g:NERDTreeWinPos = "left"
let NERDTreeIgnore = ['\.pyc$', 'egg', 'egg-info/', 'dist']

" How CtrlP sets its local working directory when starts
let g:ctrlp_working_path_mode = 'a'

" For nice looking symbols
let g:airline_powerline_fonts = 1

" Automatically displays all buffers when there's only one tab open
" let g:airline#extensions#tabline#enabled = 1

let g:pymode_folding = 0
let g:pymode_rope = 0
let g:pymode_rope_lookup_project = 0

" Local config
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
