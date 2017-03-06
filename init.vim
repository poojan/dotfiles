let g:python_host_prog = '/opt/local/bin/python'

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'ggreer/the_silver_searcher' | Plug 'rking/ag.vim'
" Plug 'bling/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-buftabline'
Plug 'flazz/vim-colorschemes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'Shougo/deoplete.nvim'
Plug 'will133/vim-dirdiff'
Plug 'junegunn/vim-easy-align'
Plug 'lambdatoast/elm.vim'
Plug 'mattn/emmet-vim'
" Plug 'flowtype/vim-flow', { 'for': 'javascript' }
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'maksimr/vim-jsbeautify'
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'itchyny/lightline.vim'
" Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'drmingdrmer/vim-syntax-markdown'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'digitaltoad/vim-pug'
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'tpope/vim-surround'
Plug 'keith/swift.vim'
Plug 'scrooloose/syntastic'
Plug 'godlygeek/tabular'
Plug 'majutsushi/tagbar'
Plug 'leafgarland/typescript-vim'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'posva/vim-vue'
Plug 'HerringtonDarkholme/yats.vim'

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer --clang-completer' }
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
" Plug 'ternjs/tern_for_vim'

Plug 'chriskempson/base16-vim'

call plug#end()


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

"" Map leader to <Space>
let mapleader = "\<Space>"


"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set shiftwidth=2
set softtabstop=2
set tabstop=2
" set bs=2 " fixed backspace not working
set expandtab

autocmd FileType c setlocal sw=4 ts=4 sts=4
autocmd FileType cpp setlocal sw=4 ts=4 sts=4
autocmd FileType java setlocal sw=4 ts=4 sts=4
autocmd FileType javascript setlocal sw=2 ts=2 sts=2 expandtab
autocmd FileType javascript.jsx setlocal sw=2 ts=2 sts=2 expandtab
autocmd FileType php setlocal sw=4 ts=4 sts=4
autocmd FileType swift setlocal sw=4 ts=4 sts=4
autocmd FileType swift set autoread

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
" set ignorecase
set smartcase

"" Encoding
" set bomb
" set binary " Commented since this interferes with backspace on indents

"" Remove extra spaces on save
autocmd BufWritePre * :%s/\s\+$//e

"" Match Tags
runtime macros/matchit.vim

"" Buffers
map <C-J> :bn<CR>
map <C-K> :bp<CR>
map <leader>bd :bd<CR>

"" System clipboard
vmap <leader>y y:call system("pbcopy", getreg("\""))<CR>
" nmap <leader>p :call setreg("\"",system("pbpaste"))<CR>p

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif


" Relative numbering
function! NumberToggle()
  if(&relativenumber == 1)
    set nornu
    set number
  else
    set rnu
  endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

" Search and replace word under cursor using <leader>sr
nnoremap <leader>sr :%s/<c-r><c-w>/<c-r><c-w>/gc<c-f>$F/i

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

let no_buffers_menu=1
set background=dark
if !exists('g:not_finsh_neobundle')
  " colorscheme smyck
  " colorscheme jellybeans
  colorscheme Benokai
  " colorscheme CandyPaper
  " colorscheme solarized
  " colorscheme base16-railscasts
endif

set t_Co=256
set cursorline
set guioptions=egmrti
set gfn=Monospace\ 10


"*****************************************************************************
"" Plugins
"*****************************************************************************

"" airline
let g:airline_theme='molokai'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#tab_nr_type = 2
"
let g:airline#extensions#tabline#buffer_idx_mode = 1
  " nmap <leader>1 <Plug>AirlineSelectTab1
  " nmap <leader>2 <Plug>AirlineSelectTab2
  " nmap <leader>3 <Plug>AirlineSelectTab3
  " nmap <leader>4 <Plug>AirlineSelectTab4
  " nmap <leader>5 <Plug>AirlineSelectTab5
  " nmap <leader>6 <Plug>AirlineSelectTab6
  " nmap <leader>7 <Plug>AirlineSelectTab7
  " nmap <leader>8 <Plug>AirlineSelectTab8
  " nmap <leader>9 <Plug>AirlineSelectTab9
  "


"" CtrlP
let g:ctrlp_custom_ignore = '\v[\/](hooks|www/lib|plugins|node_modules|target|dist|bower_components|ant-build|platforms)|(\.(swp|ico|git|svn))$'
"http://kien.github.io/ctrlp.vim/
let g:ctrlp_working_path_mode = 'a'
nnoremap <Leader>b :CtrlPBuffer<CR>

"" Deoplete
let g:deoplete#enable_at_startup = 1

"" vim-javascript
let g:javascript_enable_domhtmlcss = 1

"" NERDCommenter
let NERDSpaceDelims=1


"" NERDTree
map <leader><leader> :NERDTreeToggle<CR>


"" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_html_tidy_ignore_errors=[
  \'proprietary attribute "ng-',
  \'proprietary attribute "ion-',
  \'proprietary attribute "ui-'
\]
let g:syntastic_c_include_dirs = ['.']
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_loc_list_height = 2

