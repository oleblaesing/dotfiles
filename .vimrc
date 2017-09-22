set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'ternjs/tern_for_vim'
Plugin 'Valloric/YouCompleteMe'
call vundle#end()
filetype plugin indent on

colorscheme materialtheme

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

set autoindent
set autoread
set backspace=indent,eol,start
set colorcolumn=80
set cursorline
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
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set visualbell

syntax on
