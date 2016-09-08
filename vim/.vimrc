"=========================================================================== "                                ~My vimrc~
"===========================================================================
" Author:        Fred Wang [http://kenshinji.com]
" Source:        https://github.com/kenshinji/dotfiles
"
"---------------------------------------------------------------------

" Want to set this before any others
" Mapping settings
let mapleader = ","
inoremap jk <esc>
inoremap <esc> <nop>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Add mapping for auto close
ino " ""<left>
ino ' ''<left>
ino ( ()<left>
ino [ []<left>
ino { {}<left>
ino {<CR> {<CR>}<ESC>O

function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.vim/' . a:directory . '/*'
  for config_file in split(glob(directory_splat), '\n')
    if filereadable(config_file)
        execute 'source' config_file
    endif
  endfor
endfunction

" Setup Vundle to manage my bundles
"-----------------------------------
filetype off " required!
set rtp+=~/.vim/bundles/vundle/
call vundle#rc("~/.vim/bundles/")

" Plugins are each listed in their own file. Loop and source ftw
"----------------------------------------------------------------
call s:SourceConfigFilesIn('rcplugins')


filetype plugin indent on " required!
syntax on

" Vimrc is split accross multiple files, so loop over and source each
"---------------------------------------------------------------------
call s:SourceConfigFilesIn('rcfiles')

set incsearch
set hlsearch
set laststatus=2
set nocompatible
set relativenumber
set nowritebackup
set nobackup
set guifont=Monaco:h14

syntax enable
if has('gui_running')
  set background=light
else
  set background=dark
endif
colorscheme solarized

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =
    
