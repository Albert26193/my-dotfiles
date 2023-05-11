#!/bin/bash

# 获取 Bash 历史记录并使用 fzf 进行交互式选择
function hh {
    local selected_command=$(history | fzf | awk '{$1=""; print $0}' | tr -d '\n')
    printf "you have selected ${MY_UTILS_COLOR_GREEN}%s${MY_UTILS_COLOR_RESET}\n" "${selected_command}"

    if yn_prompt "sure to execute the command?"; then
        eval "${selected_command}"
    else
        echo "not execute the command"
    fi
}
