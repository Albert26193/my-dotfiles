#!/bin/bash

# [a]sk shell gpt with [c]ommand
# Dependency: git@github.com:TheR1D/shell_gpt.git
function ac {
    printf "${MY_UTILS_COLOR_YELLOW}%s${MY_UTILS_COLOR_RESET}" "input your command with args, like: ls -a: "
    local command_to_ask=""
    read command_to_ask
    local default_model="gpt-3.5-turbo-16k"
    printf "${MY_UTILS_COLOR_GREEN}%s${MY_UTILS_COLOR_RESET} " "input model: [gpt-4|gpt-4-32k|gpt-3.5|gpt-3.5-16k], default: "${default_model}""
    local target_model=""
    read target_model
    if [[ -z "${target_model}" ]]; then
        target_model="${default_model}"
    fi
    printf "%s\n" "model is "${target_model}""
    if yn_prompt "sure to ask gpt?"; then
        sgpt --role command --model "${target_model}" "${command_to_ask}"
    fi
}

# [a]sk [a] question with sgpt
# TODO: function to decouple
function aa {
    printf "${MY_UTILS_COLOR_YELLOW}%s${MY_UTILS_COLOR_RESET}" "Now begin our chat: "
    local command_to_ask=""
    read command_to_ask
    local default_model="gpt-3.5-turbo-16k"
    printf "${MY_UTILS_COLOR_GREEN}%s${MY_UTILS_COLOR_RESET} " "input model: [gpt-4|gpt-4-32k|gpt-3.5|gpt-3.5-16k], default: "${default_model}""
    local target_model=""
    read target_model
    if [[ -z "${target_model}" ]]; then
        target_model="${default_model}"
    fi
    printf "%s\n" "model is "${target_model}""
    if yn_prompt "sure to ask gpt?"; then
        sgpt --model "${target_model}" "${command_to_ask}"
    fi
}
