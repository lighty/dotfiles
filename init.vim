set nu
set autoindent
set enc=utf-8
set fileencodings=utf-8,euc-jp,sjis,cp932
set hlsearch
set noet
set pastetoggle=<C-E>
" バッファをクリップボードと共有します
set clipboard+=unnamed
set nobackup
set noswapfile
set nocompatible
" 検索時に大文字小文字をいい感じに扱う
set ignorecase
set smartcase
set noundofile
set showcmd 
set nf=alpha
set tabstop=2 
set shiftwidth=2 
set expandtab

" https://qiita.com/delphinus/items/00ff2c0ba972c6e41542
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif
" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  " 設定終了
  call dein#end()
  call dein#save_state()
endif
" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

nnoremap <silent> <C-y><C-y> :<C-u>Denite file_rec<CR>
nnoremap <silent> <C-y><C-b> :<C-u>Denite buffer<CR>
nnoremap <silent> <C-y><C-d> :<C-u>DeniteBufferDir file_rec<CR>

filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ } 
  NeoBundle 'glidenote/memolist.vim'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'typescript-vim'
  NeoBundle 'kchmck/vim-coffee-script'
  NeoBundle 'tpope/vim-markdown'
  NeoBundle 'thinca/vim-quickrun'
"  NeoBundle 'Align'
  NeoBundle 'tyru/open-browser.vim'
  NeoBundle 'vim-scripts/vim-auto-save'
  NeoBundle "kien/ctrlp.vim"
  NeoBundle 'nazo/pt.vim'
  NeoBundle 'mattn/emmet-vim'
  call neobundle#end()
endif

" Emmetで使いたかったのでinsert modeのときも使えるように
let imapleader="C-y"
" leaderをスペースに変更
let mapleader=" "

" リンクをオープン
vnoremap <C-o> y:!open<Space><C-r>"<CR><CR>
" カーソル下のURLをブラウザで開く
nmap <Leader>o <Plug>(openbrowser-open)
vmap <Leader>o <Plug>(openbrowser-open)

"<C-j>2回でハイライト消去
nnoremap <C-j><C-j> :<C-u>nohlsearch<CR><Esc>

"putをやりやすく
vnoremap <silent> <C-p> "0p<CR>

" memolist
nnoremap <Leader>mn  :MemoNew<CR>
nnoremap <Leader>ml  :MemoList<CR>
nnoremap <Leader>mg  :MemoGrep<CR>
let g:memolist_memo_suffix = "md"
let g:memolist_template_dir_path = "~/memolist_templates"
nnoremap [q :cprevious<CR>   " 前へ
nnoremap ]q :cnext<CR>       " 次へ
nnoremap [Q :<C-u>cfirst<CR> " 最初へ
nnoremap ]Q :<C-u>clast<CR>  " 最後へ

command! -nargs=* -range GitBrowseRemote !git browse-remote --rev -L<line1>,<line2> <f-args> -- %

"vim-auto-save
let g:auto_save = 1

" 便利
inoremap <C-j> <ESC>
nnoremap <Leader>t :<C-u>tabe<CR>
nnoremap <Leader>w :<C-u>q<CR>
nnoremap <Leader>v :<C-u>vsp<CR>
nnoremap <Leader>s :<C-u>sp<CR>
inoremap <C-f> <Right>
inoremap <C-b> <Left>

" for nvim
nnoremap <Leader>a :<C-u>NERDTree<CR>
nnoremap <Leader>f :<C-u>NERDTreeFind<CR>

" 同インデントへの移動
nnoremap <Leader>k :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%<' . line('.') . 'l\S', 'be')<CR>zz
nnoremap <Leader>j :call search('^'. matchstr(getline('.'), '\(^\s*\)') .'\%>' . line('.') . 'l\S', 'e')<CR>zz

" タグジャンプ
nnoremap <C-j> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

" 検索位置を中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz

" syntastic から rubocop を実行する設定
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_ruby_checkers = ['rubocop']
nnoremap <Leader>e :SyntasticCheck<CR>

" quickrunのバッファエリアをスペース+qで閉じる
nnoremap <Leader>q : <C-u>bw! \[quickrun\ output\]<CR>

