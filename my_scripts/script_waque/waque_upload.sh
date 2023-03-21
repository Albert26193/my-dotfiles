function upload_to_waque() {
  #!/bin/bash
  local obsidian_dir="/Users/albert/Library/Mobile Documents/iCloud~md~obsidian/Documents/ob-master/"
  local target_dir="/Users/albert/waque_upload/"
  local origin_dir="$(pwd)"

  # 切换到ob目录下搜索操作
  cd "$obsidian_dir"
  local relative_file_name=$(fzf)
  local only_file_name=${relative_file_name##*/}
  local absolute_file_name=${obsidian_dir}${relative_file_name}

  echo "取出的文件名: ${only_file_name}"

  if [[ -n ${absolute_file_name} ]]; then
    # 切换目标目录
    cd "${target_dir}" 
    echo "已切换到目标目录 ${target_dir}"

    # 复制源文件到目标目录下
    cp "${absolute_file_name}" "${target_dir}"  
    local file_to_upload=${only_file_name}

    # 原始名m
    echo "待上传文件原名称: ${only_file_name}"

    # 循环直到用户输入一个合法的文件名（全部为英文字符）
    while ! [[ ${file_to_upload} =~ ^[[:alpha:]]+$ ]]; do
      echo "请输入要上传的文件名（仅支持英文字母）:"
      read file_to_upload
    done

    # 给文件名添加 Unix 时间戳
    file_to_upload="${file_to_upload}_$(date +%s).md"
    echo "待上传文件: $file_to_upload"

    # 移动待上传文件
    file_to_upload=${target_dir}${file_to_upload}
    old_file_in_target_dir=${target_dir}${only_file_name}
    mv "${old_file_in_target_dir}" "${file_to_upload}"
    
    # 对待上传文件预处理
    readonly EXE_FILE="/Users/albert/my_script/script_waque/waque_check.sh"
    source "${EXE_FILE}" "${file_to_upload}"

    #执行上传操作
    if [[ -n ${file_to_upload} ]]; then
      waque upload "${file_to_upload}"
    else
      echo "未选择任何文件\n"
      read any_key
    fi

    # 删除多余文件
    echo "确认删除除了 yuque.yml 以外的所有文件吗？[y/n]"
    read answer
    
    while [[ ${answer} != "y" && ${answer} != "n" ]]
    do
      echo "请输入 [y] or [n]"
      read answer
    done

    if [[ ${answer} == "y" ]];then
      find . ! -name 'yuque.yml' -type f -exec rm {} + 
      echo "已删除${target_dir}下除 yuque.yaml 所有文件" && ls -l 
    else
      echo "不删除任何文件" && ls -l
    fi
  fi

  # 切换原来目录
  cd "${origin_dir}" &&
  echo "已经切换回原始目录 ${origin_dir}"
}

