set nocompatible	" be iMproved
filetype off		" required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
"Bundle 'ervandew/supertab'
"Bundle 'bpowell/vim-android'
"Bundle 'ShowMarks'
"Bundle 'showmarks'
Bundle 'kshenoy/vim-signature'
Bundle 'SearchComplete'
"Bundle 'L9'
"Bundle 'FuzzyFinder'
"Bundle 'bufexplorer.zip'
"Bundle 'beyondwords/vim-twig'
"Bundle 'spf13/PIV'
Bundle 'Shougo/neocomplete.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'tpope/vim-fugitive'
"Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/neomru.vim'
"Bundle 'mattn/zencoding-vim'
Bundle 'rstacruz/sparkup', {'rtp': 'vim'}
Bundle "mattn/emmet-vim"
Bundle 'godlygeek/tabular'
Bundle 'plasticboy/vim-markdown'
"Bundle 'mileszs/ack.vim'
Bundle 'ggreer/the_silver_searcher'
Bundle 'rking/ag.vim'
Bundle 'vim-scripts/taglist.vim'
"Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'tpope/vim-unimpaired'
"Bundle 'docteurklein/vim-symfony'
Bundle 'kchmck/vim-coffee-script'
Bundle 'lepture/vim-jinja'
Bundle 'digitaltoad/vim-jade'
Bundle 'wavded/vim-stylus'
Bundle 'pangloss/vim-javascript'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'editorconfig/editorconfig-vim'
Bundle 'mxw/vim-jsx'
"Bundle 'jsx/jsx.vim.git'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'scrooloose/syntastic'
Bundle 'juvenn/mustache.vim'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-surround'
Bundle 'BufOnly.vim'
Bundle 'vim-scripts/VimClojure'
"Bundle 'joonty/vim-xdebug.git'
Bundle 'tomtom/vimtlib'
"Bundle 'Blackrush/vim-gocode'
Bundle 'einars/js-beautify'
Bundle 'maksimr/vim-jsbeautify'
"Bundle 'SirVer/ultisnips'
"Bundle 'christoomey/vim-tmux-navigator'
Bundle 'oinksoft/tcd.vim'
"Bundle 'jceb/vim-orgmode'
Bundle 'tpope/vim-speeddating'
Bundle 'DirDiff.vim'
"Bundle 'calendar.vim'
"Bundle 'itchyny/calendar.vim'
"Bundle 'wting/rust.vim'
Bundle 'tpope/vim-obsession'
Bundle 'airblade/vim-gitgutter'
"Bundle 'fholgado/minibufexpl.vim'
Bundle 'bling/vim-airline'

" Themes
Bundle 'jnurmine/Zenburn'
Bundle 'tomasr/molokai'
Bundle 'sickill/vim-monokai'
Bundle 'jaromero/vim-monokai-refined'



" General {
    filetype plugin indent on " load filetype plugins/indent settings
" }

" Vim UI {
    set number		" turn on line numbers
    "set numberwidth=5	" We are good up to 99999 lines
    "set ruler		" Always show current positions along the bottom
" }

" Text Formatting/Layout {
    "expandtab		" No real tabs please
	 set formatoptions-=cro
			" Default setting is 'tcq'
			" t Auto-wrap text using textwidth
			" c Auto-wrap comments using textwidth,
			"   inserting the current comment leader
			"   automatically
			" r Automatically insert the current comment leader
			"   after hitting <Enter> in Insert mode
			" o Automatically insert the current comment leader
			"   after hitting 'o' or 'O' in Normal mode
    "set shiftwidth=4
    "set softtabstop=4	" When hitting tab or backspace, how many spaces
			"" should a tab be (see expandtab)
    "set tabstop=4	" Real tabs shold be 8, and they will show with
			" set list on
    set sw=2
    set sts=2
    set ts=2
    set bs=2 " fixed backspace not working
	set expandtab

  autocmd FileType c setlocal shiftwidth=4 tabstop=4 sts=4
  autocmd FileType cpp setlocal shiftwidth=4 tabstop=4 sts=4
  autocmd FileType php setlocal shiftwidth=4 tabstop=4 sts=4
