"----------------------------------------------------
" バックアップ関係
"----------------------------------------------------
" バックアップをとらない
set nobackup
" ファイルの上書きの前にバックアップを作る
" (ただし、backup がオンでない限り、バックアップは上書きに成功した後削除される)
set writebackup
" バックアップをとる場合
set nobackup
" バックアップファイルを作るディレクトリ
"set backupdir=~/backup
" スワップファイルを作るディレクトリ
"set directory=~/swap

highlight NonText guifg=darkgreen

"----------------------------------------------------
" 表示関係
"----------------------------------------------------
:set nu
:set tabstop=2
:set autoindent
:syntax on
:set enc=utf-8
:set fileencodings=ucs-bom,euc-jp,default,latin1
:set hlsearch
set shiftwidth=2

"----------------------------------------------------
" vundle
"----------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/vundle.git/
call vundle#rc()
" original repos on github
" Bundle 'tpope/vim-fugitive'
Bundle 'Align'
Bundle 'gmarik/vundle'

" vim-scripts repos
Bundle 'Source-Explorer-srcexpl.vim'
Bundle 'trinity.vim'
Bundle 'The-NERD-tree'
Bundle 'taglist.vim'
filetype plugin indent on


