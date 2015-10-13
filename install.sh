#!/bin/sh

# Update
apt-get update -y

# Set locale
locale-gen en_US.UTF-8

# Install Vim and tmux
apt-get remove -y vim-tiny
apt-get install -y vim tmux

# Set Vim as default editor
update-alternatives --set editor /usr/bin/vim.basic

# Install Vundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# Copy config files
if [ ! -d ~/.tmux ]; then
  mkdir ~/.tmux
fi
files=".bashrc .gitconfig .tmux.conf .tmux/3.tmux .vimrc"
for file in $files; do
  curl "https://raw.githubusercontent.com/joecorcoran/setup/master/$file" > ~/$file
done

# Install Vim plugins
vim +PluginInstall +qall
