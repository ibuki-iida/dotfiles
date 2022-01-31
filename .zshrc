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

#export PYENV_ROOT="$HOME/.pyenv"
#export PATH="$PYENV_ROOT/bin:$PATH"

# Load pyenv automatically by appending
# the following to ~/.zshrc:

#eval "$(pyenv init -)"

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
### End of Zinit's installer chunk


SCRIPT_DIR=$HOME/dotfiles
source $SCRIPT_DIR/zsh/plugins.zsh
#source $SCRIPT_DIR/zsh/config.zsh
source $SCRIPT_DIR/zsh/settings.zsh
source $SCRIPT_DIR/zsh/exports.zsh
source $SCRIPT_DIR/zsh/alias.zsh
source $SCRIPT_DIR/zsh/function.zsh
source $SCRIPT_DIR/zsh/p10k.zsh





# ---------------------------------------------------------
# eval
# ---------------------------------------------------------

eval "$(/opt/homebrew/bin/brew shellenv)"
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



. /opt/homebrew/opt/asdf/asdf.sh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh