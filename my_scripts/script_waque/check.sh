#!/bin/bash

set -x
# 获取文件名
file_name=$1

# 检查文件是否存在
if [ ! -f "${file_name}" ]; then
    echo "文件不存在！"
    exit 1
fi

# 检查文件是否以yaml开头
if [[ $(head -n 1 "${file_name}") != "---" ]]; then
    echo "文件格式不正确！请添加yaml字段！进程已退出"
    exit 1
fi

# 获取yaml字段的结束行号
end_yaml_line=$(awk '/^---$/{print NR; exit}' "${file_name}")

echo ${file_name}
# 检查文件是否存在以#开头的行
if grep -q "^#[^#]" "${file_name}"; then
    echo "第一个以#开头的行已经存在！"
else
    # 如果不存在以#开头的行，则提示用户输入并将其添加到yaml字段的下一行
    echo "请输入第一个以#开头的行："
    read first_line
    echo "$((end_yaml_line+1))i\\${first_line}\n"
    # mac 的sed 和 Linux有细微不同
    sed -i '' "$((4+1))i\
    ${first_line}" "${file_name}"
fi

