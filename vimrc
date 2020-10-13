set nocompatible

call plug#begin('~/.vim/bundle')

" Adds file type icons to Vim plugins
" Plug 'ryanoasis/vim-devicons'

" Mappings that boost vim command line mode
Plug 'bruno-/vim-husk'

" Let you enter command mode commands using Russian keyboard layout
Plug 'powerman/vim-plugin-ruscmd'

" NERDTree file manager
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }

Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }

" A simple way to create, edit and save files and directories
Plug 'duggiefresh/vim-easydir'

" A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" Shows the message of the last commit in a 'popup window'
Plug 'rhysd/git-messenger.vim'

" Plug for The Silver Searcher (ag)
Plug 'rking/ag.vim'

" Lean & mean status/tabline for vim that's light as air
" Install fonts before: https://github.com/Lokaltog/powerline-fonts.git
Plug 'bling/vim-airline'

" Allows quickly and easily switch between buffers
Plug 'corntrace/bufexplorer'

" Full path fuzzy file, buffer, mru, tag, finder
Plug 'kien/ctrlp.vim'

" Simple function navigator for ctrlp.vim
Plug 'tacahiroy/ctrlp-funky'

" Display tags in a separate window
Plug 'majutsushi/tagbar'

" Vim motion on speed!
Plug 'Lokaltog/vim-easymotion'

" Toggle between relative and absolute line numbers automatically
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Comment stuff out. Then uncomment it later.
Plug 'tpope/vim-commentary'

" Provides several pairs of bracket maps
Plug 'tpope/vim-unimpaired'

" It's  all about "surroundings": parentheses, brackets, quotes, XML tags
" and more
Plug 'tpope/vim-surround'

" Shows a git diff in the 'gutter' (sign column). It shows whether each line
" has been added, modified, and where lines have been removed.
" You can also stage and revert individual hunks.
Plug 'airblade/vim-gitgutter'

" A better JSON support
Plug 'elzr/vim-json', { 'for': 'json' }

" Go (golang) support
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'ekalinin/Dockerfile.vim', { 'for' : 'Dockerfile' }

Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
Plug 'juliosueiras/vim-terraform-completion', { 'for': 'terraform' }

" Plug 'martinda/Jenkinsfile-vim-syntax', { 'for': 'jenkinsfile' }

Plug 'qpkorr/vim-bufkill'

" Plug 'w0rp/ale', { 'for': 'python' }

" Plug 'sickill/vim-monokai'
Plug 'cocopon/iceberg.vim'

call plug#end()


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

" Show the line number relative to the line with the cursor
set relativenumber

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

" Enable folding
set foldmethod=indent
set foldlevel=99

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


" Switch syntax highlighting on
syntax on
" syntax enable


" Color scheme
set termguicolors
color desert
" color monokai
" color iceberg

set background=dark
" set background=light

" Highlight current line
set cursorline
highlight CursorLine cterm=None ctermbg=233 guibg=Grey13

" Highlight column 80
set colorcolumn=80
highlight ColorColumn ctermbg=233 guibg=Grey13

highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

" Make sure that unsaved buffers that are to be put in the background are
" allowed to go in there (ie. the "must save first" error doesn't come up)
set hidden

" Make backspace behave in a sane manner.
set backspace=indent,eol,start

" Do not use arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Display extra whitespace
set list
" set listchars=tab:▸\ ,eol:¬,trail:·
set listchars=tab:▸\ ,trail:·
" set listchars=tab:▒░,trail:▓,nbsp:░
" set showbreak=↪

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

" Move vertically by visual line (for very long lines)
nnoremap <silent>j gj
nnoremap <silent>k gk

" Use as Esc in insert mode
inoremap jj <Esc>
inoremap jk <Esc>

" Go to just before the first non-blank text of the line
inoremap ii <Esc>I

" Go to the end of the line
inoremap aa <Esc>A

" Begin a new line above the cursor and insert text
inoremap OO <Esc>O

" Change what is on the right of the cursor
inoremap CC <Esc>C

" Change the whole line
inoremap SS <Esc>S

" Delete the current line
inoremap DD <Esc>dd

" Undo
inoremap UU <Esc>u

" Automatically reload file that has changed outside of Vim
set autoread

" Highlight last inserted text
nnoremap gV `[v`]

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Disable Ex mode
map Q <nop>
nnoremap Q <nop>

nnoremap <silent><F1> :NERDTreeFind<CR>
nnoremap <silent><F2> :NERDTreeToggle<CR>
nnoremap <silent><F3> :TagbarToggle<CR>
nnoremap <silent><F4> :GitGutterToggle<CR>

" Enable TAB indent and SHIFT-TAB unindent
vnoremap <silent> <TAB> >gv
vnoremap <silent> <S-TAB> <gv

" Enable folding with the spacebar
nnoremap <space> za

nnoremap <silent> <C-n> :set relativenumber!<cr>

" Set global list of ignored files
set wildignore+=.git,*.o,*.pyc,.DS_Store,*.egg-info

" Toggle between modes almost instantly
set ttimeoutlen=0

" Don't complete from tags
set complete-=t

set pastetoggle=<F12>

set tags=./tags,tags,$VIRTUAL_ENV/tags,$SPARK_HOME/python/pyspark/tags


"
" Leader shortcuts
"
let mapleader=","

" Turn off search highlight
nnoremap <silent><leader><space> :nohlsearch<CR>

" Edit/load vimrc bindings
nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

" Open ag.vim
nnoremap <leader>a :Ag<space>

nnoremap <leader>t :Ag \(FIXME\)\\|\(TODO\)<cr>

" Jump to anywhere with only "s{char}{target}"
nmap s <Plug>(easymotion-s)
nmap t <Plug>(easymotion-t2)

" Line motions
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)

" Switch between opened buffers
nnoremap <leader>bb :CtrlPBuffer<CR>

" Switch between most recently used buffers
nnoremap <leader>bm :CtrlPMRU<CR>

" Search for a tag and jump to the definition
" nnoremap <leader>t :CtrlPTag<CR>

" Switch between functions in file
nnoremap <leader>f :CtrlPFunky<CR>

" Narrow the list down with a word under cursor
nnoremap <leader>F :execute 'CtrlPFunky ' . expand('<cword>')<CR>

nnoremap <leader>\ :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <leader>] :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <leader>} :sp <CR>:exec("tag ".expand("<cword>"))<CR>

" Close current budder
nnoremap <leader>q :bp <BAR> bd #<CR>

" cd to the directory containing the file in the buffer
nnoremap <silent> <leader>cd :lcd %:h<CR>

" Look up words in Dictionary.app
nnoremap <silent> <leader>di :!open dict://<cword><CR><CR>

" Create tags file in current directory
nnoremap <silent> <leader>R :!ctags -R .<CR><CR>
" nnoremap <silent> <leader>R :!"[[ -d $VIRTUAL_ENV ]] && ctags -R -f ./tags . $VIRTUAL_ENV/lib/python*/site-packages || ctags -R ."<CR><CR>

" Copy/paste from system clipboard
nmap <silent> <leader>y "*Y
vmap <silent> <leader>y "*y
nmap <silent> <leader>p "*p
nmap <silent> <leader>P "*P

" nmap <silent> <F7> <Plug>(ale_previous_wrap)
" nmap <silent> <F8> <Plug>(ale_toggle_buffer)
" nmap <silent> <F9> <Plug>(ale_next_wrap)

nnoremap <silent> <leader>l :set list!<cr>

"
" Plugin's settings
"

let g:NERDTreeWinPos = "left"
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '.*\.egg-info', 'dist', '\.o$']
let NERDTreeChDirMode = 0

" How CtrlP sets its local working directory when starts
let g:ctrlp_working_path_mode = 'a'

let g:ctrlp_funky_syntax_highlight = 1

" For nice looking symbols
let g:airline_powerline_fonts = 1

" Don't show virtualenv name
let g:airline#extensions#virtualenv#enabled = 0

" Dont' show gitgutter data
let airline#extensions#hunks#enabled = 0

" Show gitgutter data only if changes exist
let airline#extensions#hunks#non_zero_only = 1

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %code: %%s'
" let g:ale_set_quickfix = 1
" let g:airline#extensions#ale#enabled = 1

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1

" Keep cursor colum when JK motion
let g:EasyMotion_startofline = 0

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Tags sorted according to their order in the source file
let g:tagbar_sort = 0
let g:tagbar_type_make = {
            \ 'kinds':[
                \ 'm:macros',
                \ 't:targets'
            \ ]
\}
" let g:tagbar_type_terraform = {
"             \ 'ctagstype' : 'terraform',
"             \ 'kinds' : [
"             \ 'r:resources',
"             \ 'm:modules',
"             \ 'o:outputs',
"             \ 'v:variables',
"             \ 'f:tfvars',
"             \ 'd:data'
"             \ ],
"             \ 'sort' : 0
"             \ }

" The Silver Searcher
if executable('ag')
    " Use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Grep word under cursor
    nnoremap <leader>w :Ag<space> "\b<C-R><C-W>\b"<CR>:cw<CR>

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " ag is fast enough that CtrlP doesn't need to cache
    let g:ctrlp_use_caching = 0
else
    " Grep word under cursor
    nnoremap <leader>w :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
endif

autocmd BufRead,BufNewFile *.conf set filetype=yaml

" Check if any buffers were changed outside of Vim.
autocmd CursorHold * checktime

" Delete whitespaces at the end of lines
autocmd BufWritePre * :%s/\s\+$//e

autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType crontab setlocal bkc=yes

" The Jenkinsfile
autocmd BufNewFile,BufRead *.Jenkinsfile set ft=jenkinsfile
autocmd BufNewFile,BufRead Jenkinsfile set ft=jenkinsfile
autocmd BufNewFile,BufRead Jenkinsfile* set ft=jenkinsfile

" Local config
if filereadable(expand("~/.vimrc.local"))
    source ~/.vimrc.local
endif
