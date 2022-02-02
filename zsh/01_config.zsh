# ==============================#
#            config             #
# ==============================#


#################################  EXPORT  #################################
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

#################################  HISTORY  #################################

# 履歴保存管理
HISTFILE=$HOME/.zsh-history # 履歴を保存するファイル
HISTSIZE=100000             # メモリ上に保存する履歴のサイズ
SAVEHIST=1000000            # 上述のファイルに保存する履歴のサイズ

# share .zshhistory
setopt inc_append_history   # 実行時に履歴をファイルにに追加していく
setopt share_history        # 履歴を他のシェルとリアルタイム共有する


#################################  COMPLEMENT  #################################

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

#################################  OTHERS  #################################

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

# Ctrl+r でコマンド履歴を検索
zinit load zdharma/history-search-multi-word

# 履歴補完
zinit light zsh-users/zsh-autosuggestions
bindkey '^j' autosuggest-accept
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

source ~/powerlevel10k/powerlevel10k.zsh-theme