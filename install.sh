#!/bin/sh

# Update
apt-get update -y

# Set locale
locale-gen en_US.UTF-8

# Remove tiny vim
apt-get remove -y vim-tiny

# Install packages
apt-get install -y vim tmux

# Copy config files
files=".vimrc .tmux.conf .tmux/3.tmux"
mkdir ~/.tmux
for file in $files; do
  curl "https://raw.githubusercontent.com/joecorcoran/setup/master/$file" > ~/$file
done
