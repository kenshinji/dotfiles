"===========================================================================
"                                ~My vimrc~
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
let mapleader = "\<Space>"

function! s:SourceConfigFilesIn(directory)
  let directory_splat = '~/.vim/' . a:directory . '/*'
  echom directory_splat
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
echom ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
call s:SourceConfigFilesIn('rcplugins')


filetype plugin indent on " required!
syntax on

" Vimrc is split accross multiple files, so loop over and source each
"---------------------------------------------------------------------
call s:SourceConfigFilesIn('rcfiles')
