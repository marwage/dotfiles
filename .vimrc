" Marcel's vimrc

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'dense-analysis/ale'
Plug 'ervandew/supertab'
Plug 'itchyny/lightline.vim'
Plug 'yggdroot/indentline'
Plug 'raimondi/delimitmate'
Plug 'sainnhe/sonokai'

call plug#end()
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
set clipboard=unnamed

set ruler

set backspace=indent,eol,start

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

" nerdcommenter
filetype plugin on
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" nerdtree
map <Leader>n :NERDTreeToggle<CR>

" ALE
let g:ale_linters = {
\ 'go': ['gopls'],
\}
let g:ale_fixers = {
\ '*': ['remove_trailing_lines', 'trim_whitespace'],
\ 'python': ['autoflake', 'isort', 'yapf'],
\ 'go': ['gofmt', 'goimports', 'golines'],
\ 'cpp': ['clang-format'],
\ 'json': ['jq'],
\}
let g:ale_lint_on_insert_leave=1
let g:ale_fix_on_save=1
let g:ale_completion_enabled=1

" GO
" autocmd Filetype go setlocal tabstop=8
" autocmd Filetype go setlocal softtabstop=8
autocmd Filetype go setlocal shiftwidth=8
