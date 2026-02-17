" Marcel's vimrc

set number
set linebreak
set showbreak=+++
set textwidth=0
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
set tw=0

set ruler

set backspace=indent,eol,start

set viminfo='100,<1000,s100,h

syntax enable

" GO
autocmd Filetype go setlocal shiftwidth=8
" YAML
autocmd Filetype yaml setlocal shiftwidth=2
