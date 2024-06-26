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

" for Denite
" nnoremap <silent> <C-y><C-y> :<C-u>Denite file/rec<CR>
" nnoremap <silent> <C-y><C-g> :<C-u>Denite grep<CR>
" nnoremap <silent> <C-y><C-b> :<C-u>Denite buffer<CR>
" nnoremap <silent> <C-y><C-d> :<C-u>DeniteBufferDir file_rec<CR>
" autocmd FileType denite call s:denite_my_settings()
" function! s:denite_my_settings() abort
"   nnoremap <silent><buffer><expr> <CR>
"   \ denite#do_map('do_action')
"   nnoremap <silent><buffer><expr> d
"   \ denite#do_map('do_action', 'delete')
"   nnoremap <silent><buffer><expr> p
"   \ denite#do_map('do_action', 'preview')
"   nnoremap <silent><buffer><expr> q
"   \ denite#do_map('quit')
"   nnoremap <silent><buffer><expr> i
"   \ denite#do_map('open_filter_buffer')
"   nnoremap <silent><buffer><expr> <Space>
"   \ denite#do_map('toggle_select').'j'
" endfunction

filetype off

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

command! -nargs=* -range GitLog !git log -L<line1>,<line2>:%

" vim-auto-save
let g:auto_save = 1
" editorconfigでtrim_trailing_whitespaceにかかるのを防ぐため
let g:auto_save_in_insert_mode = 0

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
nnoremap <Leader>b :<C-u>Git blame<CR>
nnoremap <Leader>g :<C-u>GBrowse<CR>
vnoremap <Leader>g :'<,'>GBrowse<CR>

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

" for ale
let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_fixers = { 'ruby': ['rubocop'], 'typescript': ['prettier', 'eslint'] }
let g:ale_completion_enabled = 1
let g:ale_linters = {
\   'ruby': ['rubocop'],
\}

" quickrunのバッファエリアをスペース+qで閉じる
nnoremap <Leader>q : <C-u>bw! \[quickrun\ output\]<CR>

" quickrunでrspec実行
let g:quickrun_config = {}
let g:quickrun_config._ = {'runner':'vimproc'}
let g:quickrun_config.rspec =  { 'command': 'rspec', 'exec': "bundle exec spring rspec -f d %{expand('%:.')}:%{line('.')} %a" }
" todo 非同期とファイル名によるft設定 ref:https://celt.hatenablog.jp/entry/2014/04/01/202433"
nnoremap <Leader>rt :QuickRun rspec<CR>
nnoremap <Leader>rr :QuickRun<CR>

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
" inoremap {<Enter> {}<Left><CR><ESC><S-o>
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

" vim-easy-align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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
au BufNewFile,BufRead *.c     setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.coffee setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.css   setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.erb   setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.go    setlocal tabstop=4 shiftwidth=4 noexpandtab fenc=utf8
au BufNewFile,BufRead *.html  setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.irb   setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.js    setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.md    setlocal fenc=utf8
au BufNewFile,BufRead *.php   setlocal tabstop=4 shiftwidth=4 expandtab fenc=euc-jp
au BufNewFile,BufRead *.pp    setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.py    setlocal tabstop=4 shiftwidth=4 expandtab fenc=utf8
au BufNewFile,BufRead *.rake  setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.rb    setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.rhtml setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.slim  setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.sql   setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.tf    setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8 filetype=terraform
au BufNewFile,BufRead *.thor  setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8 filetype=ruby
au BufNewFile,BufRead *.ts    setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8 filetype=typescript
au BufNewFile,BufRead *.tsx,*.jsx setlocal filetype=typescriptreact
au BufNewFile,BufRead *.yaml  setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.yml   setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8

let g:python3_host_prog = expand('~/.pyenv/shims/python3')

colorscheme desert
syntax on

" terminalの設定
tnoremap <Esc> <C-\><C-n>

" deoplete(入力補完)
let g:deoplete#enable_at_startup = 1

" pip install sqlparse
if executable('sqlformat')
  command! -range=% SQLFmt <line1>,<line2>!sqlformat -r -k upper -
endif

" for fzf.vim
nnoremap <C-y><C-y> :GitFiles<CR>
nnoremap <C-y><C-g> :Rg<Space>

" for coc.nvim https://github.com/neoclide/coc.nvim

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> <C-]> <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" chrisbra/csv.vim
nnoremap <Leader>ca :%ArrangeColumn<CR>
nnoremap <Leader>cu :%UnArrangeColumn<CR>

" or markdown syntax hilight https://zenn.dev/kawarimidoll/articles/5490567f8194a4
augroup update_markdown_syntax
  autocmd!
  autocmd BufNew,BufEnter * if &filetype == 'markdown' | syntax match markdownError '\w\@<=\w\@=' | endif
augroup END

"タブ自体を移動する
nnoremap <Tab>l :+tabmove<CR>
nnoremap <Tab>h :-tabmove<CR>

