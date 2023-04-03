function show_all_files {
    # 显示文件内容
    local currentPath=$(pwd)
    local normalFileNum=$(ls -al| grep "^-"| wc -l| tr -d ' ')
    local dirFileNum=`ls -al| grep "^d"| wc -l| tr -d ' '`
    local totalNum=$(( ${normalFileNum} + ${dirFileNum}))
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


function j {
    #local target_dir="/Users/albert/CodeSpace/"
    local target_dir="/Users/albert/CodeSpace"
    local ignore_dirs=(
    "node_modules"
    ".git"
    "dist"
    ".cache"
    "voice-print"
    "lodash"
    "from_github"
    "assets"
    "image"
    "images"
    "static"
    "data"
)

  # 将 ignore_dirs 数组转化为 fd 的 --exclude 参数
  local exclude_args=()
  for dir in "${ignore_dirs[@]}"; do
      exclude_args+=("--exclude" "${dir}")
  done

  # 使用 fd 命令搜索文件，并传递 --hidden 参数来搜索隐藏文件
  local target_file=$(fd --hidden "${exclude_args[@]}" --search-path "${target_dir}" | fzf --query="${target_dir} $1 $2")
  local father_dir=$(dirname "${target_file}")
  cd ${father_dir}
}

function jj {
    local target_dir="/Users/albert/CodeSpace"
    local ignore_dirs=(
    "node_modules"
    ".git"
    "dist"
    ".cache"
    "voice-print"
    "lodash"
    "from_github"
    "assets"
    "image"
    "images"
    "static"
    "data"
)

  # 将 ignore_dirs 数组转化为 fd 的 --exclude 参数
  local exclude_args=()
  for dir in "${ignore_dirs[@]}"; do
      exclude_args+=("--exclude" "${dir}")
  done

  # 使用 fd 命令搜索文件，并传递 --hidden 参数来搜索隐藏文件
  local target_file=$(fd --type --hidden "${exclude_args[@]}" --search-path "${target_dir}" | fzf --query="${target_dir} $1 $2")

  if [-d "${target_file}"]; then
      cd "${target_file}" && show_all_files
  elif [-f "${target_file}"]; then
      j "${target_file}" && show_all_files
  else
      exit(1)
  fi

}