" quickrunでrspec実行
let g:quickrun_config = {}
let g:quickrun_config._ = {'runner':'vimproc'}
let g:quickrun_config.rspec =  { 'command': 'rspec', 'exec': "bundle exec spring rspec -f d %{expand('%:.')}:%{line('.')} %a" }
" todo 非同期とファイル名によるft設定 ref:https://celt.hatenablog.jp/entry/2014/04/01/202433"
nnoremap <Leader>rt :QuickRun rspec<CR>

" ctrlP用のキーマップ 参考: https://qiita.com/oahiroaki/items/d71337fb9d28303a54a8
nnoremap <Leader>[ :<C-u>CtrlP<CR>
nnoremap <Leader>p :<C-u>CtrlPBuffer<CR>

" タブ間の移動
nnoremap <C-l> gt
nnoremap <C-h> gT

" easy-motion
map  <Leader><Leader>f <Plug>(easymotion-bd-f)
nmap <Leader><Leader>f <Plug>(easymotion-overwin-f)
map  <Leader><Leader>w <Plug>(easymotion-bd-w)
nmap <Leader><Leader>w <Plug>(easymotion-overwin-w)
map  <Leader><Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader><Leader>L <Plug>(easymotion-overwin-line)
" nmap s <Plug>(easymotion-overwin-f2)

" init.vimの編集
nnoremap <Leader>ie :tabe ~/.config/nvim/init.vim<CR>
nnoremap <Leader>ir :source ~/.config/nvim/init.vim<CR>

" 英かなでC-pを↑にマップしているのを打ち消す
inoremap <UP> <C-p>

" 括弧の補完 https://qiita.com/ykyk1218/items/ab1c89c4eb6a2f90333a
" inoremap {<Enter> {}<Left><CR><ESC><S-o><tab>
" inoremap [ []<Left>
" inoremap ( ()<Left>
" inoremap " ""<Left>
" inoremap ' ''<Left>
" inoremap ` ``<Left>

" https://gist.github.com/pinzolo/8168337
function! s:Clip(data)
  let @*=a:data
  echo "clipped: " . a:data
endfunction
command! -nargs=0 ClipPath call s:Clip(expand('%:.'))
command! -nargs=0 ClipPathLine call s:Clip(expand('%:.') . ":" . line('.'))
command! -nargs=0 ClipFile call s:Clip(expand('%:t'))
command! -nargs=0 ClipDir  call s:Clip(expand('%:p:h'))
nnoremap <Leader>yp :ClipPathLine<CR>
nnoremap <Leader>yo :ClipPath<CR>

" submode
call submode#enter_with('winmove', 'n', '', 's', '<Esc>')
call submode#map('winmove', 'n', '', 'h', '<C-w>h')
call submode#map('winmove', 'n', '', 'j', '<C-w>j')
call submode#map('winmove', 'n', '', 'k', '<C-w>k')
call submode#map('winmove', 'n', '', 'l', '<C-w>l')
call submode#enter_with('winsize', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('winsize', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('winsize', 'n', '', '<C-w>-', '<C-w>-')
call submode#enter_with('winsize', 'n', '', '<C-w>+', '<C-w>+')
call submode#map('winsize', 'n', '', '<', '<C-w><')
call submode#map('winsize', 'n', '', '>', '<C-w>>')
call submode#map('winsize', 'n', '', '-', '<C-w>-')
call submode#map('winsize', 'n', '', '+', '<C-w>+')

".rhtml, .rbでタブ幅を2に変更
au BufNewFile,BufRead *.slim  setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.erb   setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.rhtml setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.html  setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.css   setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.rb    setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.thor  setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8 filetype=ruby
au BufNewFile,BufRead *.rake  setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.py    setlocal tabstop=4 shiftwidth=4 expandtab fenc=utf8
au BufNewFile,BufRead *.irb   setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.yml   setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.pp    setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.js    setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.ts    setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8 filetype=typescript
au BufNewFile,BufRead *.coffee setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.php   setlocal tabstop=4 shiftwidth=4 expandtab fenc=euc-jp
au BufNewFile,BufRead *.sql   setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.yaml  setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.c     setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.md    setlocal fenc=utf8

let g:python3_host_prog = expand('~/.pyenv/shims/python3')

colorscheme desert
syntax on
