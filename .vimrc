"----------------------------------------------------
" バックアップ関係
"----------------------------------------------------
" バックアップをとらない
set nobackup
" ファイルの上書きの前にバックアップを作る
" (ただし、backup がオンでない限り、バックアップは上書きに成功した後削除される)
set writebackup
" バックアップファイルを作るディレクトリ
"set backupdir=~/backup
" スワップファイルを作るディレクトリ
"set directory=~/swap
" スワップファイルを作らない
set noswapfile

highlight NonText guifg=darkgreen


"----------------------------------------------------
" 未分類
"----------------------------------------------------
" バッファをクリップボードと共有します
set clipboard+=unnamed

"----------------------------------------------------
" unite.vim
"----------------------------------------------------
" 入力モードで開始
let g:unite_enable_start_insert=1

"mru,reg,buf
noremap :um :<C-u>Unite file_mru -buffer-name=file_mru<CR>
noremap :ur :<C-u>Unite register -buffer-name=register<CR>
noremap :ub :<C-u>Unite buffer -buffer-name=buffer<CR>

"file current_dir
noremap :ufc :<C-u>Unite file -buffer-name=file<CR>
noremap :ufcr :<C-u>Unite file_rec -buffer-name=file_rec<CR>

"file file_current_dir
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
noremap :uffr :<C-u>UniteWithBufferDir file_rec -buffer-name=file_rec<CR>

" c-jはescとする
au FileType unite nnoremap <silent> <buffer> <c-j> <esc><CR>

" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"----------------------------------------------------
" Align
"----------------------------------------------------
:let g:Align_xstrlen = 3
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
" Bundle 'Source-Explorer-srcexpl.vim'
" Bundle 'trinity.vim'
" Bundle 'The-NERD-tree'
" Bundle 'taglist.vim'
Bundle 'thinca/vim-quickrun'
" Bundle 'kakkyz81/evervim'
" Bundle 'DRascal/evervim'
" Bundle 'unite.vim' 重い 
Bundle 'Smooth-Scroll'
filetype plugin indent on

"----------------------------------------------------
" 表示関係
"----------------------------------------------------
set autoindent
set nu
set tabstop=2
syntax on
set fileencodings=ucs-bom,euc-jp,default,latin1
set enc=utf-8
set hlsearch
set shiftwidth=2
set guifont=Source\ Code\ Pro:h16

au BufNewFile,BufRead *.rb  set nowrap tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.irb set nowrap tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.yml set nowrap tabstop=2 shiftwidth=2 expandtab

"----------------------------------------------------
" 移動など
"----------------------------------------------------
inoremap <silent> jj <ESC>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
