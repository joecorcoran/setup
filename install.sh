#!/bin/sh

apt-get update
apt-get remove vim-tiny
apt-get install vim tmux

files=".vimrc .tmux.conf .tmux/3.tmux"
mkdir ~/.tmux

for file in $files; do
  curl "https://raw.githubusercontent.com/joecorcoran/setup/master/$file" > ~/$file
done