" }
"
"

"set sw=4
"set sts=4
"set ts=4
"set bs=4 " fixed backspace not working

set smartindent

"color zenburn " set color scheme to desert
color Monokai-Refined " set color scheme to desert
"color desert
"set guifont=Consolas " set font to Consolas
" using Source Code Pro
 set anti enc=utf-8
 "set guifont=Source\ Code\ Pro\ 11
 set guifont=Consolas\ 11
"
set t_Co=256
syntax on " turn on syntax highlighting

"let mapleader=";"
let mapleader = "\<Space>"
"
" Fuzzy Finder
"nnoremap <silent> s<C-k>	:FufFile **/<CR>
"map <leader>ff :FufFile<CR>
"map <leader>fb :FufBuffer<CR>

" neocomplete
let g:neocomplete#enable_at_startup = 1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" CtrlP {
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
"set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*\\tmp\\*,*\\cache\\*,*.swp,*.zip,*.exe  " Windows
set wildignore+=*.jpg,*.png,*.bmp,*.gif,*.jpeg,*.svg  " Windows

"let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|bower_components|ant-build|platforms)|(\.(swp|ico|git|svn))$'
let g:ctrlp_custom_ignore = '\v[\/](hooks|www/lib|plugins|node_modules|target|dist|bower_components|ant-build|platforms)|(\.(swp|ico|git|svn))$'
"let g:ctrlp_custom_ignore = {
  "\ 'dir':  '\v[\/]\.(git|hg|svn)$',
  "\ 'dir':  'cache',
  "\ 'file': '\v\.(exe|so|dll)$',
  "\ }

"let g:ctrlp_custom_ignore = '\v[\/]app[\/]cache$'
"let g:ctrlp_custom_ignore = '\vapp[\/]$'

"http://kien.github.io/ctrlp.vim/
"let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_working_path_mode = 'a'

" }