function! JavascriptCheckers()
  if filereadable(getcwd() . '/.eslintrc')
    "if !empty(glob(getcwd() . '/node_modules/.bin/eslint'))
      "return [ getcwd() . '/node_modules/.bin/eslint' ]
    "endif
    " return [ 'eslint' ]
    return [ './node_modules/.bin/eslint' ]
  elseif filereadable(getcwd() . '/../.eslintrc')
    " return [ 'eslint' ]
    return [ '../node_modules/.bin/eslint' ]
  elseif filereadable(getcwd() . '/../../.eslintrc')
    " return [ 'eslint' ]
    return [ '../../node_modules/.bin/eslint' ]
  elseif filereadable($HOME . '/.eslintrc')
    return [ 'eslint' ]

  elseif filereadable(getcwd() . '/.jshintrc')
    return ['jshint']
  " else
    " return ['standard']
  endif
endfunction

function! JavascriptCheckers2()
  if filereadable(getcwd() . '/.eslintrc')
    "if !empty(glob(getcwd() . '/node_modules/.bin/eslint'))
      "return [ getcwd() . '/node_modules/.bin/eslint' ]
    "endif
    return [ getcwd() . '/node_modules/.bin/eslint' ]
  elseif filereadable(getcwd() . '/../.eslintrc')
    return [ getcwd() . '/../node_modules/.bin/eslint' ]
  elseif filereadable(getcwd() . '/../../.eslintrc')
    return [ getcwd() . '/../../node_modules/.bin/eslint' ]
    " return [ 'eslint' ]
  elseif filereadable($HOME . '/.eslintrc')
    return [ 'eslint' ]

  elseif filereadable(getcwd() . '/.jshintrc')
    return ['jshint']
  " else
    " return ['standard']
  endif
endfunction

" let g:syntastic_javascript_checkers = JavascriptCheckers2()
let g:syntastic_javascript_checkers = [ "eslint" ]
let g:syntastic_html_tidy_ignore_errors=[" is not recognized!"]
let g:syntastic_cpp_config_file = '.syntastic_cpp_config'

function! ToggleErrors()
  let old_last_winnr = winnr('$')
  lclose
  if old_last_winnr == winnr('$')
    " Nothing was closed, open syntastic error location panel
    Errors
  endif
endfunction

nnoremap <silent> <C-e> :<C-u>call ToggleErrors()<CR>


"" Tern
nnoremap <leader>tt :TernType<cr>
let g:tern#is_show_argument_hints_enabled = 1
let tern#is_show_argument_hints_enabled = 1

"" UltiSnips
let g:UltiSnipsExpandTrigger="<c-e>"

" let g:lightline = {
      " \ 'colorscheme': 'wombat',
      " \ }
let g:lightline = {
      \ 'colorscheme': 'molokai',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'fugitive', 'filename', 'modified' ] ],
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"⭤":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ }
      \ }

      " \ 'separator': { 'left': '⮀', 'right': '⮂' },
      " \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
" let g:lightline = {
      " \ 'colorscheme': 'molokai',
      " \ 'component': {
      " \   'readonly': '%{&readonly?"⭤":""}',
      " \ },
      " \ 'separator': { 'left': '⮀', 'right': '⮂' },
      " \ 'subseparator': { 'left': '⮁', 'right': '⮃' }
      " \ }
" let g:buftabline_numbers=2
let g:buftabline_numbers=1
let g:buftabline_indicators="on"
let g:buftabline_separators="on"

" augroup AutoSyntastic
  " autocmd!
  " autocmd BufWritePost *.c,*.cpp,*.js call s:syntastic()
" augroup END
" function! s:syntastic()
  " SyntasticCheck
  " call lightline#update()
" endfunction

" hi TabLine      ctermfg=Black  ctermbg=Green     cterm=NONE
" hi TabLineFill  ctermfg=Black  ctermbg=Green     cterm=NONE
" hi TabLineSel   ctermfg=White  ctermbg=DarkBlue  cterm=NONE

" hi TabLineSel   ctermfg=White  ctermbg=73  cterm=NONE

" hi TabLineFill     guifg=#1B1D1E guibg=#1B1D1E
" hi TabLine         guibg=#1B1D1E guifg=#808080 gui=none


hi TabLine      ctermfg=253  ctermbg=67     cterm=NONE
hi TabLineFill  ctermfg=253  ctermbg=67     cterm=NONE
hi TabLineSel   ctermfg=232  ctermbg=144  cterm=NONE

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
" nnoremap <Leader>b :bp<CR>
" nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
" It's useful to show the buffer number in the status line.
" set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
let g:Powerline_symbols = 'fancy'"

" Tabular
" :AddTabularPipeline multiple_spaces / \{2,}/
  " \ map(a:lines, "substitute(v:val, ' \{2,}', '  ', 'g')")
  " \   | tabular#TabularizeStrings(a:lines, '  ', 'l0')

" Tagbar
nmap <leader>; :TagbarToggle<CR>"
