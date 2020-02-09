let $PYTHONPATH="/usr/lib/python3.8/site-packages"


" Directory for plugins
call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-airline/vim-airline'

Plug 'dracula/vim', { 'as': 'dracula' }


call plug#end()


colorscheme dracula

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes
highlight clear SignColumn

" set number
set number

" set color to column 
:set colorcolumn=80


" CoC specific
source $HOME/.config/nvim/coc.vim

