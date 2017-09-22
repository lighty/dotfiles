set nu
set autoindent
set enc=utf-8
set fileencodings=euc-jp,sjis,cp932,utf-8
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
  NeoBundle 'Align'
  NeoBundle 'tyru/open-browser.vim'
  NeoBundle 'vim-scripts/vim-auto-save'
  NeoBundle "kien/ctrlp.vim"
  call neobundle#end()
endif

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

" c-jはescとする
imap <C-j> <ESC>

" quickrunのバッファエリアをスペース+qで閉じる
nnoremap <Leader>q : <C-u>bw! \[quickrun\ output\]<CR>

".rhtml, .rbでタブ幅を2に変更
au BufNewFile,BufRead *.slim  setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.erb   setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.rhtml setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.html  setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.css   setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.rb    setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.rake  setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.py    setlocal tabstop=4 shiftwidth=4 expandtab fenc=utf8
au BufNewFile,BufRead *.irb   setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.yml   setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.pp    setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.js    setlocal tabstop=4 shiftwidth=4 expandtab fenc=utf8
au BufNewFile,BufRead *.ts    setlocal tabstop=4 shiftwidth=4 expandtab fenc=utf8 filetype=typescript
au BufNewFile,BufRead *.coffee setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.php   setlocal tabstop=4 shiftwidth=4 expandtab fenc=euc-jp
au BufNewFile,BufRead *.sql   setlocal tabstop=2 shiftwidth=2 expandtab fenc=utf8
au BufNewFile,BufRead *.md    setlocal fenc=utf8
syntax on
