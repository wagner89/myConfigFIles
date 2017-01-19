" Vim Config file (~/.vimrc)
"==========================================================================="

" VimPLUG starts here
"==========================================================================="
call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'severin-lemaignan/vim-minimap'
Plug 'wesQ3/vim-windowswap'

call plug#end()
" VimPLUG ends here
"==========================================================================="

" Color scheme
" =========================================================================="
colorscheme base16-atelierforest

" Key mappings
" =========================================================================="
nnoremap <silent> <C-p> :FZF<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>
nnoremap <F5> :buffers<CR>:buffer<Space>
nnoremap <F6> :MinimapToggle<CR>

" Settings, flags, defaults
" =========================================================================="
set number
set nowrap

" Mouse shit
" =========================================================================="
set mouse=n
set ttymouse=xterm2

" EOF
" =========================================================================="
