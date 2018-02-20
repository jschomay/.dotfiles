#!/usr/bin/env bash

# symlink everything
ln -s ~/.dotfiles/.lein ~
ln -s ~/.dotfiles/.vim ~
ln -s ~/.dotfiles/.bashrc ~
ln -s ~/.dotfiles/.git-completion.bash ~
ln -s ~/.dotfiles/.tmux.conf ~
ln -s ~/.dotfiles/.ctags ~
ln -s ~/.dotfiles/.gitconfig ~
ln -s ~/.dotfiles/.git-prompt.sh ~
ln -s ~/.dotfiles/.vimrc ~

# clone plugin managers
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/tmux && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

