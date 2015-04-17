" set guifont=Source\ Code\ Pro:h13
set guifont=ProFont:h12
let g:indentLine_color_tty_light = 7
let g:indentLine_char = '|'
set transparency=10
set linespace=2
set lines=999 columns=999

set macmeta
set bg=dark
color base16-tomorrow

if has("gui_macvim")
" In MacVim, you can have multiple tabs open. This mapping makes Ctrl-Tab
" " switch between them, like browser tabs. Ctrl-Shift-Tab goes the other
" way.
noremap <C-Tab> :tabnext<CR>
noremap <C-S-Tab> :tabprev<CR>
"
"" Switch to specific tab numbers with Command-number
noremap <D-1> :tabn 1<CR>
noremap <D-2> :tabn 2<CR>
noremap <D-3> :tabn 3<CR>
noremap <D-4> :tabn 4<CR>
noremap <D-5> :tabn 5<CR>
noremap <D-6> :tabn 6<CR>
noremap <D-7> :tabn 7<CR>
noremap <D-8> :tabn 8<CR>
noremap <D-9> :tabn 9<CR>
" Command-0 goes to the last tab
" noremap <D-0> :tablast<CR>
endif
"

set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems
