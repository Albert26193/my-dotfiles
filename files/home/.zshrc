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
echo "\e[35m keep simple, keep stupid \e[0m"
export PATH="/usr/local/opt/ncurses/bin:$PATH"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# bindkey -v
export LS_COLORS=${LS_COLORS}:'di=01;35'

#  --------------------- alias --------------------
alias "nv"="nvim"
alias "pip"="pip3"
alias "lg"="lazygit"
alias "lc"="leetgo"

# ---------------------- brew ------------------
export PATH=/opt/homebrew/bin:$PATH
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.cloud.tencent.com/homebrew-bottles"

# ---------------------- starship ------------------
eval "$(starship init zsh)"

# ---------------------- RIME ------------------
export RIME_DIR="$HOME/Library/Rime"

# -----------------------  go ------------------
export GOPATH="$HOME/go"
#export PATH="$PATH:$(go env GOPATH)/bin"

#------------------- fuzzy-shell -------------------
source "${HOME}/.fuzzy_shell/scripts/export.sh"
source "${HOME}/.fuzzy_shell/config.env"

alias "fs"="fuzzy --search"
alias "fj"="fuzzy --jump"
alias "fe"="fuzzy --edit"
alias "fh"="fuzzy --history"

#------------------- conda  -------------------
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup

#------------------- scripts  -------------------
source ${HOME}/.albert-scripts/export.sh
