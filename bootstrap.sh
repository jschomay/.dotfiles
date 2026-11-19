#!/usr/bin/env bash

DOTFILES="$HOME/.dotfiles"

# symlink $DOTFILES/$1 to ~/$1, backing up anything already there
link() {
  local src="$DOTFILES/$1" dest="$HOME/$1"
  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "ok      $dest"
    return
  fi
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    local backup="$dest.bak.$(date +%Y%m%d%H%M%S)"
    mv "$dest" "$backup"
    echo "backup  $dest -> $backup"
  fi
  mkdir -p "$(dirname "$dest")"
  ln -s "$src" "$dest"
  echo "link    $dest -> $src"
}

link .zshrc
link .tmux.conf
link .gitconfig
link .config/nvim

# clone plugin managers
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
fi
