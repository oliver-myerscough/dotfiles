set nocompatible

set ts=2 " tab is 2 spaces
set number " show line numbers
set expandtab "
set shiftwidth=2 " autotab => 2
set smarttab " use shiftwidth for autotab
set cindent

set hlsearch " highlight search terms
set incsearch " show search mathes

set title " set the terminal's title

set pastetoggle=<F2>

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" move on lines on screen, not actual lines
:nmap j gj
:nmap k gk

syntax on
filetype plugin indent on

call plug#begin('~/.vim/plugged')

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'klen/python-mode'
" Plug 'alfredodeza/pytest.vim'
Plug 'Valloric/YouCompleteMe'

call plug#end()

let g:pymode_folding=0
let g:pymode_rope_complete_on_dot = 0
