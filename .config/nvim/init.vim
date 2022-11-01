scriptencoding utf8
filetype plugin on
filetype plugin indent on

" UTF-8 support
set encoding=utf-8
set fileencoding=utf-8

" set tab
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set cursorline

" change dir based on current open files' position
set autochdir

" Enable folding
set foldmethod=indent
set foldlevel=99

" lowercase matches lowercase and capitalcase
set ignorecase
set smartcase

" Enable undo after close file
set undofile
set undodir=~/.vim/undo
set undolevels=5000


" 设置命令行补全模式为菜单模式
" 有多个候选项时，以菜单形式展示，而不是默认第一个
set wildmenu
set wildmode=list:longest,full
set completeopt=menu,menuone,noselect


" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Dracula theme
Plug 'dracula/vim'

" NERD Tree
Plug 'scrooloose/nerdtree'

" Vim ripgrep support
Plug 'jremmen/vim-ripgrep'

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
Plug 'junegunn/fzf.vim'

" vim notify
Plug 'rcarriga/nvim-notify'

" icon
Plug 'ryanoasis/vim-devicons'

" power airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" rust vim
Plug 'rust-lang/rust.vim'

Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }

" autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'
Plug 'onsails/lspkind-nvim'

" auto pair
Plug 'tmsvg/pear-tree'

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
" 终端支持 GUI
set termguicolors
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
let g:airline_theme='dracula'

let g:airline#extensions#ale#enabled=1

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

" Enable folding with spacebar
nnoremap <space> za

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" let cursor always in center
nnoremap j jzz
nnoremap k kzz

let mapleader = ","

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>

" solve the macos crontab problem
augroup MACOS_CRONTAB
    au BufEnter /private/tmp/crontab.* setl backupcopy=yes
augroup end

" lua 插件管理
"./lua/plugins.lua
lua require('plugins')

" remember the cursor postion when you last leave
if has('autocmd')
    augroup REMEBER_POSITON
        autocmd BufRead *.txt 
                    \ set tw=78
        autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \ exe "normal g'\"" |
        \ endif
    augroup end
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""Set Shortcut Keys"""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" ale navigate between errors quickly
nmap <silent> <leader>p <Plug>(ale_previous_wrap)
nmap <silent> <leader>n <Plug>(ale_next_wrap)
" Quick compile and run kinds of files via ,p
nnoremap <leader>r :call <SID>compile_and_run()<CR>
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" go build for golang program
autocmd FileType go nmap <leader>b  <Plug>(go-build)
" go run for golang program
autocmd FileType go nmap <leader>r  <Plug>(go-run)
" json comment highlight support
autocmd FileType json syntax match Comment +\/\/.\+$+

" ctrl-p for fzf
nnoremap <silent> <C-p> :FZF<CR>
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""Golang Config""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:go_fmt_command = "goimports"
call ale#linter#Define('go', {
\   'name': 'revive',
\   'output_stream': 'both',
\   'executable': 'revive',
\   'read_buffer': 0,
\   'command': 'revive %t',
\   'callback': 'ale#handlers#unix#HandleAsWarning',
\})
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
