#!/bin/sh

DOT_FILES=( .zshrc.antigen. hgrc .vimrc .tmux.conf .bashrc .ackrc .pyrc.py .zshrc)

for file in ${DOT_FILES[@]}
  do
    #if [ -a $HOME/$file ]; then
      #ln -s $HOME/dotfiles/$file $HOME/$file.dot
      #echo "ファイルが存在しますから.dotファイルつくるよ: $file"
    #else
      ln -s $HOME/dotfiles/$file $HOME/$file
      echo "シンボリックリンクを貼りました: $file"
    #fi
  done
