set guifont=Monospace\ 8
colorscheme default

set backspace=start,eol,indent

set directory=~/.vim/tmp

vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
imap <C-v> <Esc>pi
imap <C-y> <Esc>ddi
map <C-z> <Esc>
imap <C-z> <Esc>ui

map <S-F5> :source ~/.vimrc<CR>
map <S-F4> :edit ~/.vimrc<CR>

set anti
set number

"marking tabulations
set list
set listchars=tab:>-

set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]%=[%=POS=%03l,%03c][%p%%]\ [LEN=%L]

set autoindent
set smarttab

set nocompatible
syntax on
filetype on
filetype indent on
filetype plugin on

"autocmd BufRead,BufNewFile   *.rb set sw=2 ts=2 expandtab
au FileType ruby set sw=2 ts=2 expandtab

highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
"match OverLength /\%81v.*/

"set clipboard=unnamedplus
au BufRead *.txt setlocal spell spelllang=bg,en
au BufRead *.md setlocal spell spelllang=bg,en
au BufRead,BufNewFile *.md set filetype=markdown

if $TMUX == ''
  set clipboard+=unnamed
endif
