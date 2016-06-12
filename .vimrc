"================================================================================================
"                                 <My vimrc>
"================================================================================================
" Author:         Fred Wang [http://kenshinji.com]
" Source:         http://github.com/kenshinji/dotfiles
"
" My vimrc, is still in to process of being completed. Inspired by other hackers, 
" I decided to organize all of my vimrc style configurations into individual
" files organized by functionality. These live in ~/.vim/rcfiles.
"------------------------------------------------------------------------------------------------
syntax enable
if has('gui_running')
  set background=light
else
  set background=dark
endif
colorscheme solarized
set nobackup
set nowritebackup
set relativenumber
set showtabline=2
set expandtab
set tabstop=2 shiftwidth=2 softtabstop=2
set autoindent
set number
set smartcase
set incsearch
set hlsearch
set laststatus=2
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


" Solarized plugin
Plugin 'altercation/vim-colors-solarized'

" CtrlP settings
Plugin 'kien/ctrlp.vim'
" Surround settings
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'

Plugin 'vim-ruby/vim-ruby'
Plugin 'elixir-lang/vim-elixir'

Plugin 'scrooloose/nerdtree.git'
Plugin 'rust-lang/rust.vim' " highlight rust syntax
Plugin 'phildawes/racer' " auto complete rust key words
Plugin 'Lokaltog/vim-powerline'
Plugin 'artur-shaik/vim-javacomplete2'
Plugin 'christoomey/vim-tmux-navigator'
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
" racer settings
let g:racer_cmd = "/Users/kenshinji/projects/racer/target/release/racer"
let $RUST_SRC_PATH="/Users/kenshinji/projects/rust/src/"

" ctrlp settings
" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0


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
autocmd FileType java setlocal omnifunc=javacomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete

function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.vim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
      execute 'source' config_file
    endif
  endfor
endfunction

call s:SourceConfigFilesIn('rcfiles')
