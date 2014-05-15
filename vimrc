"load plugins with pathogen
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

if has ('gui_running')
"colors
	set t_Co=256
	set background=dark
	colorscheme base16
"window size
	set lines=100
	set columns=90

"font
	set guifont=SourceCodePro-Regular\ 9
else
	set t_Co=256
	set background=dark
	colorscheme molokai
endif

syntax on


"Shell
set shell=/bin/bash

"GUI
set guioptions-=m "no menu
set guioptions-=T "no toolbar
set guioptions-=r "no right
set guioptions-=R
set guioptions-=l "no left
set guioptions-=L

"general usability
set nocompatible
set modelines=0
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set number
set undofile
set autoread

"wildmenu
set wildmenu
set wildmode=list:longest

set wildignore+=.hg,.git,.svn
set wildignore+=*.jpg,*.bmp,*.png,*.jpeg
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest,*.elf
set wildignore+=*.sw?
set wildignore+=*.pyc

"backups
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backup
set noswapfile

"leader
let mapleader=","
let maplocalleader="\\"

"folds
set foldmethod=syntax
nnoremap <silent><Space> @=(foldlevel('.')?'za':"\<Space>")<CR>
nnoremap <silent><S-Space> @=(foldlevel('.')?'zA':"\<Space>")<CR>
vnoremap <Space> zf
"open all folds shortcut
nnoremap <leader>z gg<S-v><S-g>z<S-o>``  

"fix search, map ,<space> to clear hl
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

"set line length
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

"stop hitting F1
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"nnoremap ; :

au FocusLost * :wa

"easier escape
inoremap jj <ESC>

"window splits:
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"line indents
nmap <Left> <<
nmap <Right> >>
nmap <Up> [e
nmap <Down> ]e
vmap <Left> <gv
vmap <Right> >gv
vmap <Up> [egv
vmap <Down> ]egv

"NERDtree
nnoremap <F2> :NERDTreeToggle<cr>
inoremap <F2> <esc>:NERDTreeToggle<cr>

"Tagbar
nnoremap <F4> :TagbarToggle<cr>
inoremap <F4> <esc>:TagbarToggle<cr>

let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=['.vim$', '\~$', '.*\.pyc$']
"let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1

"YankRing
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

"Gundo
nnoremap <F5> :GundoToggle<cr>

"ctrl-p open in buffer mode
nnoremap <C-b> :CtrlPBuffer<cr> 

"ultisnips"
let g:UltiSnipsExpandTrigger = "<c-j>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
