set guifont=Monospace\ 8
colorscheme elflord

"swap file directory
set directory=~/.vim/tmp

vmap <C-c> y<Esc>i
vmap <C-x> d<Esc>i
imap <C-v> <Esc>pi
imap <C-y> <Esc>ddi
map <C-z> <Esc>
imap <C-z> <Esc>ui

"map <F2> :BufExplorer<CR>
"map <F3> :NERDTreeToggle<CR>
map <S-F5> :source ~/.vimrc<CR>
map <S-F4> :edit ~/.vimrc<CR>

"antialiasing
set anti

"line numbers
set number

"marking tabulations
set list
set listchars=tab:>-

set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]%=[%=POS=%03l,%03c][%p%%]\ [LEN=%L

set nocompatible               " be iMproved
"filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'vim-ruby/vim-ruby'
