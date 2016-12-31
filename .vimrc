"My Vim Config <3
"====================

"Vundle Stuffs
"--------------------

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


"Plugins
"--------------------

" Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Fugitive
Plugin 'tpope/vim-fugitive'

" Mardown Previews
" * Also run `sudo npm -g install instant-markdown-d`
Plugin 'suan/vim-instant-markdown'

" NERD Tree
Plugin 'scrooloose/nerdcommenter'

" NERD Tree
Plugin 'scrooloose/nerdtree'

" Python Mode
Plugin 'klen/python-mode'

" Rust syntax
Plugin 'rust-lang/rust.vim'

" Syntastic
Plugin 'scrooloose/syntastic'

" SuperTab
Plugin 'ervandew/supertab'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on


"Syntastic Settings
"--------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting = 0
let g:syntastic_rust_checkers = ['rustc']
let g:syntastic_rust_rustc_quiet_messages = { "level": "warnings"}

"Airline Settings
"--------------------
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_theme='base16_monokai'

"Markdown Settings
"--------------------
let g:instant_markdown_slow = 1
let g:instant_markdown_autostart = 0

"PyMode Settings
"--------------------
let g:pymode_folding = 0
let g:pymode_lint_on_write = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_lint_checkers = ['pyflakes', 'pylint', 'mccabe']


"Custom Stuffs
"--------------------

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages.

runtime! archlinux.vim

" Colorscheme

colo peachpuff

" If you prefer the old-style vim functionalty, add 'runtime! vimrc_example.vim'
" Or better yet, read /usr/share/vim/vim74/vimrc_example.vim or the vim manual
" and configure vim to your own liking!

set tabstop=4       " Number of spaces that a <Tab> in the file counts for.
 
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
 
set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.
 
"set smarttab       " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.
 
set showcmd         " Show (partial) command in status line.

set number          " Show line numbers.
set relativenumber  " Show numbers relative to the current line

set showmatch       " When a bracket is inserted, briefly jump to the matching
                    " one. The jump is only done if the match can be seen on the
                    " screen. The time to show the match can be set with
                    " 'matchtime'.
 
set nohlsearch      " Do not highlight instances of a searched term. 
 
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.
 
set ignorecase      " Ignore case in search patterns.
 
set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.
 
set backspace=2     " Influences the working of <BS>, <Del>, CTRL-W
                    " and CTRL-U in Insert mode. This is a list of items,
                    " separated by commas. Each item allows a way to backspace
                    " over something.
 
"set autoindent     " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).

set noautoindent    " Disable autoindent behaviour. No more pasting in code and
                    " having it look like a goddamned staircase.
 
"set textwidth=79   " Maximum width of text that is being inserted. A longer
                    " line will be broken after white space to get this width.
 
set formatoptions=c,q,t " This is a sequence of letters which describes how
                    " automatic formatting is to be done.
                    "
                    " letter    meaning when present in 'formatoptions'
                    " ------    ---------------------------------------
                    " c         Auto-wrap comments using textwidth, inserting
                    "           the current comment leader automatically.
                    " q         Allow formatting of comments with "gq".
                    " r         Automatically insert the current comment leader
                    "           after hitting <Enter> in Insert mode. 
                    " t         Auto-wrap text using textwidth (does not apply
                    "           to comments)
 
set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.
 
"set background=dark" When set to "dark", Vim will try to use colors that look
                    " good on a dark background. When set to "light", Vim will
                    " try to use colors that look good on a light background.
                    " Any other value is illegal.
 
set mouse=a         " Enable the use of the mouse.

set laststatus=2    " Always display powerline in all windows
set noshowmode      " Hide the default mode text

set wrap            " These options soft wrap words when typing long lines at
set linebreak       " the end of the screen. 
set nolist
 
filetype plugin indent on
syntax on
