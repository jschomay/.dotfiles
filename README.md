# Jeff’s dotfiles

Mostly just my vim, tmux, and bash configs.

### Install

Warning, this will replace some files in your home directory, and includes my own opinionated configs; read the source and use with care.

1. Clone this repo.
2. Symlink the files in this repo to your home directory.  You'll also need to clone the vim and tmux plugin managers.

(The bootstrap script will do step 2 for you.)

```bash
git clone https://github.com/jschomay/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles && source bootstrap.sh && cd -
```

For now, you need to install vim, tmux, brew, and what ever else on your own.

Also, add your name and email to `.gitconfg`.
