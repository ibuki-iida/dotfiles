# ==============================#
#          setopt               #
# ==============================#

# ---------------------------------------------------------
# setopt
# ---------------------------------------------------------
setopt inc_append_history   # 実行時に履歴をファイルにに追加していく
setopt share_history        # 履歴を他のシェルとリアルタイム共有する
setopt auto_cd					# パスを直接入力してもcdする
setopt AUTO_PARAM_KEYS			# 環境変数を補完
setopt no_flow_control			# disable ctrl+s, ctrl+q
setopt auto_param_slash			# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt mark_dirs				# ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt auto_menu				# 補完キー連打で順に補完候補を自動で補完
setopt interactive_comments		# コマンドラインでも # 以降をコメントと見なす
setopt magic_equal_subst		# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt complete_in_word			# 語の途中でもカーソル位置で補完
setopt print_eight_bit			# 日本語ファイル名等8ビットを通す
setopt extended_history			# record timestamp of command in HISTFILE
setopt hist_expire_dups_first	# delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt histignorealldups		# ヒストリーに重複を表示しない
setopt hist_save_no_dups		# 重複するコマンドが保存されるとき、古い方を削除する。
setopt hist_ignore_all_dups		# 同じコマンドをヒストリに残さない
setopt no_beep					# ビープ音を消す


# ---------------------------------------------------------
# zinit
# ---------------------------------------------------------
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

# cdrの設定
autoload -Uz is-at-least
if is-at-least 4.3.11
then
  autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
  add-zsh-hook chpwd chpwd_recent_dirs
  zstyle ':chpwd:*'    recent-dirs-max 500
  zstyle ':chpwd:*'    recent-dirs-default yes
  zstyle ':chpwd:*'    recent-dirs-file "$HOME/.cache/cdr/history"
  zstyle ':completion:*' recent-dirs-insert both
fi

# コマンドを途中まで入力後、historyから絞り込み
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end