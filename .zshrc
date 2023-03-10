autoload -U compinit; compinit

fpath+=("$(brew --prefix)/share/zsh/site-functions")
autoload -U promptinit; promptinit
prompt pure
zstyle ':prompt:pure:prompt:success' color green

. /opt/homebrew/opt/asdf/libexec/asdf.sh

export PATH="/Users/jeff/.local/bin:$PATH"

alias gst='git status'
alias ga='git add'
alias gc='git commit'
alias gap='git add -p'
alias gg='git log --oneline --decorate --graph'
alias gga='gg --all'
alias gd='git diff'
alias gdc='git diff --cached'
alias grep='GREP_COLOR="7;33;40" LANG=C grep --color=auto'
