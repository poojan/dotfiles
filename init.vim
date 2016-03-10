let g:python_host_prog = '/opt/local/bin/python'

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jaromero/vim-monokai-refined'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
let mapleader = "\<Space>"

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
set t_Co=256
syntax on
set ruler
set number

let no_buffers_menu=1
if !exists('g:not_finsh_neobundle')
  colorscheme Monokai-Refined
endif

"" NERDTree configuration
map <leader><leader> :NERDTreeToggle<CR>
