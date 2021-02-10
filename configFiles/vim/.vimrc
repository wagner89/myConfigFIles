" Vim Config file (~/.vimrc) - now supports neovim as well
"==========================================================================="

" Backup and swap file stuff (no swap because it's annoying, backup not in
" current dir
"==========================================================================="
set noswapfile
set backupdir-=.
set backupdir^=~/tmp,/tmp

" Plugins to install with VimPlug start here
"==========================================================================="
call plug#begin()

  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'wesQ3/vim-windowswap'
  Plug 'tpope/vim-fugitive'
  Plug 'rking/ag.vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'sstallion/vim-wtf'
  Plug 'powerline/powerline'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'jeetsukumaran/vim-buffergator'
  Plug 'moll/vim-bbye'
  Plug 'chmllr/elrodeo-vim-colorscheme'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'w0rp/ale'
  Plug 'prettier/vim-prettier'
  Plug 'joshdick/onedark.vim'
  Plug 'sheerun/vim-polyglot'
  Plug 'arcticicestudio/nord-vim'
  Plug 'mileszs/ack.vim'

call plug#end()
" VimPLUG plugins end here
"==========================================================================="

" Color scheme
" =========================================================================="
syntax enable
set background=dark
colorscheme nord

" Directories (make sure no nonsense appears in working dir)
" ========================================================================="
set directory=~/.vim/swapfiles//

" Key mappings
" =========================================================================="
" nnoremap <silent> <C-p> :FZF<CR>
nnoremap <c-p> :GFiles<cr> 
" the above ignores the paths in .gitignore :D
nnoremap <silent> <F3> :NERDTreeToggle<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <CR> :noh<CR><CR>
nnoremap <C-c> "+yy
cnoreabbrev <expr> q getcmdtype() == ":" && getcmdline() == 'q' ? 'Bdelete' : 'q'
:command! WQ wq
:command! Wq wq
:command! WA wq
:command! Wa wa
:command! Qa qa!
:command! QA qa!
:command! W w
:command! Q quit
" inoremap  <Up>     <NOP>
" inoremap  <Down>   <NOP>
" inoremap  <Left>   <NOP>
" inoremap  <Right>  <NOP>
" nnoremap  <Up>     <NOP>
" nnoremap  <Down>   <NOP>
" nnoremap  <Left>   <NOP>
" nnoremap  <Right>  <NOP>
nnoremap P diw"0P

" Settings, flags, defaults
" =========================================================================="
set number
set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set relativenumber
set backupcopy=yes
set termguicolors
set smartcase
set ignorecase
set hlsearch
set clipboard=unnamed
set encoding=utf-8 
set guifont=Droid\ Sans\ Mono\ Dotted\ for\ Powerline\ 8
set hidden

" Mouse shit
" =========================================================================="
set mouse=n

if !has('nvim')
  set ttymouse=xterm2
endif

" Folding
" =========================================================================="
set foldmethod=syntax  "syntax highlighting items specify folds
set foldcolumn=1       "defines 1 col at window left, to indicate folding
let javaScript_fold=1  "activate folding by JS syntax
set foldlevelstart=99  "start file with all folds opened

" Saved macros
" =========================================================================="
" with cursor on a word, add a console log for that word by pressing @q
let @q="yiwoconsole.log('*** 0: ', { 0, type: typeof 0 });"

" Other magic shit
" =========================================================================="
filetype plugin indent on
syntax enable
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 0 
let g:airline#extensions#ale#error_symbol = ' ? '
let g:airline#extensions#ale#warning_symbol = ' ? '
let g:airline_theme='nord'

" This solves background color issues on scroll
if &term =~ '256color'
 set t_ut=
endif

" ALE
let g:elm_setup_keybindings = 0
let g:ale_javascript_eslint_executable = 'node_modules/eslint/bin/eslint.js'

let g:ale_fix_on_save = 1
let g:ale_javascript_prettier_options = '--print-width 160 --single-quote --trailing-comma all --bracket-spacing --jsx-bracket-same-line --arrow-parens avoid'

let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'elm': ['make'],
\   'elixir': ['credo'],
\}


if has('nvim')
  let g:backupdir=expand(stdpath('data') . '/backup')
  if !isdirectory(g:backupdir)
     mkdir(g:backupdir, "p")
  endif
  let &backupdir=g:backupdir
endif
" EOF
" ==========================================================================
