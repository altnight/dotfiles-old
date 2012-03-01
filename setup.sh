#!/bin/bash

DOT_FILES=( .vimrc .tmux.conf .bashrc)

for file in ${DOT_FILES[@]}
do
  if [ -a $HOME/$file ]; then
    ln -s $HOME/dotfiles/$file $HOME/$file.dot
    echo "既にファイルが存在します: $file"
  else
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo "シンボリックリンクを貼りました: $file"
  fi
done
