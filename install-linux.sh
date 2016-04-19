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

# Install ag
apt-get install silversearcher-ag

# Install Vundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

files=".bashrc .gitconfig .tmux.conf .vimrc"
for file in $files; do
  ln -s $HOME/Projects/setup/$file $HOME/$file
done

# Install Vim plugins
vim +PluginInstall +qall
