#!/bin/bash

target_dir="/Users/albert/waque_upload/"
absolute_file_path=$1

echo ${absolute_file_path}
# 检查test.md文件是否存在
if [ ! -f "${absolute_file_path}" ]; then
  echo "待上传文件不存在！退出当前进程！"
  exit 1
fi

# 检查是否包含url属性
url=$(awk '/url:/ {print $2}' ${absolute_file_path})
if [ -n "$url" ]; then
  echo "检测到 url 属性：$url"
  # 去除url属性
  sed -i '' '/url:/d' ${absolute_file_path}
fi

# 检查是否包含一级标题
title=$(awk '/^# / {print $0; exit}' ${absolute_file_path})
if [ -z "$title" ]; then
  echo "未检测到一级标题，请手动输入："
  read title
  echo "# $title" > temp.md
  echo "" >> temp.md
  echo "" >> temp.md
  echo "请将以下内容复制到${absolute_file_path}的顶部"
  echo "---------------------------"
  cat temp.md
  echo "---------------------------"
  rm temp.md
else
  echo "检测到一级标题：$title"
fi


# 在第一个一级标题后面加上日期
if [ -n "$title" ]; then
  first_line=$(grep -m 1 -n "^#" ${absolute_file_path} | cut -d ":" -f 1)
  today="$(date +"%Y-%m-%d") $(date +"%H:%M:%S")"
  sed -i '' "${first_line}s/^#.*$/& ${today}/" ${absolute_file_path}
  echo "已在第一个一级标题后面添加日期：$today"
fi

