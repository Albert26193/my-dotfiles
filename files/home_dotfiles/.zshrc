# --------------------- oh-my-zsh ---------------
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"

plugins=(git fzf-tab zsh-syntax-highlighting zsh-autosuggestions zsh-vi-mode colored-man-pages)

HISTFILE="${ZSH}/cache/.zsh_history"
ZSH_COMPDUMP="${ZSH}/cache/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

source $ZSH/oh-my-zsh.sh

# --------------------- zsh --------------------
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'

# --------------------- general --------------------
export TERM="xterm-256color"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LS_COLORS=${LS_COLORS}:'di=01;35'

echo "\e[35m keep simple, keep stupid \e[0m"

#  --------------------- alias --------------------
alias "nv"="nvim"
alias "python"="python3"
alias "pip"="pip3"
alias "tm"="tmux"
alias "rm"="rm -i"

# ---------------------- brew ------------------
eval "$(/opt/homebrew/bin/brew shellenv)"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.cloud.tencent.com/homebrew-bottles"