"----------------------------------------------------
" leaderをスペースに変更
"----------------------------------------------------
let mapleader=" "

" インサートモード時にバックスペースを使う
set backspace=indent,eol,start

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

" ステータスラインを表示させる
set laststatus=2
" Kaoriya版GVimのdefaultに近い表示
set statusline=%-(%f%m%h%q%r%w%)%=%{&ff}\|%{&fenc}\ %y%l,%c\ %0P

" 自動改行の抑制
set tw=0
highlight NonText guifg=darkgreen

"----------------------------------------------------
" 表示関係
"----------------------------------------------------
set nu
set autoindent
set enc=utf-8
set fileencodings=euc-jp,sjis,cp932,utf-8
set hlsearch
set noet

"----------------------------------------------------
" 未分類
"----------------------------------------------------
" バッファをクリップボードと共有します
set clipboard+=unnamed

"----------------------------------------------------
" コピペのset pasteが辛いので :a! ctrl+v でも良し
"----------------------------------------------------
set pastetoggle=<C-E>

"----------------------------------------------------
" neobundle
"----------------------------------------------------
set nocompatible
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
endif
NeoBundle 'Shougo/vimproc'
" original repos on github
NeoBundle 'tpope/vim-fugitive'
" NeoBundle 'gmarik/vundle'
NeoBundle 'Shougo/unite.vim' 

"----------------------------------------------------
"Coffeeのsyntax http://qiita.com/hts1004/items/75c7128289d2c8590080
"----------------------------------------------------
NeoBundle 'kchmck/vim-coffee-script'

" vimにcoffeeファイルタイプを認識させる
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
" インデント設定
autocmd FileType coffee    setlocal sw=2 sts=2 ts=2 et
" " オートコンパイル
"   "保存と同時にコンパイルする
" autocmd BufWritePost *.coffee silent make! 
"   "エラーがあったら別ウィンドウで表示
" autocmd QuickFixCmdPost * nested cwindow | redraw! 
" " Ctrl-cで右ウィンドウにコンパイル結果を一時表示する
" nnoremap <silent> <C-C> :CoffeeCompile vert <CR><C-w>h

" vim-scripts repos
" NeoBundle 'Source-Explorer-srcexpl.vim'
" NeoBundle 'trinity.vim'
" NeoBundle 'The-NERD-tree'
" NeoBundle 'taglist.vim'

" NeoBundle 'kakkyz81/evervim'
" NeoBundle 'DRascal/evervim'
" NeoBundle 'Smooth-Scroll'
NeoBundle 'xmledit'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-markdown'
filetype plugin indent on
filetype indent on
" NeoBundle 'evervim'

"----------------------------------------------------
" quickrun
"----------------------------------------------------
NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config = {}
let g:quickrun_config.javascript = {'command': 'node'}

"----------------------------------------------------
" unite.vim
"----------------------------------------------------
" 入力モードで開始
let g:unite_enable_start_insert=1
" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

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

" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>

" カーソル位置の単語をgrep検索
nnoremap <silent> ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>

" unite grep に ag(The Silver Searcher) を使う
if executable('ag')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

"----------------------------------------------------
" camelcase - snake case
"----------------------------------------------------
NeoBundle 'tanabe/ToggleCase-vim'
nnoremap <silent> <C-k> :<C-u>call ToggleCase()<CR>
" Align
"----------------------------------------------------
:let g:Align_xstrlen = 3
NeoBundle 'Align'
vnoremap <C-l> :Align 

