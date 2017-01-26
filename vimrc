" Vim Config file (~/.vimrc)
"==========================================================================="

" Plugins to install with VimPlug start here
"==========================================================================="
call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'severin-lemaignan/vim-minimap'
Plug 'wesQ3/vim-windowswap'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'rking/ag.vim'
Plug 'KeitaNakamura/neodark.vim'

call plug#end()
" VimPLUG plugins end here
"==========================================================================="

" Color scheme
" =========================================================================="
colorscheme neodark

" Directories (make sure no nonsense appears in working dir)
" ========================================================================="
set directory=~/.vim/swapfiles//
set backupdir=~/.vim/backup//

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
set tabstop=2
set shiftwidth=2
set expandtab
set relativenumber

" Mouse shit
" =========================================================================="
set mouse=n
set ttymouse=xterm2

" Other magic shit
" =========================================================================="
filetype plugin indent on
syntax enable

" This solves background color issues on scroll
if &term =~ '256color'
 set t_ut=
endif

" Syntastic
"=================================================================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set statusline+=%F

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"Syntastic local linter support
let g:syntastic_javascript_checkers = []
function CheckJavaScriptLinter(filepath, linter)
    if exists('b:syntastic_checkers')
        return
    endif
    if filereadable(a:filepath)
        let b:syntastic_checkers = [a:linter]
        let {'b:syntastic_' . a:linter . '_exec'} = a:filepath
    endif
endfunction
function SetupJavaScriptLinter()
    let l:current_folder = expand('%:p:h')
    let l:bin_folder = fnamemodify(syntastic#util#findFileInParent('package.json', l:current_folder), ':h')
    let l:bin_folder = l:bin_folder . '/node_modules/.bin/'
    call CheckJavaScriptLinter(l:bin_folder . 'standard', 'standard')
    call CheckJavaScriptLinter(l:bin_folder . 'eslint', 'eslint')
endfunction
autocmd FileType javascript call SetupJavaScriptLinter()

" EOF
" =========================================================================="
