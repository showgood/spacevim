set nocompatible
filetype off

let g:spacevim_dir=empty($SPACEVIM_DIR) ? '$HOME/spacevim' : $SPACEVIM_DIR

if empty($SPACEVIM_DIR)
    echo "no spacevim_dir environment variable set!"
    echo "use default path: spacevim"
endif

set runtimepath=$HOME/spacevim,$VIMRUNTIME
" set runtimepath=$g:spacevim_dir,$VIMRUNTIME

"{{{ NeoBundle
if has('vim_starting')
  set nocompatible               " Be iMproved

" Required:
" set runtimepath+=~/.vim/bundle/neobundle.vim/
set runtimepath+=~/spacevim/neobundle.vim/

" set runtimepath+=g:spacevim_dir .'/bundle/neobundle.vim/'
endif

" Required:
call neobundle#rc(expand('$HOME/spacevim/bundle'))
" call neobundle#rc(expand(g:spacevim_dir .'/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'terryma/vim-multiple-cursors'
NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'tpope/vim-repeat'
NeoBundle 'kana/vim-textobj-user'
NeoBundle 'tpope/vim-surround'
NeoBundle 'Spaceghost/vim-matchit'
NeoBundle 'showgood/tagbar'
NeoBundle 'kana/vim-textobj-function'
NeoBundle 'ReplaceWithRegister'
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'vim-scripts/VisIncr'
"NeoBundle 'SirVer/ultisnips'
NeoBundle 'benmills/vimux'
NeoBundle 'Shougo/vimshell'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'showgood/misc_vim'
NeoBundle 'showgood/vim_mark'
NeoBundle 'xolox/vim-misc' "needed by xolox/vim-shell
NeoBundle 'xolox/vim-shell'
NeoBundle 't9md/vim-choosewin'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'bling/vim-airline'
NeoBundle 'terryma/vim-expand-region'
NeoBundle 'mbbill/undotree'
NeoBundle 'bkad/CamelCaseMotion'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'edkolev/tmuxline.vim'
"NeoBundle 'szw/vim-ctrlspace'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'rking/ag.vim'
"NeoBundle 'szw/vim-maximizer'
"NeoBundle 'showgood/eclim'
NeoBundle 'mtth/scratch.vim'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'ervandew/eclim'

"colorschemes
NeoBundle 'tomasr/molokai'
NeoBundle 'altercation/vim-colors-solarized'

"quite helpful
NeoBundle 'wellle/tmux-complete.vim'
NeoBundle 'Shougo/neosnippet.vim'
"NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'showgood/neosnippet-snippets'
NeoBundle 'honza/vim-snippets'
NeoBundle 'osyo-manga/vim-marching'
"NeoBundle 'wellle/targets.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'haya14busa/incsearch.vim'
NeoBundle 'haya14busa/incsearch-easymotion.vim'
"NeoBundle 'Shougo/vimfiler.vim'

 " You can specify revision/branch/tag.
 "NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
NeoBundleCheck
"}}}

source $HOME/spacevim/core.vim
source $HOME/spacevim/layers.vim
source $HOME/spacevim/spacemacs.vim
"source g:spacevim_dir/core.vim
"source g:spacevim_dir/layers.vim
"source g:spacevim_dir/spacemacs.vim
