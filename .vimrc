set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
set backspace=indent,eol,start
set runtimepath+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" Plugins
" ===============
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
" Plugin 'marijnh/tern_for_vim'
Plugin 'tpope/vim-bundler'
Plugin 'kchmck/vim-coffee-script'
Plugin 'xolox/vim-colorscheme-switcher'
Plugin 'ap/vim-css-color'
" Plugin 'gorodinskiy/vim-coloresque'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'groenewege/vim-less'
Plugin 'rcmdnk/vim-markdown'
Plugin 'joker1007/vim-markdown-quote-syntax'
Plugin 'xolox/vim-misc'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'myhere/vim-nodejs-complete'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tristen/vim-sparkup'
Plugin 'tpope/vim-surround'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-cucumber'
Plugin 'Yggdroot/indentLine'
Plugin 'fatih/vim-go'
Plugin 'Blackrush/vim-gocode'
Plugin 'Shougo/neocomplcache.vim'
" Plugin 'AutoComplPop'
Plugin 'jimenezrick/vimerl'
Plugin 'chriskempson/base16-vim'
Plugin 'msanders/snipmate.vim'
" Plugin 'MarcWeber/vim-addon-mw-utils'
" Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'
" Plugin 'honza/vim-snippets'
Plugin 'tfnico/vim-gradle'
Plugin 'vim-jp/vim-cpp'
Plugin 'octol/vim-cpp-enhanced-highlight'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Editor config
" =============
colorscheme Tomorrow-Night-Bright
" set shell=/bin/sh
set shell=/bin/zsh
set t_Co=256
set number
set expandtab
" set tabstop=2
" set shiftwidth=2
set autoindent
set bg=dark
set pastetoggle=<F2>
set showmode
set smartcase
set fileencodings=utf-8
set encoding=utf-8
set hlsearch
set cursorline

" auto create new parent folder after creating new file
function! s:MkNonExDir(file, buf)
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


" NERDTree
" =============
"solve NERDTree with zsh
let g:NERDTreeDirArrows=0
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_smart_startup_focus=2

" File type config
" ================
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
au BufNewFile,BufRead *.hbs set filetype=html " handlebar template as html
au FileType coffee :setlocal sw=2 ts=2 sts=2 " tab size=2 for coffeescript
au FileType yml :setlocal sw=2 ts=2 sts=2 " tab size=2 for coffeescript
au FileType ruby :setlocal sw=2 ts=2 sts=2 " tab size=2 for ruby
au BufNewFile,BufRead *.go set filetype=go
au BufNewFile,BufRead *.md set filetype=markdown
au FileType markdown :setlocal sw=4 ts=4 sts=4
au FileType cpp :setlocal sw=4 ts=4 sts=4


" C indent
" ==========
set cindent
set cinoptions+=g0

" OmniCppComplete
" ===============
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" Complete options (disable preview scratch window)
set completeopt=menu,menuone,longest
" Limit popup menu height
set pumheight=15
" Disable auto popup, use <Tab> to autocomplete
" let g:clang_complete_auto = 0
" Show clang errors in the quickfix window
let g:clang_complete_copen = 1
" autocmd FileType cpp set omnifunc=omni#cpp#complete#Main


" Tags
" =====
set tags+=~/.vim/wxwidgetstags


" EasyMotion
" ============
let g:EasyMotion_leader_key = '<Leader>'

" better white space
" ==================
augroup WhiteSpace
    au!
    au VimEnter * silent! ToggleStripWhitespaceOnSave
augroup END


" HTML format
" ==============
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

" Rainbow Parentheses
" ===================

" Autoload RaibowParentheses. For performance reason, I disabled it by default
" au VimEnter * RainbowParenthesesToggle
" au Syntax * RainbowParenthesesLoadRound
" au Syntax * RainbowParenthesesLoadSquare
" au Syntax * RainbowParenthesesLoadBraces
" au Syntax * RainbowParenthesesLoadChevrons

" CLang
" ====================
let s:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
if isdirectory(s:clang_library_path)
    let g:clang_library_path=s:clang_library_path
endif


" Lightline config
" =====================
let g:powerline_symbols = 'fancy'
let g:lightline = {
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ 'separator': { 'left': '⮀', 'right': '⮂' },
      \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '⭤' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? '⭠ '._ : ''
  endif
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

" tagbar
" ====================
nmap <F7> :TagbarToggle<CR>

" config color theme for git vimdiff
" ====================
if &diff
    colorscheme kellys
endif

" tern-for-vim
" =====================
imap <C-J> <Plug>snipMateNextOrTrigger

" markdown from plasticboy
" ====================
let g:vim_markdown_folding_disabled=1 " disable folding

" ctrlp-funky
" ==================
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_syntax_highlight = 1
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" vim-json
" ==========
let g:vim_json_syntax_conceal = 0

" neocomplete
" =============
let g:neocomplcache_enable_at_startup = 1
let g:acp_enableAtStartup = 1
