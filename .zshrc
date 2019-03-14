#補完設定をロードして設定
autoload -U compinit
compinit

#cdを省略
setopt auto_cd

#pushd
setopt auto_pushd

#ブレースを展開してくれる
setopt brace_ccl

#tmuxとかmysqlの設定
export PATH=~/bin:/opt/local/bin:/opt/local/sbin:/opt/local/lib/mysql5/bin:$PATH
export PATH=$HOME/.pyenv/shims:$PATH

# 便利スクリプト読み込み
export PATH=$HOME/bin:$PATH


#プロンプト表示に関わる設定
PROMPT="%m:%c %n$ "
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: "
autoload -Uz colors
colors

#コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

#viライクキーバインド設定
bindkey -v

# Ctrl+a Ctrl+e が効かないので
bindkey -e

#コマンド履歴検索機能
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

#先方予測機能
#autoload predict-on
#predict-on

bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

#漢の引用 色つけ系
## Alias configuration
#
# expand aliases before completing
#
setopt complete_aliases # aliased ls needs if file/dir completions work
alias where="command -v"
alias j="jobs -l"
case "${OSTYPE}" in
freebsd*|darwin*)
  alias ls="ls -G -w"
  ;;
linux*)
  alias ls="ls --color"
  ;;
esac
alias la="ls -a"
alias lf="ls -F"
alias ll="ls -la"
alias du="du -h"
alias df="df -h"
alias su="su -l"

# git
alias gs="git status"
alias gd="git diff --color"
alias gcm="git commit"
alias gch="git checkout"
alias ga="git add"
alias gp="git pull"

alias pt="pt --global-gitignore"

#勝手に統計情報を出してくれる
REPORTTIME=3

#補完候補を矢印キーなどで選択出来るようにする
zstyle ':completion:*:default' menu select

# http://suzutan.hateblo.jp/entry/2017/12/05/165204
function peco-repo-list () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-repo-list
bindkey '^t' peco-repo-list
function peco-git-browse () {
    github_repo=$(ghq list | peco)
    GITHUB_HOST=$(echo ${github_repo} | cut -d "/" -f 1) hub browse $(echo ${github_repo} | cut -d "/" -f 2,3)
}
zle -N peco-git-browse
bindkey '^y' peco-git-browse

# https://ambidata.io/blog/2018/03/15/ampy/
export AMPY_PORT=/dev/tty.SLAB_USBtoUART

# for nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH

# for rbenv
export PATH=$HOME/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# for imagemagic
export PKG_CONFIG_PATH=/usr/local/Cellar/imagemagick@6/6.9.10-14/lib/pkgconfig

# for tmuxinator
export EDITOR=/usr/local/bin/vim
[[ -s /Users/lighty/.tmuxinator/scripts/tmuxinator ]] && source /Users/lighty/.tmuxinator/scripts/tmuxinator

# for nvim
export XDG_CONFIG_HOME=~/.config
alias vim="nvim"
