# ---------------------------------------------------------
# Enable Powerlevel10k
# ---------------------------------------------------------

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Add pyenv executable to PATH by adding
# the following to ~/.profile:

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"

# Load pyenv automatically by appending
# the following to ~/.zshrc:

# eval "$(pyenv init -)"

# ---------------------------------------------------------
# Zinit's installer
# ---------------------------------------------------------
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# ---------------------------------------------------------
# plugin list
# ---------------------------------------------------------


# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

# ---------------------------------------------------------
# basic
# ---------------------------------------------------------

# 履歴保存管理
HISTFILE=$HOME/.zsh-history # 履歴を保存するファイル
HISTSIZE=100000             # メモリ上に保存する履歴のサイズ
SAVEHIST=1000000            # 上述のファイルに保存する履歴のサイズ

# share .zshhistory
setopt inc_append_history   # 実行時に履歴をファイルにに追加していく
setopt share_history        # 履歴を他のシェルとリアルタイム共有する


# ---------------------------------------------------------
# completion
# ---------------------------------------------------------

# enable completion# コマンド補完
autoload -Uz compinit && compinit

# 補完候補をそのまま探す -> 小文字を大文字に変えて探す -> 大文字を小文字に変えて探す
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'

# 補完方法毎にグループ化する。
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''

# 補完侯補をメニューから選択する。
# select=2: 補完候補を一覧から選択する。補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2


# ---------------------------------------------------------
# OTHERS
# ---------------------------------------------------------

# パスを直接入力してもcdする
setopt auto_cd
# 環境変数を補完
setopt AUTO_PARAM_KEYS
# disable ctrl+s, ctrl+q
setopt no_flow_control
# 略語を展開する
zinit load momo-lab/zsh-abbrev-alias
# シンタックスハイライト
zinit light zsh-users/zsh-syntax-highlighting
zinit light paulirish/git-open
zinit ice as"program" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat
# 以下はただのエイリアス設定
if builtin command -v bat > /dev/null; then
  alias cat="bat"
fi
# Ctrl+r でコマンド履歴を検索
zinit load zdharma/history-search-multi-word
# 履歴補完
zinit light zsh-users/zsh-autosuggestions
bindkey '^j' autosuggest-accept
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

source ~/powerlevel10k/powerlevel10k.zsh-theme
alias ls="gls --color=auto"

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ---------------------------------------------------------
# eval
# ---------------------------------------------------------

eval "$(/opt/homebrew/bin/brew shellenv)"
#PATH="$HOME/.anyenv/bin:$PATH"
#eval "$(nodenv init - --no-rehash)"


# ---------------------------------------------------------
# alias
# ---------------------------------------------------------
alias ls="gls --color=auto"
alias eman='env LANG=C man'
alias man='env LANG=ja_JP.UTF-8 man'
alias ssh='~/bin/ssh-change-profile.sh'


# ---------------------------------------------------------
# export
# ---------------------------------------------------------

# JDK
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME

# 自作ShellScript
export AUTOPULL=/Users/ibuki/AndroidStudioProjects/
export PATH=$PATH:$AUTOPULL

export MYSHELL=/Users/ibuki/mySH/
export PATH=$PATH:$MYSHELL

# export PATH="$HOME/Library/Python/2.7/bin:$PATH"

# homebrew
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/opt/python@3.9/libexec/bin:$PATH

export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/pkgconfig"
export LANG=ja_JP.UTF-8

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/ibuki/jetbrains/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/ibuki/jetbrains/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/ibuki/jetbrains/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/ibuki/jetbrains/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<



. /opt/homebrew/opt/asdf/asdf.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
