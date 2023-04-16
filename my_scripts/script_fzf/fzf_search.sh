#!/bin/bash

# fuzzy search
# input: 
#       $1: search range
#       $2: ignore dirs
#       $3: search keyword
#       $4: another search keyword
# output:
#       search result
function fs {
    local root_dirs=(${jump_root_dirs[@]})
    local ignore_dirs=(${jump_ignore_dirs[@]})
    
    # 将 ignore_dirs 数组转化为 fd 的 --exclude 参数
    local exclude_args=()
    for dir in "${ignore_dirs[@]}"; do
        exclude_args+=("--exclude" "${dir}")
    done
    
    echo "${exclude_args[@]}" >&2
    read anykey
    # 循环处理 root_dirs 中的每个目录，并将搜索结果通过管道传递给 fzf
    local target_file=$(
    printf "%s\n" "${root_dirs[@]}" \
    | xargs -I {} fd --hidden "${exclude_args[@]}" --search-path "{}"\
    | fzf --query="$1$2"
    )
    echo "${target_file}"
    read anykey
}
