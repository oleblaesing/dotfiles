filetype off
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'editorconfig/editorconfig-vim'
call plug#end()

map <C-q> :NERDTreeToggle<CR>
nnoremap <silent> <C-t> :Files<CR>

set autoindent
set autoread
set backspace=indent,eol,start
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set fileformat=unix
set hidden
set lazyredraw
set mouse=a
set nowrap
set number
set scrolloff=3
set shiftwidth=2
set smartindent
set softtabstop=2

syntax on