"----------------------------------------------------
" リンクをオープン
"----------------------------------------------------
vnoremap <C-o> y:!open<Space><C-r>"<CR><CR>
NeoBundle 'tyru/open-browser.vim'
" カーソル下のURLをブラウザで開く
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)
" ググる
nnoremap <Leader>g :<C-u>OpenBrowserSearch<Space><C-r><C-w><Enter>

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
set tabstop=2
set expandtab
".rhtml, .rbでタブ幅を2に変更
au BufNewFile,BufRead *.slim  setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.erb   setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.rhtml setlocal tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.html  setlocal tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.rb    setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.rake  setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.irb   setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.yml   setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.js    setlocal tabstop=2 shiftwidth=2 expandtab
au BufNewFile,BufRead *.php   setlocal tabstop=4 shiftwidth=4 expandtab fenc=euc-jp
au BufNewFile,BufRead *.md    setlocal fenc=utf8
"au BufNewFile,BufRead *.php   setlocal tabstop=4 shiftwidth=4 expandtab
" macのcrontab編集用
set backupskip=/tmp/*,/private/tmp/*

"----------------------------------------------------
" 移動など
"----------------------------------------------------
" noremap <silent> jj <ESC>
" noremap <C-j> <Down>
" noremap <C-k> <Up>
" noremap <C-h> <Left>
" noremap <C-l> <Right>
imap <C-j> <ESC>
"<C-j>2回でハイライト消去
nnoremap <C-j><C-j> :<C-u>nohlsearch<CR><Esc>


" vimrcを<Space>.で開く
nnoremap <Space>. :<C-u>tabedit $MYVIMRC<Enter>
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
" autocmd!
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
" NeoBundle 'kana/vim-metarw'
" NeoBundle 'mattn/webapi-vim'
" NeoBundle 'mattn/vim-metarw-simplenote'

"----------------------------------------------------
" simplenote プラグイン
" mrtazz/simplenote.vim
"----------------------------------------------------
" NeoBundle 'mrtazz/simplenote.vim'
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
" gist.vim
"----------------------------------------------------
NeoBundle 'mattn/gist-vim'
let g:github_api_url = 'http://ghe.tokyo.pb/api/v3'

"----------------------------------------------------
" vimplenote プラグイン
" mattn/vimplenote.vim
"----------------------------------------------------
NeoBundle 'lighty/vimplenote-vim'
NeoBundle 'mattn/webapi-vim'
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
" slimのシンタックスハイライト
"----------------------------------------------------
NeoBundle "slim-template/vim-slim"
"----------------------------------------------------
" windowのサイズ変更を楽uruする
"----------------------------------------------------
NeoBundle 'kana/vim-submode'
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
NeoBundle 'vim-scripts/vim-auto-save'
let g:auto_save = 1

"----------------------------------------------------
"yankround.vim
"----------------------------------------------------
NeoBundle 'LeafCage/yankround.vim'
NeoBundle "kien/ctrlp.vim"

nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap gp <Plug>(yankround-gp)
nmap gP <Plug>(yankround-gP)
nmap <C-p> <Plug>(yankround-next)
nmap <C-n> <Plug>(yankround-prev)
let g:yankround_max_history = 50

"----------------------------------------------------
"pbcopy (for mac)
"----------------------------------------------------
nnoremap sc :call system("pbcopy", @0)<CR>

"----------------------------------------------------
"phpのswitchを良い感じにインデント
"----------------------------------------------------
NeoBundle '2072/PHP-Indenting-for-VIm'
let g:PHP_vintage_case_default_indent = 1

" gitの差分を表示するぜ
NeoBundle 'airblade/vim-gitgutter'
nnoremap <silent> ,gg :<C-u>GitGutterToggle<CR>
nnoremap <silent> ,gh :<C-u>GitGutterLineHighlightsToggle<CR>

"----------------------------------------------------
" ブレースの改行が気持ち悪いPSR2
"----------------------------------------------------
NeoBundle 'stephpy/vim-php-cs-fixer'

"----------------------------------------------------
" memolist
"----------------------------------------------------
NeoBundle 'glidenote/memolist.vim'
nnoremap <Leader>mn  :MemoNew<CR>
nnoremap <Leader>ml  :MemoList<CR>
nnoremap <Leader>mg  :MemoGrep<CR>
let g:memolist_memo_suffix = "md"
let g:memolist_template_dir_path = "~/memolist_templates"
"----------------------------------------------------
" Simple-Javascript-Indenter
"----------------------------------------------------
NeoBundle 'jiangmiao/simple-javascript-indenter'
" この設定入れるとshiftwidthを1にしてインデントしてくれる
let g:SimpleJsIndenter_BriefMode = 1
" この設定入れるとswitchのインデントがいくらかマシに
let g:SimpleJsIndenter_CaseIndentLevel = -1

"----------------------------------------------------
" Shougo/neocomplcache.vim
"----------------------------------------------------
NeoBundle 'Shougo/neocomplcache.vim'
let g:neocomplcache_enable_at_startup = 1
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"----------------------------------------------------
" syntastic
"----------------------------------------------------
" NeoBundle 'tpope/vim-pathogen' 
" execute pathogen#infect()
NeoBundle 'scrooloose/syntastic'

"----------------------------------------------------
" quickrunでphpunitを実行
" http://blog.ruedap.com/2011/02/25/vim-php-phpunit-quickrun
"----------------------------------------------------
augroup QuickRunPHPUnit
  autocmd!
  autocmd BufWinEnter,BufNewFile *test.php set filetype=php.unit
augroup END
" PHPUnit
let g:quickrun_config['php.unit'] = { 'command': '/usr/local/bin/phpunit_quickrun', 'cmdopt': 'php', 'exec': '%o %c %s' }

"----------------------------------------------------
" quickrunでrspecを実行
" http://qiita.com/Qureana/items/b057c934733554e05427
"----------------------------------------------------
augroup QuickRunRspec
  autocmd!
  autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END
let g:quickrun_config['ruby.rspec'] = { 'command': 'rspec' }
"let g:quickrun_config['ruby.rspec'] = {'command': 'rspec', 'cmdopt': "-l %{line('.')}", 'exec': ['bundle exec %c %o %s %a']}

"----------------------------------------------------
" markdownをquickrunで表示
"----------------------------------------------------
NeoBundle 'superbrothers/vim-quickrun-markdown-gfm'
let g:quickrun_config = {
\   'markdown': {
\     'outputter': 'browser'
\   }
\ }
let g:quickrun_config['ruby'] = { 'command': 'ruby', 'cmdopt': 'bundle exec', 'exec': '%o %c %s' }


"----------------------------------------------------
" git brows-remote
"----------------------------------------------------
command! -nargs=* -range GitBrowseRemote !git browse-remote --rev -L<line1>,<line2> <f-args> -- %

"----------------------------------------------------
" http://www.kaoriya.net/blog/2014/03/30/
"----------------------------------------------------
set undodir=~/vimundo

"----------------------------------------------------
" 削除キーでyankしない
"----------------------------------------------------
nnoremap x "_x
"nnoremap d "_d
nnoremap D "_D

"----------------------------------------------------
" ビジュアルモードの貼り付けでyankしない
"----------------------------------------------------
vnoremap <silent> <C-p> "0p<CR>


syntax on
