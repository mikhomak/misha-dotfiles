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
filetype plugin indent on
" PLUGINS ---------------------------------------------------------------- {{{
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'
call plug#end()
" }}}

colorscheme gruvbox
" VIMSCRIPT -------------------------------------------------------------- {{{

" }}}


" STATUS LINE ------------------------------------------------------------ {{{



" }}}
