# Jeff’s dotfiles

Mostly just my vim*, tmux, and bash configs.

* Note, configured for neovim.

### Install

Warning, this will replace some files in your home directory, and includes my own opinionated configs; read the source and use with care.

1. Clone this repo.
2. Symlink the files in this repo to your home directory.  
3. You'll also need to clone the tmux plugin manager if you want that and follow the install steps.

(The bootstrap script will do step 2 and 3 for you.)

```bash
git clone https://github.com/jschomay/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles && source bootstrap.sh && cd -
```

The bootstrap script backs up anything already in the way (e.g. `~/.config/nvim.bak.<timestamp>`) before linking, and is safe to re-run.

For now, you need to install neovim, tmux, brew, and what ever else on your own.

### Neovim

The nvim config is [LazyVim](https://lazyvim.github.io). Customizations live in `lua/config/*.lua` and `lua/plugins/custom.lua`; enabled extras are in `lazyvim.json`.

On a new machine, for a clean start move aside any old nvim data first:

```bash
for d in ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim; do [ -e $d ] && mv $d $d.bak; done
```

Then open `nvim` (plugins install automatically) and run `:Lazy restore` to match the versions pinned in `lazy-lock.json`.

Also, add your name and email to `.gitconfg`.
