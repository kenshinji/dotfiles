"=========================================================================== "                                ~My vimrc~
"===========================================================================
" Author:        Chris Toomey [http://ctoomey.com]
" Source:        https://github.com/christoomey/dotfiles
"
" My vimrc, mostly for rails & javascript development. I have organized
" all of my vimrc style configurations into individual files organized
" by functionality. These live in ~/.vim/rcfiles.
"
" I am using Vundle to manage my plugins, which is configured below
" Each plugin is configured in its own file in ~/.vim/rcplugins
"---------------------------------------------------------------------

" Want to set this before any others
" Mapping settings
let mapleader = ","
inoremap jk <esc>
inoremap <esc> <nop>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


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

if has("gui_running")
  if has("gui_gtk2")
    set guifont=Inconsolata\ 12
  elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h14
  elseif has("gui_win32")
    set guifont=Consolas:h11:cANSI
  endif
endif

set background=dark
if has('gui_running')
  let g:solarized_termcolors=256
else
  let g:solarized_termcolors=16
endif
colorscheme solarized

