#!/usr/bin/env bash

# symlink everything
ln -s ~/.dotfiles/.zshrc ~
ln -s ~/.dotfiles/.tmux.conf ~
ln -s ~/.dotfiles/.gitconfig ~
ln -s ~/.dotfiles/.config/nvim ~/.config/nvim
ln -s ~/.dotfiles/.config/lvim/config.lua ~/.config/lvim/config.lua

# clone plugin managers
mkdir ~/tmux && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
