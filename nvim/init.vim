"  Standard encoding
set encoding=utf-8

" set a leader
let mapleader=" "

" cd to the same dir as the file
set autochdir

" indentation
set autoindent
filetype plugin indent on

"number things, switch between modes depending on certain conditions
set number
set relativenumber

augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" obvious
syntax enable

" set the tab properties
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

" no errors
set novisualbell
set noerrorbells

"let me change buffers without saving
set hidden

"searching things
set ignorecase
set smartcase
set incsearch
set path+=**
set wildmenu
set wildmode=full

" always show statusbar
set laststatus=2

"set up sensible splits
set splitbelow
set splitright

" colour column in row 120
set colorcolumn=120
highlight ColorColumn ctermbg=8 guibg=lightgrey

" Plugin things
" Keeping everything in the .config dir
set runtimepath^=~/.config/nvim/site
let &packpath=&runtimepath

" Plugins are downloaded here
call plug#begin('~/.config/nvim/plug')

" List to install
Plug 'lambdalisue/suda.vim'
Plug 'easymotion/vim-easymotion'

" Plugins become visible after this
call plug#end()

" SUDA
" suda to save as sudo
command W w suda://%

" automatically use suda when opening a file w/o read/write permissions
let g:suda_smart_edit = 1