"if &term =~ '^gnome'
  "execute "set <xUp>=\e[1;*A"
  "execute "set <xDown>=\e[1;*B"
  "execute "set <xRight>=\e[1;*C"
  "execute "set <xLeft>=\e[1;*D"
  "execute "set <xHome>=\e[1;*H"
  "execute "set <xEnd>=\e[1;*F"
  "execute "set <PageUp>=\e[5;*~"
  "execute "set <PageDown>=\e[6;*~"
  "execute "set <F1>=\eOP"
  "execute "set <F2>=\eOQ"
  "execute "set <F3>=\eOR"
  "execute "set <F4>=\eOS"
  "execute "set <xF1>=\eO1;*P"
  "execute "set <xF2>=\eO1;*Q"
  "execute "set <xF3>=\eO1;*R"
  "execute "set <xF4>=\eO1;*S"
  "execute "set <F5>=\e[15;*~"
  "execute "set <F6>=\e[17;*~"
  "execute "set <F7>=\e[18;*~"
  "execute "set <F8>=\e[19;*~"
  "execute "set <F9>=\e[20;*~"
  "execute "set <F10>=\e[21;*~"
  "execute "set <F11>=\e[23;*~"
  "execute "set <F12>=\e[24;*~"
"endif

map <leader>n :NERDTreeToggle<CR>
map <F2> :NERDTreeToggle<CR>
"map <leader><leader> :NERDTreeToggle<CR>
"let mapleader = "\<Space>"
map <Space><Space> :NERDTreeToggle<CR>

"map `` :NERDTreeToggle<CR>
map <leader>t :Tlist<CR>
map <C-/> <leader>cc
map <leader>id :r! date /T<CR>
map <leader>it :r! time /T<CR>
map <leader>k :execute ":w !fixmyjs " . expand("%")<CR>:edit<CR>
map <leader>j :!jshint %<CR>

"map <leader>y :w !pbcopy %<CR>
"nmap <leader>p :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
"vmap <leader>y :w !pbcopy<CR><CR>

"vmap <C-c> y:call system("pbcopy", getreg("\""))<CR>
"nmap <C-v> :call setreg("\"",system("pbpaste"))<CR>p

vmap <leader>y y:call system("pbcopy", getreg("\""))<CR>
nmap <leader>p :call setreg("\"",system("pbpaste"))<CR>p

nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv
"map <C-J> :MBEbn<CR>
"map <C-K> :MBEbp<CR>
"map <leader>d :MBEbd
map <C-J> :bn<CR>
map <C-K> :bp<CR>
map <leader>bd :bd<CR>

map <C-L> :tabn<CR>
map <C-H> :tabp<CR>
map <leader>tn :tabn<CR>
map <leader>tp :tabp<CR>

"map <M-Up> <C-W>k
"map <M-Down> <C-W>j
"map <M-Left> <C-W>h
"map <M-Right> <C-W>l

"nmap <leader>f :Ack<space>
nmap <leader>f :Ag<space>

nmap <F3> I<C-R>=strftime("%I%M: ")<CR><Esc>A
imap <F3> <Esc>I<C-R>=strftime("%I%M: ")<CR><Esc>A

nmap <F5> :!gnsync --path /home/poojan/Documents/geeknote/Journal --mask "*.md" --format markdown > /dev/null<CR>
nmap <S-F5> :e /home/poojan/Documents/geeknote/Journal/Nov2013.md<CR>zRG

map <F7> :python debugger_globals()<cr>
map <F8> :python debugger_context()<cr>
map <F9> :python debugger_property()<cr>

nnoremap <A-a> <C-a>
nnoremap <A-x> <C-x>
"let g:ctrlp_map = '<C-Space>'

au BufNewFile,BufRead *.twig set ft=jinja.html
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
"au BufEnter *.org call org#SetOrgFileType()
"au BufEnter *.org            call org#SetOrgFileType()

set hidden

"nnoremap <silent> <leader>e :call JSFormat()<cr>

function! JSFormat()
    " Preparation: save last search, and cursor position.
    let l:win_view = winsaveview()
    let l:last_search = getreg('/')

    " call esformatter with the contents form and cleanup the extra newline
    execute ":%!~/.vim/bin/js-format.sh"
    if v:shell_error
        echoerr 'format script failed'
        undo
        return 0
    endif
    " Clean up: restore previous search
    history, and cursor position
    call winrestview(l:win_view)
    call setreg('/', l:last_search)
endfunction

"map <c-f> :call JsBeautify()<cr>
"autocmd FileType javascript noremap <buffer>  <c-e> :call JsBeautify()<cr>
"autocmd FileType html noremap <buffer> <c-e> :call HtmlBeautify()<cr>
"autocmd FileType css noremap <buffer> <c-e> :call CSSBeautify()<cr>
autocmd BufWritePre * :%s/\s\+$//e


" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_loc_list_height = 2

function! JavascriptCheckers()
  if filereadable(getcwd() . '/.eslintrc')
    return ['eslint']
  else
    return ['jshint']
  endif
endfunction

let g:syntastic_javascript_checkers = JavascriptCheckers()
"let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_javascript_checkers = ['jsxhint', 'eslint']
"let g:syntastic_javascript_checkers = ['eslint', 'jshint']
"let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
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

" MiniBufExplorer
"map <leader>mbe :MBEOpen<CR>
"map <leader>mbc :MBEClose<CR>
"map <leader>mbt :MBEToggle<CR>
"map <leader>bn :MBEbn<CR>
"map <leader>bp :MBEbp<CR>
"map <leader>bd :MBEbd<CR>
"map <leader>bb :MBEbb<CR>
"map <leader>bf :MBEbf<CR>

map <leader>nt :NERDTreeFromBookmark<space>

" orgmode
"let g:org_agenda_files=['~/org/index.org']

"let g:editorconfig_Beautifier='/home/poojan/.editorconfig'
"let g:editorconfig_Beautifier='/Users/poojan/.vim/.editorconfig'

"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup

" airline
let g:airline_theme='molokai'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#show_tab_nr = 1
"let g:airline#extensions#tabline#tab_nr_type = 2

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
