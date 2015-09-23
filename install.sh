#!/bin/sh

# Update
apt-get update -y

# Set locale
locale-gen en_US.UTF-8

# Install Vim and tmux
apt-get remove -y vim-tiny
apt-get install -y vim tmux

# Install Vundle
if [ ! -d "~/.vim/bundle" ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Copy config files
files=".vimrc .tmux.conf .tmux/3.tmux"
mkdir ~/.tmux
for file in $files; do
  curl "https://raw.githubusercontent.com/joecorcoran/setup/master/$file" > ~/$file
done
