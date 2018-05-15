"=========================================================================== "                                ~My vimrc~
"===========================================================================
" Author:        Fred Wang [http://kenshinji.com]
" Source:        https://github.com/kenshinji/dotfiles
"
"---------------------------------------------------------------------
if has("syntax")
  syntax on
endif

" Want to set this before any others
" Mapping settings
let mapleader = ","
inoremap jk <esc>
inoremap <esc> <nop>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Add mapping for auto close
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O

function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/git/dotfiles/vim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
        execute 'source' config_file
    endif
  endfor
endfunction

" Setup Vundle to manage my bundles
"-----------------------------------
set nocompatible
filetype off " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
call s:SourceConfigFilesIn('rcplugins')
call s:SourceConfigFilesIn('rcfiles')
call vundle#end()

set incsearch
set hlsearch
set backspace=indent,eol,start
set laststatus=2
set nowritebackup
set nobackup
set ff=unix
set guifont=Monaco:h14

set number relativenumber

" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
" set list

if has('gui_running')
  set background=light
else
  set background=dark
endif
colorscheme solarized
filetype plugin indent on " required!
set modeline
set modelines=5

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
    
function! SwitchBuffer()
  b#
endfunction

nmap <Tab> :call SwitchBuffer()<CR>
	
