#補完設定をロードして設定
autoload -U compinit
compinit

#cdを省略
setopt auto_cd

#pushd
setopt auto_pushd

#tmuxとかmysqlの設定
export PATH=~/bin:/opt/local/bin:/opt/local/sbin:/opt/local/lib/mysql5/bin:$PATH

#プロンプト表示に関わる設定
PROMPT="%/%% "
PROMPT2="%_%% "
SPROMPT="%r is correct? [n,y,a,e]: "

#コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

#viライクキーバインド設定
bindkey -v

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

#aliasなど、マシンに依存した分を.bashrcに書いておいた
source ~/.bashrc
