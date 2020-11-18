set number
" set linebreak
set showbreak=+++
set textwidth=100
set showmatch
 
set hlsearch
set ignorecase
set incsearch
 
set autoindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4
 
set ruler

syntax enable

" sonokai
let g:lightline = {'colorscheme' : 'sonokai'}
let g:sonokai_transparent_background = 1
colorscheme sonokai

" dracula
" packadd! dracula
" colorscheme dracula

" lightline
set laststatus=2
set noshowmode

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'

call plug#end()

" nerdcommenter
filetype plugin on
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" nerdtree
map <Leader>n :NERDTreeToggle<CR>

" automatic closing brackets
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" ALE
let g:ale_linters = {'cpp': ['clang-format']}
let g:ale_fixers = {'cpp': ['clang-format']}
let g:ale_fix_on_save = 1

