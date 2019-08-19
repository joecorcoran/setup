#!/bin/sh

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Essentials
brew install git tmux nvim ruby-install chruby ripgrep

# Setup
if [ ! -d $HOME/Projects ]; then
  mkdir $HOME/Projects
fi
if [ ! -d $HOME/Projects/setup ]; then
  git clone https://github.com/joecorcoran/setup $HOME/Projects/setup
fi

# Vundle
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

files=".bashrc .gitconfig .tmux.conf .vimrc"
for file in $files; do
  ln -s $HOME/Projects/setup/$file $HOME/$file
done

# Install Vim plugins
vim +PluginInstall +qall
