#!/bin/zsh

set -eu                               # エラーや未定義の変数に備える
DOTFILES_DIR=$(cd $(dirname $0); pwd) # dotfilesディレクトリの場所を、変数DOTFILES_DIRに教える
cd $DOTFILES_DIR                      # dotfilesディレクトリに移動する

for f in .??*; do                     # .から始まるファイルやフォルダに対して繰り返す
  [[ "$f" == ".git" ]] && continue    # シンボリックリンクを作りたくないファイルやフォルダを除外
  [[ "$f" == ".gitconfig" ]] && continue
  [[ "$f" == ".gitignore" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue
  [[ "$f" =~ .swp$ ]] && continue
  ln -snfv ${DOTFILES_DIR}/$f ~       # シンボリックリンクを作成
done


