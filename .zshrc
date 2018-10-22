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

#プロンプト表示に関わる設定
PROMPT="%/%% "
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

#勝手に統計情報を出してくれる
REPORTTIME=3

#補完候補を矢印キーなどで選択出来るようにする
zstyle ':completion:*:default' menu select
