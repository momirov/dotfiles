set rtp+=~/.vim/bundle/vundle/
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'
" CtrlP
Plugin 'kien/ctrlp.vim'
" Ack file search
Plugin 'mileszs/ack.vim'
" ruby development
Plugin 'vim-ruby/vim-ruby'
"" Powerline replacement
Plugin 'bling/vim-airline'
"" SuperTab for autocompletion
Plugin 'ervandew/supertab'
"" Slim template support
Plugin 'slim-template/vim-slim'
"" Coffeescript support
Plugin 'kchmck/vim-coffee-script'
"" Improved javascript support
Plugin 'pangloss/vim-javascript'
"" Snippets plugin
Plugin 'SirVer/ultisnips'
"" Autocomplete
Plugin 'Valloric/YouCompleteMe'

call vundle#end() 
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

color distinguished  " set color scheme
set background=dark
set number " show line numbers
set colorcolumn=80 " ruler
highlight ColorColumn ctermbg=DarkGray " change color of the ruler

set nobackup " disable swapping
set noswapfile " disable swapping

" highlight tabs and trailing spaces
set listchars=tab:>-,trail:-
set list

" remove trailing white space on save
autocmd BufWritePre {*.rb,*.js,*.coffee,*.scss,*.haml,*.html,*.php} :%s/\s\+$//e

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
"map <Left> <Nop>
"map <Right> <Nop>
"map <Up> <Nop>
"map <Down> <Nop>

" unmap Q, Q enters Ex mode
nnoremap Q <nop>

set t_Co=256
" Airline config
let g:airline#extensions#tabline#enabled = 1
set laststatus=2
set encoding=utf-8

" Ignore node_modules in ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Change snippets directory so we can commit them
let g:UltiSnipsSnippetsDir = '~/.vim/UltiSnips/'

let g:UltiSnipsExpandTrigger = '<C-@>'   " terminals send C-@ when C-Space is pressed.
let g:UltiSnipsJumpForwardTrigger = '<C-%>' " some key I do not use at all
let g:UltiSnipsSnippetDirectories  = ["UltiSnips"]

function! g:UltiSnips_Complete()
    call UltiSnips#ExpandSnippet()
    if g:ulti_expand_res == 0
        call UltiSnips#JumpForwards()
        if g:ulti_jump_forwards_res == 0
           return ""  " nothing more to do
        endif
    endif
    return ""
endfunction

au BufEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
