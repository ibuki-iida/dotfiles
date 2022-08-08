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

# eval "$(pyenv init -)"

# export PATH=$HOME/.nodebrew/current/bin:$PATH
# export PATH="$HOME/.anyenv/bin:$PATH"
# eval "$(nodenv init - --no-rehash)"

#eval "$(/opt/homebrew/bin/brew shellenv)"
#PATH="$HOME/.anyenv/bin:$PATH"
#eval "$(nodenv init - --no-rehash)"

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
# . /opt/homebrew/opt/asdf/asdf.sh
#################################  EXPORT  #################################
# homebrew
typeset -U path PATH
path=(
  /opt/homebrew/bin(N-/)
  /opt/homebrew/sbin(N-/)
  /usr/bin
  /usr/sbin
  /bin
  /sbin
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /Library/Apple/usr/bin
  $path
)
export PATH=/opt/homebrew/bin:$PATH
export PATH=/opt/homebrew/opt/python@3.9/libexec/bin:$PATH
# JDK
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/openjdk-13.jdk/Contents/Home
# export PATH=$PATH:/Library/Java/JavaVirtualMachines/openjdk-13.jdk/Contents/Home/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH
export GO111MODULE=on
export PATH=$PATH:/Users/ibuki/exportAllArticles
# 自作ShellScript
export AUTOPULL=/Users/ibuki/AndroidStudioProjects/
export PATH=$PATH:$AUTOPULL
export MYSHELL=/Users/ibuki/mySH/
export PATH=$PATH:$MYSHELL
export ADCS=/Users/ibuki/dotfiles/scripts/advent-calender-scripts
export PATH=$PATH:$ADCS
export DOTSCRIPT=/Users/ibuki/dotfiles/scripts/
export PATH=$PATH:$DOTSCRIPT
# export PTMUX=/Users/ibuki/dotfiles/tmux
# export PATH=$PATH:$PTMUX
export LANG=ja_JP.UTF-8

# export PATH="$HOME/Library/Python/2.7/bin:$PATH"

# eval "$(/opt/homebrew/bin/brew shellenv)"


# source ~/.nvm/nvm.sh

export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/pkgconfig"
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")" [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

source ~/powerlevel10k/powerlevel10k.zsh-theme