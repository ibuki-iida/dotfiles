# ==============================#
#             plugins           #
# ==============================#

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



# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
