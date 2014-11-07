" Use visual bell instead of beeping
set visualbell

" No toolbar
set guioptions-=T

" No right-hand scrollbar
set guioptions-=r

" No left-hand scrollbar
set guioptions-=L

" Use console dialogs
" set guioptions+=c

" Turn off the blinking cursor in normal mode
set gcr=n:blinkon0

" Enable the mouse in all modes
set mouse=a

if filereadable(expand("/.gvimrc.local"))
    source ~/.gvimrc.local
endif

