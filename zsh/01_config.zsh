# ==============================#
#            config             #
# ==============================#

# golang
# export GOPATH=/Users/ibuki/Documents/StudyingGo/chap2
# export PATH=$GOPATH/bin:$PATH

# export PATH=$HOME/.nodebrew/current/bin:$PATH

# export PUB_CACHE=$FLUTTER_ROOT/.pub-cache

# export FLUTTER_ROOT=/Users/ibuki/develop/bin/flutter
# export PATH=$HOME/development/flutter/bin:$PATH
# export DART_SDK_PATH=$FLUTTER_ROOT/bin/cache/dart-sdk
# export PATH=＄PATH:$FLUTTER_ROOT/bin:$DART_SDK_PATH/bin:

# export PATH=$PATH:/Users/ibuki/Library/Android/sdk/platform-tools
# export PATH=$PATH:/Users/ibuki/AndroidStudioProjects/isetan_mens/mitsukoshi-isetan-mens-apps/.circleci

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# export PATH=$HOME/.nodebrew/current/bin:$PATH
# export PATH="$HOME/.anyenv/bin:$PATH"
# eval "$(nodenv init - --no-rehash)"

#################################  EXPORT  #################################
# JDK
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-13.jdk/Contents/Home
# export PATH=$PATH:/Library/Java/JavaVirtualMachines/openjdk-13.jdk/Contents/Home/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME

# 自作ShellScript
export AUTOPULL=/Users/ibuki/AndroidStudioProjects/
export PATH=$PATH:$AUTOPULL
export MYSHELL=/Users/ibuki/mySH/
export PATH=$PATH:$MYSHELL
export ADCS=/Users/ibuki/dotfiles/scripts/advent-calender-scripts
export PATH=$PATH:$ADCS
export DOTSCRIPT=/Users/ibuki/dotfiles/scripts/
export PATH=$PATH:$DOTSCRIPT
export PTMUX=/Users/ibuki/dotfiles/tmux
export PATH=$PATH:$PTMUX


# export PATH="$HOME/Library/Python/2.7/bin:$PATH"

# homebrew
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/opt/python@3.9/libexec/bin:$PATH
eval "$(/opt/homebrew/bin/brew shellenv)"


source ~/.nvm/nvm.sh

export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/pkgconfig"


# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-bin-gem-node

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

# 略語を展開する
zinit load momo-lab/zsh-abbrev-alias

# シンタックスハイライト
zinit light zsh-users/zsh-syntax-highlighting
zinit light paulirish/git-open
zinit ice as"program" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat


# Ctrl+r でコマンド履歴を検索
zinit load zdharma/history-search-multi-word

# 履歴補完
zinit light zsh-users/zsh-autosuggestions
bindkey '^j' autosuggest-accept
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"

source ~/powerlevel10k/powerlevel10k.zsh-theme