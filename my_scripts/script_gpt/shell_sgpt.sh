#!/bin/bash

# [a]sk shell gpt with [c]ommand
# Dependency: git@github.com:TheR1D/shell_gpt.git
function ac {
    printf "${MY_UTILS_COLOR_YELLOW}%s${MY_UTILS_COLOR_RESET}\n" "input your command with args, like: ls -a: "
    local command_to_ask=""
    read command_to_ask
    printf "${MY_UTILS_COLOR_GREEN}%s${MY_UTILS_COLOR_RESET}\n" "input model: [gpt-4|gpt-4-32k|gpt-3.5|gpt-3.5-16k], default: gpt-4"
    local target_model="gpt-4"
    read target_model
    if [[ -z "${target_model}" ]]; then
        target_model="gpt-4"
    fi
    printf "%s\n" "model is "${target_model}""
    if yn_prompt "sure to ask gpt?"; then
        sgpt --role command --model "${target_model}" "${command_to_ask}"
    fi
}
