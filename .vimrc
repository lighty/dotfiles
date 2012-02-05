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

"----------------------------------------------------
" 表示関係
"----------------------------------------------------
set nu
syntax on
set autoindent
set tabstop=2
set laststatus=2
set hlsearch "検索キーワードのハイライト

"----------------------------------------------------
" vundle
"----------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/vundle.git/
call vundle#rc()
Bundle 'gmarik/vundle'

" vim-scripts repos
Bundle 'Source-Explorer-srcexpl.vim'
Bundle 'trinity.vim'
Bundle 'The-NERD-tree'
Bundle 'taglist.vim'
filetype plugin indent on


