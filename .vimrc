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
Bundle 'xmledit'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
filetype plugin indent on
" Bundle 'evervim'

"----------------------------------------------------
" 表示関係
"----------------------------------------------------
set autoindent
set nu
set ignorecase
set smartcase
set incsearch
set tabstop=4

set fileencodings=ucs-bom,euc-jp,default,latin1
"set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set enc=utf-8
set hlsearch
"set guifont=Source\ Code\ Pro:h16
set shiftwidth=4
set expandtab
".rhtml, .rbでタブ幅を2に変更
au BufNewFile,BufRead *.erb   set nowrap tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.rhtml set nowrap tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.rb    set nowrap tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.irb   set nowrap tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.yml   set nowrap tabstop=2 shiftwidth=2 expandtab

"----------------------------------------------------
" 移動など
"----------------------------------------------------
inoremap <silent> jj <ESC>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" let g:evervim_devtoken='S=s7:U=b9d47:E=145d04ca496:C=13e789b7899:P=1cd:A=en-devtoken:V=2:H=8f7ed7a2d1d9d2c3dab3ad7773327a58'

" vimrcを<Space>.で開く
nnoremap <Space>. :<C-u>edit $MYVIMRC<Enter>
" vimrcをすばやくリロード
nnoremap <Space>s. :<C-u>source $MYVIMRC<Enter>
" ヘルプ呼び出しを簡単に
nnoremap <C-h> :<C-u>help<Space>
" カーソル下のキーワードを:helpで引く
nnoremap <C-h><C-h> :<C-u>help<Space><C-r><C-w><Enter>
" カーソル下の単語でカレントディレクトリ以下をvimgrep
nnoremap <C-g><C-g> :<C-u>vimgrep /<C-r><C-w>/ **/* \| cw<Enter>
" 論理行移動と表示行移動のキーバインディングを入れ替える
noremap j gj
noremap k gk
noremap gj j
noremap gk k
" 日付の入力
inoremap <expr> ,df strftime('%Y-%m-%d %H:%M:%S')
inoremap <expr> ,ddd strftime('%Y-%m-%d')
inoremap <expr> ,dd strftime('%Y%m%d')
inoremap <expr> ,dt strftime('%H:%M:%S')
" 最後に変更が行われたテキストを選択
nnoremap gc `[v`]
vnoremap gc :<C-u>normal gc<Enter>
onoremap gc :<C-u>normal gc<Enter>
" カレントウィンドウのカーソル行のみをハイライト
autocmd!
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
" e ++enc={encoding} 文字コードを指定して開き直す
command! Cp932 edit ++enc=cp932
command! Eucjp edit ++enc=euc-jp
command! Iso2022jp edit ++enc=sio-2022-jp
command! Utf8 edit ++enc=utf-8
command! Jis Iso2022jp
command! Sjis Cp932
" tagsジャンプの時に複数有るときは一覧表示
nnoremap <C-]> g<C-]>
"----------------------------------------------------
" simplenote プラグイン
"----------------------------------------------------
" Bundle 'kana/vim-metarw'
" Bundle 'mattn/webapi-vim'
" Bundle 'mattn/vim-metarw-simplenote'
" let g:SimplenoteUsername = "hikalin8686@gmail.com"
" let g:SimplenotePassword = "bibiri"

syntax on
