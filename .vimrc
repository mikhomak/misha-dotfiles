syntax on
set background=dark
set clipboard=unnamed
set number
set cursorline
set shiftwidth=4
set tabstop=4
set showcmd
set showmode
set hlsearch
set nowrap
set wildmenu
set errorbells
set number relativenumber
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
filetype on
filetype plugin on
filetype indent on

" PLUGINS ---------------------------------------------------------------- {{{
call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'mhinz/vim-startify'
Plug 'morhetz/gruvbox'
call plug#end()
" }}}

colorscheme gruvbox
" VIMSCRIPT -------------------------------------------------------------- {{{

" }}}


" STATUS LINE ------------------------------------------------------------ {{{



" }}}
