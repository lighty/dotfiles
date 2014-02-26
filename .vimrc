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

" 自動改行の抑制
set tw=0
highlight NonText guifg=darkgreen

"----------------------------------------------------
" 表示関係
"----------------------------------------------------
set nu
set autoindent
syntax on
set enc=utf-8
set fileencodings=euc-jp,sjis,cp932,utf-8
set hlsearch
set noet

"----------------------------------------------------
" 未分類
"----------------------------------------------------
"set paste
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
" vundle
"----------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/vundle.git/
call vundle#rc()
" original repos on github
" Bundle 'tpope/vim-fugitive'
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
" Bundle 'Smooth-Scroll'
Bundle 'xmledit'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-markdown'
filetype plugin indent on
" Bundle 'evervim'

"----------------------------------------------------
" camelcase - snake case
"----------------------------------------------------
Bundle 'tanabe/ToggleCase-vim'
nnoremap <silent> <C-k> :<C-u>call ToggleCase()<CR>
" Align
"----------------------------------------------------
:let g:Align_xstrlen = 3
Bundle 'Align'
vnoremap <C-l> :Align 

"----------------------------------------------------
" 表示関係
"----------------------------------------------------
set autoindent
set nu
set ignorecase
set smartcase
set incsearch


set fileencodings=ucs-bom,euc-jp,default,latin1
"set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set enc=utf-8
set hlsearch
"set guifont=Source\ Code\ Pro:h16
set tabstop=4
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
"nnoremap <C-]> g<C-]>

"----------------------------------------------------
" simplenote プラグイン
"----------------------------------------------------
" Bundle 'kana/vim-metarw'
" Bundle 'mattn/webapi-vim'
" Bundle 'mattn/vim-metarw-simplenote'

"----------------------------------------------------
" simplenote プラグイン
" mrtazz/simplenote.vim
"----------------------------------------------------
" Bundle 'mrtazz/simplenote.vim'
" Bundle 'tpope/vim-pathogen' 
" if filereadable(expand("~". "/.vimrc.local"))
"     " let g:SimplenoteUsername = ""
"     " let g:SimplenotePassword = ""
"     source ~/.vimrc.local
" endif
" nnoremap <C-f>n :tabe<CR>
" nnoremap <C-f>s :Simplenote -n<CR>
" nnoremap <C-f>l :Simplenote -l<CR>
" nnoremap <C-f>d :Simplenote -d<CR>

"----------------------------------------------------
" vimplenote プラグイン
" mattn/vimplenote.vim
"----------------------------------------------------
Bundle 'lighty/vimplenote-vim'
Bundle 'mattn/webapi-vim'
if filereadable(expand("~". "/.vimrc.local"))
    " let g:VimpleNoteUsername = ""
    " let g:VimpleNotePassword = ""
    source ~/.vimrc.local
endif
nnoremap <C-f>n :tabe<CR>
nnoremap <C-f>s :VimpleNote -n<CR>
nnoremap <C-f>l :VimpleNote -l<CR>
nnoremap <C-f>d :VimpleNote -d<CR>

" vimscript作成用
nnoremap ] :<C-u>source %<Enter>

"----------------------------------------------------
" windowのサイズ変更を楽uruする
"----------------------------------------------------
Bundle 'kana/vim-submode'
" submode.vim
" " http://d.hatena.ne.jp/thinca/20130131/1359567419
  " " ウィンドウサイズの変更キーを簡易化する
" " [C-w],[+]または、[C-w],[-]
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>+')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '+', '<C-w>-')
call submode#map('winsize', 'n', '', '-', '<C-w>+')

"----------------------------------------------------
"vim-auto-save
"----------------------------------------------------
Bundle 'vim-scripts/vim-auto-save'
let g:auto_save = 1

"----------------------------------------------------
"yankround.vim
"----------------------------------------------------
Bundle 'LeafCage/yankround.vim'
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)

"----------------------------------------------------
"pbcopy (for mac)
"----------------------------------------------------
nnoremap sc :call system("pbcopy", @0)<CR>

Bundle '2072/PHP-Indenting-for-VIm'
let g:PHP_vintage_case_default_indent = 1

syntax on
