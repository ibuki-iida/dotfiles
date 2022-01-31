# ==============================#
#             export            #
# ==============================#


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