" UTF-8 support
set encoding=utf-8
set fileencoding=utf-8

scriptencoding utf8
filetype plugin on
filetype plugin indent on

" set tab
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set cindent
set cursorline

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable undo after close file
set undofile
set undodir=~/.vim/undo
set undolevels=5000

" Enable folding with spacebar
nnoremap <space> za

" 设置命令行补全模式为菜单模式
" 有多个候选项时，以菜单形式展示，而不是默认第一个
set wildmenu
set wildmode=list:longest,full


" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

" YouCompleteMe
Plug 'Valloric/YouCompleteMe'

" Dracula theme
Plug 'dracula/vim'

"make fold code right
Plug 'tmhedberg/SimpylFold'

" NERD Tree
Plug 'scrooloose/nerdtree'

" NERD Tree tabs
Plug 'jistr/vim-nerdtree-tabs'

" Syntax checking
Plug 'w0rp/ale'

" vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" PEP8 checking
Plug 'nvie/vim-flake8'

" Quick Run
Plug 'skywind3000/asyncrun.vim'

" Sper Searching
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" power airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" vim indent object
Plug 'michaeljsmith/vim-indent-object'

" rust vim syntax
Plug 'wting/rust.vim'

" Initialize plugin system
call plug#end()

let g:python_highlight_all=1
let g:solarized_termcolors=256

" set theme
syntax enable
colorscheme dracula 
set number
set relativenumber
set background=dark
set ruler
set showcmd
set noswapfile
set autoread
set nobackup
set mouse=a
set hlsearch
set pastetoggle=<F3>
hi Normal ctermfg=252 ctermbg=none

if has('gui_running')
    set background=dark
    colorscheme solarized
endif

" airline theme
set t_Co=256
set laststatus=2

if !exists('g:airline_symbols')
       let g:airline_symbols = {}
endif

let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#buffer_nr_show=1
let g:airline#extensions#ale#enabled=1
let g:airline_theme='dracula'

let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']


" YouCompleteMe Position
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
" ensure autocomplete window goes away when done with it
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_min_num_of_chars_for_completion=2
let g:ycm_cache_omnifunc=0
let g:ycm_complete_in_comments=1
let g:ycm_complete_in_strings=1
let g:ycm_server_keep_logfiles=1
let g:ycm_rust_src_path = '/usr/local/rust/src'

" fix temporary bug for YouCompleteMe
if has('python3')
  silent! python3 1
endif


" map a specific key or shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>
" show NERDTree line numbers
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeAutoCenter=1
" show hidden files
let g:NERDTreeShowHidden=0
" set NERDTree windows width
let g:NERDTreeWinSize=32
" ignore *.pyc files
let g:NERDTreeIgnore=['\.pyc$', '\~$']


" set solarized terminal colors
let g:solarized_termcolors=256


" customize the height of quick fix window
let g:flake8_quickfix_height=7
" customize whether the show marks in the file
let g:flake8_show_in_file=1

" set split screen
set splitright

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" let cursor always in center
nnoremap j jzz
nnoremap k kzz

" the proper PEP8 indentation for python scripts
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=99 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |


" set indent for js/html/css
au BufNewFile,BufRead *.js
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=99 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |

" solve the macos crontab problem
augroup MACOS_CRONTAB
    au BufEnter /private/tmp/crontab.* setl backupcopy=yes
augroup end

" remember the cursor postion when you last leave
if has('autocmd')
    augroup REMEBER_POSITON
        autocmd BufRead *.txt set tw=78
        autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \ exe "normal g'\"" |
        \ endif
    augroup end
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""Set Shortcut Keys"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = ","

" ale navigate between errors quickly
nmap <silent> <leader>p <Plug>(ale_previous_wrap)
nmap <silent> <leader>n <Plug>(ale_next_wrap)
" Quick compile and run kinds of files via ,p
nnoremap <leader>r :call <SID>compile_and_run()<CR>

" go to definition for function or class
nnoremap <leader>gd :YcmCompleter GoTo<CR>

" go build for golang program
autocmd FileType go nmap <leader>b  <Plug>(go-build)
" go run for golang program
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" ctrl-p for fzf
nnoremap <silent> <C-p> :FZF<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""Golang Config""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


augroup SPACEVIM_ASYNCRUN
    autocmd!
    " Automatically open the quickfix window
    autocmd User AsyncRunStart call asyncrun#quickfix_toggle(15, 1)
augroup END

function! s:compile_and_run()
    exec 'w'
    exec 'vertical rightbelow copen 80'
    exec 'wincmd w'
    if &filetype ==# 'c'
        exec 'AsyncRun! gcc % -o %<; time ./%<'
    elseif &filetype ==# 'cpp'
       exec 'AsyncRun! g++ -std=c++11 % -o %<; time ./%<'
    elseif &filetype ==# 'rust'
       exec 'AsyncRun! rustc %; time ./%<'
    elseif &filetype ==# 'java'
       exec 'AsyncRun! javac %; time java %<; rm -f *.class'
    elseif &filetype ==# 'sh'
       exec 'AsyncRun! time bash %'
    elseif &filetype ==# 'python'
       exec 'AsyncRun! time python3 "%"'
    elseif &filetype ==# 'javascript'
       exec 'AsyncRun! time node %'
    endif
endfunction
