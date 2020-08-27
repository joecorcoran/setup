#!/bin/sh

# Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Essentials
brew install git tmux neovim rbenv chruby ripgrep

# Setup
if [ ! -d $HOME/Projects ]; then
  mkdir $HOME/Projects
fi
if [ ! -d $HOME/Projects/setup ]; then
  git clone https://github.com/joecorcoran/setup $HOME/Projects/setup
fi

files=".bashrc .gitconfig .tmux.conf"
for file in $files; do
  ln -s $HOME/Projects/setup/$file $HOME/$file
done
mkdir -p $HOME/.config/nvim
ln -s $HOME/Projects/setup/init.vim $HOME/.config/nvim/init.vim

# Install Vim plugins
vim +PlugInstall +qall
