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
[ -d ~/.config/nvim/ ] \
    && ln -s ~/.dotfiles/coc-settings.json ~/.config/nvim/ \
    || ln -s ~/.dotfiles/coc-settings.json ~/.vim/

# clone plugin managers
mkdir ~/tmux && git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
