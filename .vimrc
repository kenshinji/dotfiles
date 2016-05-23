color desert
set relativenumber
set showtabline=2
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set number
set smartcase
set incsearch
set hlsearch
"set wildmenu
set showmatch
set guifont=Monaco:h16
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'vim-ruby/vim-ruby'

Plugin 'scrooloose/nerdtree.git'
Plugin 'rust-lang/rust.vim' " highlight rust syntax
Plugin 'phildawes/racer' " auto complete rust key words
Plugin 'Lokaltog/vim-powerline'
Plugin 'artur-shaik/vim-javacomplete2'
set laststatus=2
"set t_Co=256
"let g:Powerline_symbols='fancy'
"autocmd vimenter * NERDTree

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
syntax on
set hidden
let g:racer_cmd = "/Users/kenshinji/projects/racer/target/release/racer"
let $RUST_SRC_PATH="/Users/kenshinji/projects/rust/src/"
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" =====================================================================
" autocmd FileType python set omnifunc=pythoncomplete#Complete
filetype plugin indent on    " required
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
