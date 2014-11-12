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
if has("mouse")
   set mouse=a
endif

" Maximize gvim window
set lines=999
set columns=999

" Highlight column 80 as well as 120 and onward
let &colorcolumn="80,".join(range(120,999),",")

if filereadable(expand("/.gvimrc.local"))
    source ~/.gvimrc.local
endif
