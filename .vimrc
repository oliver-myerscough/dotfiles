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

if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help

  command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif


execute pathogen#infect()
syntax on
filetype plugin indent on

