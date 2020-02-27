#!/bin/sh

# Update
apt-get update -y

# Set locale
locale-gen en_US.UTF-8

# Install Vim and tmux
apt-get remove -y vim-tiny
apt-get install -y neovim tmux

# Install rg
apt-get install ripgrep

files=".bashrc .gitconfig .tmux.conf"
for file in $files; do
  ln -s $HOME/Projects/setup/$file $HOME/$file
done
mkdir -p $HOME/.config/nvim
ln -s $HOME/Projects/setup/init.vim $HOME/.config/nvim/init.vim

# Install Vim plugins
vim +PlugInstall +qall
