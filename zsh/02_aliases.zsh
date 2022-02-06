# ==============================#
#             alias             #
# ==============================#

alias ls="gls --color=auto"
alias eman='env LANG=C man'
alias man='env LANG=ja_JP.UTF-8 man'
alias ssh='~/bin/ssh-change-profile.sh'
alias ff='find . | fzf'
alias relo="exec $SHELL -l"
alias c='powered_cd'                                              # c でディレクトリ履歴から検索
alias nc='npm ci'                                                 # pj依存
alias ndev='npm run dev'                                          # pj依存
alias dot='cd ~/dotfiles'                                         # dotfilesに移動
alias dotz='cd ~/dotfiles/zsh'                                    # dotfiles/zshに移動
alias dota='cat ~/dotfiles/zsh/02_aliases.zsh'                    # aliasを表示
alias dotopen='open -a IntelliJ IDEA Ultimate" ~/dotfiles/zsh/'   # open zsh
alias ocot='open -a "CotEditor" '                                 # open
alias oij='open -a "IntelliJ IDEA Ultimate" '                     # open
alias ovi='open -a "Visual Studio Code" '                         # open
alias mod='chmod 700'                                             # 実行権限付与
alias gt='chrome_tab_activate.sh'                                 # Chrome Tab をプレビュー
alias backc='iterm_background_color.sh'                           # iTermのバックグラウンドカラー変更
alias backt='iterm_transparency.sh'                               # iTermのバックグラウンド透過度変更
alias wi='which -a'                                               # which 複数表示
alias sr='source ~/.zshrc'                                        # zshrc更新
alias blue='bluetooth-fzf.sh'

# git
alias gpull='git pull origin develop'
alias gic='git checkout -'
alias gbra='git checkout -b'
alias po='_git_push_fzf'                                          # 現在のブランチをoriginにpushする
alias gro='_git_remote_open'                                      # remoteに設定されているURLを開く



alias gs='_searchByGoogle'                                         #
# alias tt='_tmux_commands'                                         # tmuxコマンド集
alias opa='_open_launched_app'                                    # 起動中のアプリを表示、選択して起動する
alias fin='find ./ -name'                                          #

# ディレクトリ関連
alias cdd='fzf-cdr'                                               # fzf版cdd ファイル検索
alias cde='_easy_change_dir'                                      #./以下移動
alias lk='_look'                                                  # カレントディレクトリ以下をプレビューし選択して開く
alias lkk='_look_all'                                             #
alias cdf='_cd_opend_finder'                                      # 現在開いているfinderのディレクトリに移動

alias blshow='system_profiler SPBluetoothDataType -json'


# if builtin command -v bat > /dev/null; then
#   alias cat="bat"
# fi