# --------------------- oh-my-zsh ---------------
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"

plugins=(git fzf-tab zsh-syntax-highlighting zsh-autosuggestions)

HISTFILE="${ZSH}/cache/.zsh_history"
ZSH_COMPDUMP="${ZSH}/cache/.zcompdump-${SHORT_HOST}-${ZSH_VERSION}"

source $ZSH/oh-my-zsh.sh

# --------------------- zsh --------------------
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=blue'

# --------------------- general --------------------
export TERM="xterm-256color"
echo "\e[35m nice to meet you 🚀\e[0m"
export PATH="/usr/local/opt/ncurses/bin:$PATH"

bindkey -v

export LS_COLORS=${LS_COLORS}:'di=01;35'

#  --------------------- alias --------------------
alias "pc"="proxychains4"
alias "nv"="nvim"
alias "python"="python3"
alias "pip"="pip3"
alias "tm"="tmux"
alias "ll"="ls -al"
alias "lg"="lazygit"

#  -------------------- function --------------------

my_scripts_dir="${HOME}/CodeSpace/my_dotfile/my_scripts/"
my_scripts=(
            "script_waque/waque_upload.sh"
            "script_out/out_go.sh"
            "script_fzf/fzf_export.sh"
            "script_fzf/fzf_search.sh"
            "script_fzf/fzf_edit.sh"
            "script_fzf/fzf_jump.sh"
            "script_git/git_add_commit.sh"
            "script_shell/shell_cl.sh"
            "script_shell/shell_tree_du.sh"
            "script_shell/shell_stat.sh"
            "script_shell/shell_man_nvim.sh"
            "script_shell/openai_key_store.sh"
            "script_shell/shell_openai.sh"
          )

for single_script in "${my_scripts[@]}"; do
  current_script="${my_scripts_dir}${single_script}"
  if [[ ! -f ${current_script} ]]; then
    echo "${current_script} does not exist"
  else
    source "${current_script}"
  fi
done

# --------------------- conda --------------------
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
  eval "$__conda_setup"
else
  if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
    . "/usr/local/anaconda3/etc/profile.d/conda.sh"
  else
    export PATH="/usr/local/anaconda3/bin:$PATH"
  fi
fi
unset __conda_setup
# <<< conda initialize <<<


# --------------------- nvm --------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.cloud.tencent.com/homebrew-bottles"

# ---------------------- rust ------------------
export PATH="$HOME/.cargo/bin:$PATH"

# ---------------------- brew ------------------
eval "$(/opt/homebrew/bin/brew shellenv)"
