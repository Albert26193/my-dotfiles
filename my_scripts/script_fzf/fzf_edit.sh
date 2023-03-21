function fv {
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
  "*.jpg"
  "*.png"
  "*.svg"
)

  # 将 ignore_dirs 数组转化为 fd 的 --exclude 参数
  local exclude_args=()
  for dir in "${ignore_dirs[@]}"; do
    exclude_args+=("--exclude" "${dir}")
  done

  # 使用 fd 命令搜索文件，并传递 --hidden 参数来搜索隐藏文件
  local target_file=$(fd --type f --hidden "${exclude_args[@]}" --search-path "${target_dir}" | fzf --query="${target_dir} $1 $2")
  nvim ${target_file}
}

