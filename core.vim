" {{{ vim settings
filetype plugin on " enable loading the plugin for appropriate file type 

let mapleader = " "
let maplocalleader =" "
set termencoding=utf-8
set encoding=utf-8
set laststatus=2
set statusline=%F%m%r%h%w\ [%{&ff}]\ [A=\%3.3b]\ [H=\%02.2B]\ [%4l,%4v]\ [%p%%]\ [LEN=%L]
set thesaurus+=$HOME/vimfiles/thesaur.txt
set clipboard+=unnamed
set nocompatible
set tags=tags;/
set viminfo=%,'50,\"100,n~/.viminfo

set nocursorline

if has ("mac")
    set wildignore=*.o,*.obj,*.pyc,*.xib,*.png,*.jpg,*.icns,*.pva,*.pdf,*.zip,*.rar,*.eml,*.sj,*.pys,*.m4a,*.tif
else
    set wildignore=*.o,*.obj,*.pyc,*.swp,*.ico,*.pdb,*.ilk,*.dep,*.obmp,*.bin,*.bmp,*.jpg,.git,*.ti,*.dbo,*.a,*.obmpinfo,*.dll,.svn,objects/**
endif

" indent options
"  see help cinoptions-values for more details
" default '0{,0},0),:,0#,!^F,o,O,e' disable 0# for not ident preprocess
" set cinkeys=0{,0},0),:,!^F,o,O,e
set cinoptions=>s,e0,n0,f0,{0,}0,^0,:0,=s,l0,b0,g0,hs,ps,ts,is,+s,c3,C0,0,(0,us,U0,w0,W0,m0,j0,)20,*30,N-s

set ut=500
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set list
set noswapfile

"watch out.. no backup will be saved
set nobackup
set autoread
set hidden " allow to change buffer without saving 
set ruler " show the cursor position all the time
set cmdheight=1 " 1 screen lines to use for the command-line 
set showcmd " display incomplete commands
set wildmenu " turn on wild menu, try typing :h and press <Tab> 
set showmatch
set gdefault
set smartcase
set ignorecase
set incsearch
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set hlsearch
set si
set ai
set expandtab
set sw=4
" set tabstop=4
set history=200 " keep 50 lines of command line history
set copyindent    " copy the previous indentation on autoindenting
" set smarttab
set nowrapscan
set dictionary=$HOME/myvim/words.txt
set sessionoptions += "globals"
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,latin1
set nosmd " don't show mode, otherwise vmath won't work properly
"}}}

inoremap <unique> jf <ESC>
autocmd!
