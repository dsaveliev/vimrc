"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" !!!IMPORTANT!!!
" For bottom border:
" ~/.gtkrc-2.0
" ~/.config/gtk-3.0/gtk.css
"
" @define-color YOUR_BACKGROUND_COLOR #rrggbb;
"
" window#vim-main-window {
"     background-color: @YOUR_BACKGROUND_COLOR;
" }
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" :W sudo saves the file
" (useful for handling the permission-denied error)
" command W w !sudo tee % > /dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=4

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Copy Paste
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Set extra options when running in GUI mode
if has("gui_running")
    set guiheadroom=0

    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions-=e

    set nocompatible
    set mouse=a
    set hidden
    set t_Co=256
endif

" Buffergator tuning
let g:buffergator_viewport_split_policy = 'T'
let g:buffergator_sort_regime = 'filepath'
let g:buffergator_split_size = 10
let g:buffergator_autoexpand_on_split = 0

" Airline tuning
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_powerline_fonts=1
let g:airline_theme='hybrid'
" let g:airline_theme='papercolor'

" Tagbar tuning
let g:tagbar_right=1
nnoremap <leader>rt :TagbarToggle<CR>

" GitGutter tuning
let g:gitgutter_max_signs = 1000

" Ack tuning
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Vim lastplace tuning
let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"

" Ullltrrra Navigation
nmap <S-h> <C-w><C-h>
nmap <S-l> <C-w><C-l>
nmap <S-k> <C-w><C-k>
nmap <S-j> <C-w><C-j>
map <C-h> <Left>
map <C-l> <Right>
map <C-k> <Down>
map <C-j> <Up>

" NERDTree
map <F1> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "left"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show line numbers
set number
" Always set autoindenting on
set autoindent
set smartindent
" Copy the previous indentation on autoindenting
set copyindent
" Don't wrap lines
set nowrap
" Highlight search terms
set hlsearch
" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" Don't redraw while executing macros (good performance config)
set lazyredraw
" For regular expressions turn magic on
set magic
" A tab is four spaces
set tabstop=2
" Number of spaces to use for autoindenting
set shiftwidth=2
" Insert tabs on the start of a line according to shiftwidth, not tabstop
set smarttab
"Always show current position
set ruler
" Format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>
" Use spaces instead of tabs
set expandtab

autocmd Filetype go setlocal tabstop=4 shiftwidth=4
autocmd Filetype json setlocal tabstop=4 shiftwidth=4
autocmd Filetype c setlocal tabstop=4 shiftwidth=4
autocmd Filetype h setlocal tabstop=4 shiftwidth=4
autocmd Filetype cpp setlocal tabstop=4 shiftwidth=4
autocmd Filetype erlang setlocal tabstop=4 shiftwidth=4


" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" In case of Shift
nnoremap ; :
command! W w

" Clear search
nmap <silent> ,/ :nohlsearch<CR>

" Move lines up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fonts and Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Font
set guifont=Menlo\ for\ Powerline:h16

" Enable syntax highlighting
syntax enable

" Colorscheme
set background=light
" set background=dark

"set termguicolors

colorscheme PaperColor
"colorscheme github
"colorscheme solarized
"colorscheme gruvbox
"colorscheme onedark
"let g:rehash256 = 1
"let g:molokai_original = 1
" colorscheme molokai


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GoLang
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Go formatter
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_version_warning = 0
autocmd FileType go nmap <leader>r  <Plug>(go-run)
"autocmd FileType go nmap <leader>t  <Plug>(go-test)
"autocmd FileType go nmap <leader>gb  <Plug>(go-build)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()
" Interface plugins
Plug 'jeetsukumaran/vim-buffergator'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Editing plugins
Plug 'ddollar/nerdcommenter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'

" Search plugins
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'ervandew/supertab'

" Color plugins
Plug 'altercation/vim-colors-solarized'
Plug 'romainl/Apprentice'
Plug 'chriskempson/base16-vim'
Plug 'nanotech/jellybeans.vim'
Plug 'ciaranm/inkpot'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'nightsense/seabird'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'endel/vim-github-colorscheme'
Plug 'tomasiser/vim-code-dark'
Plug 'sickill/vim-monokai'
Plug 'tomasr/molokai'
Plug 'fatih/molokai'
Plug 'NLKNguyen/papercolor-theme'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-colorscheme-switcher'

" Haskell
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Syntax plugins
Plug 'rust-lang/rust.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-markdown'
Plug 'vim-ruby/vim-ruby'
Plug 'fatih/vim-go'
"Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-cucumber'
Plug 'slim-template/vim-slim'
Plug 'elixir-lang/vim-elixir'
Plug 'posva/vim-vue'
Plug 'mxw/vim-jsx'
Plug 'dag/vim-fish'
" Plug 'vim-erlang/vim-erlang-runtime'
" Plug 'vim-erlang/vim-erlang-compiler'
" Plug 'vim-erlang/vim-erlang-omnicomplete'
" Plug 'vim-erlang/vim-erlang-tags'

" Git plugins
Plug 'airblade/vim-gitgutter'

" Misc plugins
Plug 'dietsche/vim-lastplace'
Plug 'mhinz/vim-startify'
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Useful links
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/amix/vimrc
" https://github.com/carlhuda/janus
" https://github.com/junegunn/vim-plug











