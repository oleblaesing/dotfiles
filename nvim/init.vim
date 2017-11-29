filetype off
call plug#begin('~/.vim/plugged')
Plug 'editorconfig/editorconfig-vim'
Plug 'w0rp/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'joshdick/onedark.vim'
call plug#end()

if (has("autocmd") && !has("gui_running"))
  let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
  autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white })
end

colorscheme onedark

nnoremap <silent> <C-p> :Files<CR>

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

syntax on