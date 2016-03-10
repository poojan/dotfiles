let g:python_host_prog = '/opt/local/bin/python'

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'ggreer/the_silver_searcher' | Plug 'rking/ag.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'Shougo/deoplete.nvim'
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'
Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript' }
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jaromero/vim-monokai-refined'
Plug 'wavded/vim-stylus', { 'for': 'stylus' }
Plug 'tpope/vim-surround'
Plug 'scrooloose/syntastic'

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer --clang-completer' }
Plug 'ternjs/tern_for_vim'

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
set expandtab

autocmd FileType c setlocal sw=4 ts=4 sts=4
autocmd FileType cpp setlocal sw=4 ts=4 sts=4
autocmd FileType java setlocal sw=4 ts=4 sts=4
autocmd FileType php setlocal sw=4 ts=4 sts=4

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
" set ignorecase
set smartcase

"" Encoding
set bomb
set binary


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


"*****************************************************************************
"" Visual Settings
"*****************************************************************************
syntax on
set ruler
set number

let no_buffers_menu=1
if !exists('g:not_finsh_neobundle')
  colorscheme Monokai-Refined
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
"let g:airline#extensions#tabline#show_tab_nr = 1
"let g:airline#extensions#tabline#tab_nr_type = 2
"
let g:airline#extensions#tabline#buffer_idx_mode = 1
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9


"" CtrlP
let g:ctrlp_custom_ignore = '\v[\/](hooks|www/lib|plugins|node_modules|target|dist|bower_components|ant-build|platforms)|(\.(swp|ico|git|svn))$'
"http://kien.github.io/ctrlp.vim/
let g:ctrlp_working_path_mode = 'a'

" Deoplete
let g:deoplete#enable_at_startup = 1

" vim-javascript
let g:javascript_enable_domhtmlcss = 1

augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab softtabstop=2 smartindent
augroup END


" NERDCommenter
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
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_loc_list_height = 2

function! JavascriptCheckers()
  if filereadable(getcwd() . '/.eslintrc')
    "if !empty(glob(getcwd() . '/node_modules/.bin/eslint'))
      "return [ getcwd() . '/node_modules/.bin/eslint' ]
    "endif
    return [ 'eslint' ]
  elseif filereadable(getcwd() . '/../.eslintrc')
    return [ 'eslint' ]
  elseif filereadable(getcwd() . '/../../.eslintrc')
    return [ 'eslint' ]

  elseif filereadable(getcwd() . '/.jshintrc')
    return ['jshint']
  else
    return ['standard']
  endif
endfunction

let g:syntastic_javascript_checkers = JavascriptCheckers()
let g:syntastic_html_tidy_ignore_errors=[" is not recognized!"]

function! ToggleErrors()
  let old_last_winnr = winnr('$')
  lclose
  if old_last_winnr == winnr('$')
    " Nothing was closed, open syntastic error location panel
    Errors
  endif
endfunction

nnoremap <silent> <C-e> :<C-u>call ToggleErrors()<CR>
