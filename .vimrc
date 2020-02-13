set encoding=utf-8
set autochdir

set autoindent
filetype plugin indent on

set nu rnu

augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

syntax enable
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab
set novisualbell
set noerrorbells
set hidden
set ignorecase
set smartcase
set incsearch

set path+=**
set wildmenu
set wildmode=longest:full,full
command W w !sudo tee % > /dev/null

set laststatus=2

set splitbelow
set splitright

set colorcolumn=80
highlight ColorColumn ctermbg=8 guibg=lightgrey

"NetRW
let g:netrw_banner=0

