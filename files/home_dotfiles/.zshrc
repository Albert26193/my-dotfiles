# --------------------- oh-my-zsh ---------------
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"
#ZSH_THEME="linuxonly"
#ZSH_THEME="af-magic"

plugins=(git fzf-tab zsh-syntax-highlighting zsh-autosuggestions zsh-vi-mode colored-man-pages)

HISTFILE="${ZSH}/cache/.zsh_history"
ZSH_COMPDUMP="${ZSH}/cache/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

source $ZSH/oh-my-zsh.sh

# --------------------- zsh --------------------
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'

# --------------------- general --------------------
export TERM="xterm-256color"
echo "\e[35m keep simple, keep stupid \e[0m"
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# bindkey -v
export LS_COLORS=${LS_COLORS}:'di=01;35'

# --------------------- starship --------------------
eval "$(starship init zsh)"

#  --------------------- alias --------------------
alias "nv"="nvim"
alias "python"="python3"
alias "pip"="pip3"
alias "tm"="tmux"
alias "ll"="ls -l"
alias "rm"="rm -i"
