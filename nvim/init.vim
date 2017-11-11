filetype off
call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'joshdick/onedark.vim'
call plug#end()

if (has("autocmd") && !has("gui_running"))
  let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
  autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white })
end

colorscheme onedark

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint']

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
