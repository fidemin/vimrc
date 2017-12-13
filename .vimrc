set nocompatible        " required
filetype off            " required

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" Plug list
" Make sure you use single quotes
Plug 'fatih/vim-go'

call plug#end()

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Add all your plugins here (note older versions of Vundle used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'pangloss/vim-javascript'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



" Autostart NERDTree
" autocmd vimenter * NERDTree

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_semantic_triggers = { 'objc' : ['æ'] }
" map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>


" Virtualenv Support python, YouCompleteMe
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
	project_base_dir = os.environ['VIRTUAL_ENV']
	activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
	execfile(activate_this, dict(__file__=activate_this))
EOF

"ingore files in NERDTree
let NERDTreeIgnore=['\.pyc$','\~$'] 

" Split direction
set splitbelow
set splitright


" Code folding
set foldmethod=indent
set foldlevel=99

" Set encoding
set encoding=utf-8
set fileencoding=utf-8
set tenc=utf-8

"Set paste toggle
set pastetoggle=<F5>

"Highligh all search results
set hlsearch

set backspace=indent,eol,start

" Enable folding with the spacebar
nnoremap <space> za


" make code pretty
let python_highlight_all=1
syntax on

" setting
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set exrc
set secure

au BufNewFile, BufRead *.c
	\ set tabstop=4
	\ set softtabstop=4
	\ set shiftwidth=4
	\ set noexpandtab
	\ set colorcolumn=110
	\ highlight ColorColumn ctermbg=darkgray
	

au BufNewFile,BufRead *.py
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=100 |
	\ set expandtab |
	\ set fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css 
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=100 |
	\ set expandtab |
	\ set fileformat=unix


" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" Read .ejs file as html
au BufNewFile,BufRead *.ejs set filetype=html

if has('gui_running')
    set background=dark
    colorscheme solarized
else
    set background=dark
    colorscheme zenburn
endif
