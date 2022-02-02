# ==============================#
#            function           #
# ==============================#


# ---------------------------------------------------------
# https://qiita.com/arks22/items/8515a7f4eab37cfbfb17#%E3%82%B3%E3%83%BC%E3%83%89
# c でディレクトリ履歴から検索
# ---------------------------------------------------------
function chpwd() {
  powered_cd_add_log
}

function powered_cd_add_log() {
  local i=0
  cat ~/.powered_cd.log | while read line; do
    (( i++ ))
    if [ i = 300 ]; then
      sed -i -e "300,300d" ~/.powered_cd.log
    elif [ "$line" = "$PWD" ]; then
      sed -i -e "${i},${i}d" ~/.powered_cd.log
    fi
  done
  echo "$PWD" >> ~/.powered_cd.log
}

function powered_cd() {
  if [ $# = 0 ]; then
    cd $(gtac ~/.powered_cd.log | fzf)
  elif [ $# = 1 ]; then
    cd $1
  else
    echo "powered_cd: too many arguments"
  fi
}

_powered_cd() {
  _files -/
}

compdef _powered_cd powered_cd

[ -e ~/.powered_cd.log ] || touch ~/.powered_cd.log

# ---------------------------------------------------------
# peco
# ---------------------------------------------------------

## コマンド履歴検索
function peco-history-selection() {
  BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N peco-history-selection
bindkey '^H' peco-history-selection

## コマンド履歴からディレクトリ検索・移動
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':completion:*' recent-dirs-insert both
  zstyle ':chpwd:*' recent-dirs-default true
  zstyle ':chpwd:*' recent-dirs-max 1000
  zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi
function peco-cdr () {
  local selected_dir="$(cdr -l | sed 's/^[0-9]* *//' | peco)"
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
}
zle -N peco-cdr
bindkey '^D' peco-cdr

## カレントディレクトリ以下のディレクトリ検索・移動
function find_cd() {
  local selected_dir=$(find . -type d | peco)
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
}
zle -N find_cd
bindkey '^X' find_cd