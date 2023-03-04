#!/bin/bssh
# starship
eval "$(starship init zsh)"

# --------------------- zsh --------------------
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="ys"

plugins=(git fzf-tab autojump zsh-syntax-highlighting zsh-autosuggestions)

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
alias "sc"="ssh albert@aliyun0605"
alias "tm"="tmux"
alias "ll"="exa -a"

#  -------------------- function --------------------

my_scripts_dir="/Users/albert/my_script/"
my_scripts=("script_man/man_to_nvim.sh" 
            "script_waque/waque_upload.sh"
            "script_out/out_go.sh"
            "script_fzf/fzf_edit.sh"
            "script_git/git_add_commit.sh"
          )

for single_script in "${my_scripts[@]}"; do
  current_script="${my_scripts_dir}${single_script}"
  if [[ ! -f ${current_script} ]]; then
    echo "${current_script} does not exist"
  else
    source "${current_script}"
  fi
done

function cc() {
  cd ${1}
  local currentPath=$(pwd)
  local normalFileNum=$(ls -al| grep "^-"| wc -l| tr -d ' ')
  local dirFileNum=`ls -al| grep "^d"| wc -l| tr -d ' '`
  # totalNum=`expr ${normalFileNum} + ${dirFileNum}`
  local totalNum=$(( ${normalFileNum} + ${dirFileNum}))
  echo -e "\e[33m current path is: ${currentPath} \e[0m"
  echo -e "\e[35m total: ${totalNum} \e[0m"

  if [ ${totalNum} -le 15 ]
  then
    exa -al
  elif [ ${totalNum} -ge 51 ]
  then
    echo "files in current directory is more than 50"
  else 
    exa -a
  fi
}

mytreedu() {
  local depth=''

  while getopts "L:" opt ; do
    case "$opt" in
      L) depth="$OPTARG" ;;
    esac
  done

  shift "$((OPTIND-1))"

  if [ -z "$depth" ] ; then
    tree --du -d -shaC "$@"
  else   
    local PATTERN='(  *[^ ]* ){'"$depth"'}\['
    tree --du -d -shaC "$@" | grep -Ev "$PATTERN"
  fi
}

function jj() {
  j ${1}
  local currentPath=$(pwd)
  local normalFileNum=$(ls -al| grep "^-"| wc -l| tr -d ' ')
  local dirFileNum=`ls -al| grep "^d"| wc -l| tr -d ' '`
  # totalNum=`expr ${normalFileNum} + ${dirFileNum}`
  local totalNum=$(( ${normalFileNum} + ${dirFileNum}))
  #echo -e "\e[33m current path is: ${currentPath} \e[0m"
  echo -e "\e[35m total: ${totalNum} \e[0m"

  if [ ${totalNum} -le 15 ]
  then
    ls -al
  elif [ ${totalNum} -ge 51 ]
  then
    echo "files in current directory is more than 50"
  else 
    ls -a
  fi

}

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

# ---------------------- colorful-man ---------------
# export LESS_TERMCAP_mb=$'\e[1;32m'
# export LESS_TERMCAP_md=$'\e[1;32m'
# export LESS_TERMCAP_me=$'\e[0m'
# export LESS_TERMCAP_se=$'\e[0m'
# export LESS_TERMCAP_so=$'\e[01;33m'
# export LESS_TERMCAP_ue=$'\e[0m'
# export LESS_TERMCAP_us=$'\e[1;4;31m'

# ---------------------- pager ---------------
export PAGER='bat -p --number'
