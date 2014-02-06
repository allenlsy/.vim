set t_Co=256
call pathogen#infect()

syntax on
colorscheme kellys
set number
set expandtab
set tabstop=4
set shiftwidth=4
set autoindent
set bg=dark
set pastetoggle=<F2>
set showmode

set fileencodings=utf-8
set encoding=utf-8

filetype plugin indent on

"solve NERDTree with zsh
let g:NERDTreeDirArrows=0

filetype plugin on
set omnifunc=syntaxcomplete#Complete
" set tags+=/Users/allenlsy/.vim/tags/usr_include
" set tags+=/Users/allenlsy/.vim/tags/cpp

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" 自动关闭补全窗口
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
set pumheight=15

" Disable auto popup, use <Tab> to autocomplete
" let g:clang_complete_auto = 0
" Show clang errors in the quickfix window
let g:clang_complete_copen = 1

let g:EasyMotion_leader_key = '<Leader>'

set helplang=cn

set hlsearch

set cursorline
:highlight CursorColumn cterm=NONE ctermbg=darkgray ctermfg=white guibg=gray guifg=white
set cursorcolumn

" augroup Cursor
"   au!
"   au VimEnter,WinEnter,BufWinEnter * setlocal cursorcolumn
"   au WinLeave * setlocal nocursorcolumn
"   au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
"   au WinLeave * setlocal nocursorline
" augroup END

" vundle configuration

set nocompatible

let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" indent guide
" let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

" auto create new parent folder after creating new file
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END

au BufNewFile,BufRead *.hbs set filetype=html " handlebar template as html
au BufNewFile,BufRead *.scss set filetype=css " enable rainbow mode in scss file
au FileType coffee :setlocal sw=2 ts=2 sts=2 " tab size=2 for coffeescript


let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_smart_startup_focus=2

let g:cssColorVimDoNotMessMyUpdatetime = 10

" Autoload RaibowParentheses. For performance reason, I disabled it by default
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
" au Syntax * RainbowParenthesesLoadChevrons

let s:clang_library_path='/Library/Developer/CommandLineTools/usr/lib'
if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif

" lightline config
let g:powerline_symbols = 'fancy'
let g:lightline = {
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

" tagbar
nmap <F7> :TagbarToggle<CR>

" gundo
nnoremap <F5> :GundoToggle<CR>
