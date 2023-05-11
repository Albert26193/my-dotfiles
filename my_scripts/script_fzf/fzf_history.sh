#!/bin/bash

#set -x
# 获取 Bash 历史记录并使用 fzf 进行交互式选择
function hh {
	local selected_command=$(history | fzf | awk '{$1=""; print $0}' | tr -d '\n')
	echo "${selected_command}"
	echo "are you sure to execute ${selected_command}?"
  local any_key=""
	read any_key
	eval "${selected_command}"
}
