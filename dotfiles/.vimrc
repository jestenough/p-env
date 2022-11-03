filetype off
syntax enable

" Generic
set nocompatible
set clipboard=unnamed
set noerrorbells

" Coding
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set enc=utf-8

" Swap and backup
set noswapfile
set nobackup
set nowritebackup

" UI
set relativenumber
set mouse=""
set showmode
set showmatch
set title

" Edit
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
set copyindent

" Search
set hlsearch
set incsearch
set ignorecase smartcase

" Hotkeys
nmap <C-A> 0
nmap <C-E> $
imap <C-A> <ESC>0i
imap <C-E> <ESC>$i<Right>
