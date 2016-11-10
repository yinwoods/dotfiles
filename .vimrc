filetype plugin indent on    " required
set tabstop=4
set shiftwidth=4
set expandtab
" To ignore plugin indent changes, instead use:
"filetype plugin on
set nocompatible              " be iMproved, required
set autoindent
set cindent

" set theme
syntax enable
colo evening
set number
set relativenumber
set background=dark
set ruler
set showcmd
set noswapfile
set autoread
set nobackup
set mouse=a
set pastetoggle=<F3>

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}

" vim Theme
"Plugin 'flazz/vim-colorschemes'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'

" YouCompleteMe
" Plugin 'Valloric/YouCompleteMe'

" NERD Tree
Plugin 'scrooloose/nerdtree'

" NERD Tree tabs
Plugin 'jistr/vim-nerdtree-tabs'

" SimpyFold 
Plugin 'tmhedberg/SimpylFold'

" Syntax checking
Plugin 'scrooloose/syntastic'

" PEP8 checking
Plugin 'nvie/vim-flake8'

" Sper Searching
Plugin 'kien/ctrlp.vim'

" power airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" match tags
Plugin 'vim-scripts/matchit.zip'

" All of your Plugins must be added before the following line
call vundle#end()            " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


hi Normal ctermfg=252 ctermbg=none

let python_highlight_all=1
let g:solarized_termcolors=256

if has('gui_running')
    set background=dark
    colorscheme solarized
endif

" airline theme
let g:airline_theme='solarized'

" YouCompleteMe Position
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" ensure autocomplete window goes away when done with it
let g:ycm_autoclose_preview_window_after_completion=1

" map a specific key or shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>
" show NERDTree line numbers
let NERDTreeShowLineNumbers=1
let NERDTreeAutoCenter=1
" show hidden files
let NERDTreeShowHidden=0
" set NERDTree windows width
let NERDTreeWinSize=32
" ignore *.pyc files
let NERDTreeIgnore=['\.pyc$', '\~$']

" set split screen
set splitright
" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with spacebar
nnoremap <space> za

" see docstring for folded code
let g:SimpyFold_docstring_preview=1

" the proper PEP8 indentation for python scripts
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" set indent for js/html/css
au BufNewFile,BufRead *.js, *.html, *.css <here>:</here>
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

" UTF-8 support
set encoding=utf-8
set fileencoding=utf-8

" run the Flake8 check every time when write a python file
autocmd BufWritePost *.py call Flake8()
" customize the height of quick fix window
let g:flake8_quickfix_height=7
" customize whether the show marks in the file
let g:flake8_show_in_file=1

" make python scripts run easily
au BufRead *.py map <buffer> <F5> :w <CR>:!/usr/bin/env python3 %<CR>

" let cursor always in center
nnoremap j jzz
nnoremap k kzz
