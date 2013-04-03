set nocompatible                " choose no compatibility with legacy vi
filetype off                    " required for vundle!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" CtrlP
Bundle 'kien/ctrlp.vim'

" Ack file search
Bundle 'mileszs/ack.vim'

" ruby development
Bundle 'vim-ruby/vim-ruby'
"" Snipmante dependencies:
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"

"" Snipmate:
Bundle "garbas/vim-snipmate"
"" Powerline
Bundle 'Lokaltog/vim-powerline'
"" SuperTab for autocompletion
Bundle 'ervandew/supertab'
"" Slim template support
Bundle 'slim-template/vim-slim'
"" Coffeescript support
Bundle 'kchmck/vim-coffee-script'

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

color wombat256 " set color scheme
set number " show line numbers
set colorcolumn=85 " ruler
highlight ColorColumn ctermbg=DarkGray " change color of the ruler

set nobackup " disable swapping
set noswapfile " disable swapping

" highlight tabs and trailing spaces
set listchars=tab:>-,trail:-
set list

" remove trailing white space on save
autocmd BufWritePre {*.rb,*.js,*.coffee,*.scss,*.haml} :%s/\s\+$//e

" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
map <leader>n :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ARROW KEYS ARE UNACCEPTABLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" unmap Q, Q enters Ex mode
nnoremap Q <nop>

"" Powerline config
set laststatus=2
set encoding=utf-8
set t_Co=256
let g:Powerline_symbols = 'fancy'
