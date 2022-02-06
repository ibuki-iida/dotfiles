# ---------------------------------------------------------
# Zinit's installer
# ---------------------------------------------------------
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

# 履歴保存管理
HISTFILE=$HOME/.zsh-history # 履歴を保存するファイル
HISTSIZE=100000             # メモリ上に保存する履歴のサイズ
SAVEHIST=1000000            # 上述のファイルに保存する履歴のサイズ

# share .zshhistory
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/z-a-patch-dl \
    zdharma-continuum/z-a-as-monitor \
    zdharma-continuum/z-a-bin-gem-node
### End of Zinit's installer chunk

source $HOME/.zinit/bin/zinit.zsh

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# 履歴補完
zinit light zsh-users/zsh-autosuggestions
bindkey '^j' autosuggest-accept
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=244"
zinit light zdharma-continuum/fast-syntax-highlighting
# Ctrl+r でコマンド履歴を検索
zinit load zdharma-continuum/history-search-multi-word
# 略語を展開する
zinit load momo-lab/zsh-abbrev-alias

# シンタックスハイライト
# zinit light zsh-users/zsh-syntax-highlighting
zinit light paulirish/git-open
zinit ice as"program" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat
zinit ice from"gh-r" as"program"
zinit load junegunn/fzf-bin

zinit wait lucid atload"zicompinit; zicdreplay" blockf for zsh-users/zsh-completions

zplugin ice depth=1; zplugin light romkatv/powerlevel10k
### End of Zinit's installer chunk
# ---------------------------------------------------------
# Enable Powerlevel10k
# ---------------------------------------------------------

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# Add pyenv executable to PATH by adding
# the following to ~/.profile:

# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
#
# # Load pyenv automatically by appending
# # the following to ~/.zshrc:
#
# eval "$(pyenv init -)"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi



SCRIPT_DIR=$HOME/dotfiles
source $SCRIPT_DIR/zsh/01_config.zsh
source $SCRIPT_DIR/zsh/02_aliases.zsh
# source $SCRIPT_DIR/zsh/03_plugins.zsh
source $SCRIPT_DIR/zsh/04_setopt.zsh
source $SCRIPT_DIR/zsh/05_function.zsh
# source ~/powerlevel10k/powerlevel10k.zsh-theme

source $SCRIPT_DIR/zsh/p10k.zsh
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh