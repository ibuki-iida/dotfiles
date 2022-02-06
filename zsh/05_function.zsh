# ==============================#
#            function           #
# ==============================#


# ---------------------------------------------------------
# https://qiita.com/arks22/items/8515a7f4eab37cfbfb17#%E3%82%B3%E3%83%BC%E3%83%89
# c でディレクトリ履歴から検索
# ---------------------------------------------------------
# function chpwd() {
#   powered_cd_add_log
# }
#
# function powered_cd_add_log() {
#   local i=0
#   cat ~/.powered_cd.log | while read line; do
#     (( i++ ))
#     if [ i = 300 ]; then
#       sed -i -e "300,300d" ~/.powered_cd.log
#     elif [ "$line" = "$PWD" ]; then
#       sed -i -e "${i},${i}d" ~/.powered_cd.log
#     fi
#   done
#   echo "$PWD" >> ~/.powered_cd.log
# }
#
# function powered_cd() {
#   if [ $# = 0 ]; then
#     cd $(gtac ~/.powered_cd.log | fzf)
#   elif [ $# = 1 ]; then
#     cd $1
#   else
#     echo "powered_cd: too many arguments"
#   fi
# }
#
# _powered_cd() {
#   _files -/
# }
#
# compdef _powered_cd powered_cd
#
# [ -e ~/.powered_cd.log ] || touch ~/.powered_cd.log
# function chpwd() {
#   if [[ ! $PWD = $HOME ]] ; then
#     echo -n "${fg[yellow]}[list: ${fg[cyan]}$PWD${reset_color} ${fg[yellow]}] -> ${reset_color}"
#     ls
#   fi
#   local i=0
#   pwd_=$(echo $PWD | sed -e s@${HOME}@~@)
#   cat ~/.powered_cd.log | while read line; do
#     (( i++ ))
#     if [ "$line" = "$pwd_" ]; then
#       sed -i -e "${i},${i}d" ~/.powered_cd.log
#     fi
#   done
#   echo "${pwd_}" >> ~/.powered_cd.log
# }
#
# function powered_cd() {
#   case $# in
#     0 )
#       test -f ~/.powered_cd.log 2>/dev/null || touch ~/.powered_cd.log
#       cd "$(gtac ~/.powered_cd.log | fzf-tmux -r | sed -e s@~@${HOME}@)"
#     ;;
#     1 ) cd "$1" ;;
#     2 ) mv "$1" "$2" ;;
#     * ) echo "powered_cd: too many arguments" ;;
#   esac
# }
# ---------------------------------------------------------
# peco
# ---------------------------------------------------------
## コマンド履歴検索
peco-history-selection() {
  BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}

zle -N peco-history-selection
bindkey '^H' peco-history-selection

## コマンド履歴からディレクトリ検索・移動
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':completion:*' recent-dirs-insert both
  zstyle ':chpwd:*' recent-dirs-default true
  zstyle ':chpwd:*' recent-dirs-max 1000
  zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi

# function peco-cdr () {
#   local selected_dir="$(cdr -l | sed 's/^[0-9]\+ \+//' | peco --prompt="cdr >" --query "$LBUFFER")"
#   if [ -n "$selected_dir" ]; then
#     BUFFER="cd ${selected_dir}"
#       zle accept-line
#   fi
# }
# zle -N peco-cdr
# bindkey '^E' peco-cdr
#
# ## カレントディレクトリ以下のディレクトリ検索・移動
# function find_cd() {
#   local selected_dir=$(find . -type d | peco)
#   if [ -n "$selected_dir" ]; then
#     BUFFER="cd ${selected_dir}"
#     zle accept-line
#   fi
# }
# zle -N find_cd
# bindkey '^X' find_cd

# 自作Snippet
#function show_snippets() {
#  local snippets=$(cat ~/zsh_snippet | fzf | cut -d':' -f2-)
#  LBUFFER="${LBUFFER}${snippets}"
#  zle reset-prompt
#}
#zle -N show_snippets
#bindkey '^o' show_snippets

# fzf版cdd
function fzf-cdr() {
    target_dir=`cdr -l | sed 's/^[^ ][^ ]*  *//' | fzf`
    target_dir=`echo ${target_dir/\~/$HOME}`
    if [ -n "$target_dir" ]; then
        cd $target_dir
    fi
}

# function _easy_change_dir() {
#   local findOptions="-maxdepth 3 -type d -not -path './.git/*'"
#   local targetDir=$(eval "find . $findOptions" | fzf --bind "tab:reload(find {} $findOptions),ctrl-p:reload(find `dirname {}` $findOptions)" --preview 'tree -L 3 {}')
#   [ -z "$targetDir" ] && return
#   cd $targetDir
# }

# カレントディレクトリ以下をプレビューし選択して開く
# function _look() {
#   if [ "$1" = "-a" ]; then
#     local find_result=$(find . -type f -o -type l)
#   else
#     local find_result=$(find . -maxdepth 1 -type f -o -type l)
#   fi
#   local target_files=($(echo "$find_result" \
#     | sed 's/\.\///g' \
#     | grep -v -e '.jpg' -e '.gif' -e '.png' -e '.jpeg' \
#     | sort -r \
#     | fzf-tmux -p80% --select-1 --prompt 'vim ' --preview 'bat --color always {}' --preview-window=right:70%
#   ))
#   [ "$target_files" = "" ] && return
#   vim -p ${target_files[@]}
# }
#
# function _look_all() {
#   local target_files=($(find . -type f -not -path "./node_modules/*" \
#     | sed 's/\.\///g' \
#     | grep -v -e '.jpg' -e '.gif' -e '.png' -e '.jpeg' \
#     | sort -r \
#     | fzf-tmux -p80% --select-1 --prompt 'vim ' --preview 'bat --color always {}' --preview-window=right:70%
#   ))
#   [ "$target_files" = "" ] && return
#   vim -p ${target_files[@]}
# }
#
# # remoteに設定されているURLを開く
# # alias gro='_git_remote_open'
# function _git_remote_open() {
#   local remote=$(git remote show | fzf --select-1)
#   local url=$(git remote get-url $remote)
#   if [ "$url" = '' ]; then; return; fi
#   if ! echo $url | grep 'http' >/dev/null; then
#     # Bitbucketの場合
#     url=$(echo $url | sed 's/git@bitbucket.org:/https:\/\/bitbucket\.org\//g')
#     # GithubでSSHの場合
#     url=$(echo $url | grep -oP "(?<=@).*(?=.git)" | tr ':' '/' | sed 's/^/https:\/\//g')
#   fi
#   open $url
# }
#
# # 現在のブランチをoriginにpushする
# # alias po='_git_push_fzf'
# function _git_push_fzf() {
#   local remote=`git remote | fzf --select-1`
#   git push $1 ${remote} $(git branch | grep "*" | sed -e "s/^\*\s*//g")
# }
#
# # alias goo='_searchByGoogle'
# function _searchByGoogle() {
#     # 第一引数がない場合はpbpasteの中身を検索単語とする
#     [ -z "$1" ] && searchWord=`pbpaste` || searchWord=$1
#     open https://www.google.co.jp/search\?q\=$searchWord
# }

# tmuxコマンド集
# alias tt='_tmux_commands'
# function _tmux_commands() {
#   local command=$(cat <<-EOF | fzf --bind 'ctrl-y:execute-silent(echo {} | pbcopy)'
# 		resize
# 		rename-window
# 		man
# 		list-keys
# 		list-commands
# 		kill-window
# 		kill-session
# 		kill-server
# 		tmux
# EOF
#   )
#   test -z "$command" && return
#
#   case "${command}" in
#     'resize')
#       local actions=('Left' 'Right' 'Up' 'Down')
#       echo "${actions[@]}" \
#         | tr ' ' '\n' \
#         | fzf-tmux -p \
#           --prompt 'Press Ctrl-p > ' \
#           --bind 'ctrl-p:execute-silent(tmux resize-pane -$(echo {} | cut -c 1-1))'
#       ;;
#     'rename-window')
#       /bin/echo  -n 'INPUT NAME>'
#       read  name
#       tmux rename-window $name
#       ;;
#     'man')
#       man tmux
#       ;;
#     'tmux')
#       tmux
#       ;;
#     'list-keys' | 'list-commands')
#       tmux $command | less -S
#       ;;
#     'kill-session')
#       local sessionIds=($(tmux ls | fzf-tmux -p | awk -F ':' '{print $1}'))
#       test -z "$sessionIds" && return
#       for sessionId in ${sessionIds[@]}; do
#         tmux kill-session -t $sessionId
#       done
#       ;;
#     *)
#       tmux $command
#   esac
# }

# 起動中のアプリを表示、選択して起動する
# alias oaa='_open_launched_app'
# function _open_launched_app() {
#   local app=$(ps aux | awk -F '/' '{print "/"$2"/"$3}' | grep Applications | sort -u | sed 's/\/Applications\///g' | fzf )
#   test -z "$app" && return
#   open "/Applications/$app"
# }

# 現在開いているfinderのディレクトリに移動
# alias cdf='_cd_opend_finder'
# function _cd_opend_finder() {
#   cd "$(osascript -e 'tell app "Finder" to POSIX path of (insertion location as alias)')"
# }