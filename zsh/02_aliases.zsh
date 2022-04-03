# ---------------------------------------------------------
# cd
# ---------------------------------------------------------
alias cdot='cd ~/dotfiles'                            # dotfilesに移動
alias cdoz='cd ~/dotfiles/zsh'                        # dotfiles/zshに移動
alias cdasp='cd ~/AndroidStudioProjects'              #
alias aspt='cd ~/AndroidStudioProjects/TrialAndError' #
alias aspb='cd ~/AndroidStudioProjects/Book_sample'   #
alias aspl='cd ~/AndroidStudioProjects/Learn'         #
alias asps='cd ~/AndroidStudioProjects/Sample'        #

# ---------------------------------------------------------
# open
# ---------------------------------------------------------
alias ocot='open -a "CotEditor" '                     # open
alias oij='open -a "IntelliJ IDEA Ultimate" '         # open
alias ovi='open -a "Visual Studio Code" '             # open

# ---------------------------------------------------------
# Git
# ---------------------------------------------------------
alias gipull='git pull origin develop'
alias gdev='git checkout develop'
alias gic='git checkout -'
alias gicb='git checkout -b'
alias gicm='(){git checkout -b feature/012-$1/main}'
alias gst='git status'
alias gcl='git clone'
alias gdevme='git merge develop'
alias gbra='git branch'

# -外部から---------------------------------------------------
alias po='_git_push_fzf'                              # 現在のブランチをoriginにpushする
alias gro='_git_remote_open'                          # remoteに設定されているURLを開く
# git checkout branchをfzfで選択
alias gche='git checkout $(git branch -a | tr -d " " |fzf --height 100% --prompt "CHECKOUT BRANCH>" --preview "git log --color=always {}" | head -n 1 | sed -e "s/^\*\s*//g" | perl -pe "s/remotes\/origin\///g")'
# 全てのファイルをgit checkout
alias gchea='git checkout $(git status -s | grep -v \? |  grep -E "^.M" | perl -pe "s/(?<=^.{0}).{3}//g")'

# ---------------------------------------------------------
# ディレクトリ関連
# ---------------------------------------------------------
alias cdd='fzf-cdr'                                   # fzf版cdd ファイル検索
alias cde='_easy_change_dir'                          #./以下移動
alias lk='_look'                                      # カレントディレクトリ以下をプレビューし選択して開く
alias lkk='_look_all'                                 #
alias cdf='_cd_opend_finder'                          # 現在開いているfinderのディレクトリに移動                                      #

# ---------------------------------------------------------
# プロジェクト関連
# ---------------------------------------------------------
alias cdpj='cd ~/AndroidStudioProjects/PJ/medicolle'
alias nc='npm ci'                                     # pj依存
alias ndev='npm run dev'                              # pj依存

# ---------------------------------------------------------
# ShellCommand短縮
# ---------------------------------------------------------
alias ls="gls --color=auto"
alias man='env LANG=ja_JP.UTF-8 man'
alias mod='chmod 755'                                  # 実行権限付与
alias wi='which -a'                                    # which 複数表示
alias sr='source ~/.zshrc'                             # zshrc更新

# ---------------------------------------------------------
# dotfiles関連
# ---------------------------------------------------------
alias alist='cat ~/dotfiles/zsh/02_aliases.zsh'        # aliasを表示
alias alivi='vi ~/dotfiles/zsh/02_aliases.zsh'         # aliasを編集
alias funlist='cat ~/dotfiles/zsh/04_function.zsh'     # funcを表示
alias myfunlist='cat ~/dotfiles/zsh/05_Myfunction.zsh' # Myfuncを表示
alias alivi='vi  ~/dotfiles/zsh/02_aliases.zsh'

# ---------------------------------------------------------
# 外部から
# ---------------------------------------------------------
alias ssh='~/bin/ssh-change-profile.sh'
alias ff='find . | fzf'
alias relo="exec $SHELL -l"
alias c='powered_cd'                                   # c でディレクトリ履歴から検索
alias eman='env LANG=C man'

alias blshow='system_profiler SPBluetoothDataType -json'
alias gs='_searchByGoogle'                             #
# alias tt='_tmux_commands'                            # tmuxコマンド集
alias opa='_open_launched_app'                         # 起動中のアプリを表示、選択して起動する
alias fin='find ./ -name'

alias gt='chrome_tab_activate.sh'                       # Chrome Tab をプレビュー
alias ghis='chrome_history.sh'
alias backc='iterm_background_color.sh'                 # iTermのバックグラウンドカラー変更
alias backt='iterm_transparency.sh'                     # iTermのバックグラウンド透過度変更
alias addbor='add_border.sh'                            # sipsコマンドで、画像に枠線をサクッとつける

alias blue='bluetooth-fzf.sh'
alias memo='_writeArticle'
alias mvmemo='_movePostedArticles'

# if builtin command -v bat > /dev/null; then
#   alias cat="bat"
# fi
