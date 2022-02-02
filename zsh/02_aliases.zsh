# ==============================#
#             alias             #
# ==============================#

alias ls="gls --color=auto"
alias eman='env LANG=C man'
alias man='env LANG=ja_JP.UTF-8 man'
alias ssh='~/bin/ssh-change-profile.sh'
alias findfzf='find . | fzf'
alias c='powered_cd'

alias nc='npm ci'
alias ndev='npm run dev'
alias dot='cd ~/dotfiles'
alias dotopen='open -a "Visual Studio Code" ~/dotfiles/zsh/'
alias ocot='open -a "CotEditor"'

# git
alias gpod='git pull origin develop'
alias gic='git checkout -'
alias gibc='git checkout -b'



if builtin command -v bat > /dev/null; then
  alias cat="bat"
fi
