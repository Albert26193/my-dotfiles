#!/bin/bash
# The file has been deprecated.
# please use LazyGit

menu() {
    echo "files to add:"
    for ((i = 0; i < ${#selected_items[@]}; ++i)); do
        local placeholder=" "
        if [[ -n ${selected_items[i]} ]]; then
            local placeholder="${green} +++ ${color_reset}"
        else
            local placeholder="${red} - ${color_reset}"
        fi
        echo -e "$((i + 1)) ${placeholder} ${my_options[i]}"
    done
}

gitam() {
    # define the colors
    local red="\033[31m"
    local green="\033[32m"
    local yellow="\033[33m"
    local blue="\033[34m"
    local purple="\033[35m"
    local cyan="\033[36m"
    local color_reset="\033[0m"

    # record current dir
    local origin_dir="$(pwd)"

    # to the root dir
    cd "$(git rev-parse --show-toplevel)"

    # add the files
    local my_options=($(git ls-files --others --exclude-standard --modified))
    local selected_items=(${my_options[@]})

    # choose file
    local prompt="Select a file to ${red}NOT ${color_reset}add (again to unselect, ENTER when done):  "
    local num="0"
    while [[ -n "${num}" ]]; do
        menu
        printf "${prompt} \n"
        read num
        if [[ "$num" =~ ^[0-9]+$ ]] && ((num > 0 && num <= ${#my_options[@]})); then
            ((num--))
            # msg="${my_options[num]} has been ${selected_items[num]:+un}selected"
            if [[ -n "${selected_items[num]}" ]]; then
                selected_items[num]=""
            else
                selected_items[num]="${my_options[num]}"
            fi
        else
            echo -e "${red}Invaild Num${color_reset}"
        fi
        # if the item is empty
        if [[ -z ${selected_items[@]} ]]; then
            menu
            echo -e "${red}NOTHING TO ADD!${color_reset}"
            break
        fi
    done

    #printf the files
    printf "${yellow} you have selected ${color_reset}"
    local msg=" nothing"
    for ((i = 0; i < ${#selected_items[i]}; ++i)); do
        if [[ -n "${selected_items[i]}" ]]; then
            printf "${green}\n $(((i + 1))):   %s${color_reset}" "${selected_items[i]}"
            local msg=""
        fi
    done
    echo "${msg}"

    # weather to exit
    local need_to_add="1"
    if [[ ${msg} = " nothing" ]]; then
        local need_to_add="0"
        local files_staged=($(git diff --cached --name-only))
        if [[ -n ${files_staged} ]]; then
            printf "add nothing, the git status is as follows: \n"
            git status --short
        else
            printf "${blue}add nothing, and the staged space is empty${color_reset}\n"
            read any_key
            exit 1
        fi
    fi

    # git add
    if [[ ${need_to_add} = "1" ]]; then
        local answer=""
        printf "sure to continue  ${yellow}git add${color_reset} ? input [y] or [n] : "
        read answer
        while [[ ${answer} != "y" && ${answer} != "n" ]]; do
            echo "input [y] or [n] ... "
            read answer
        done
        if [[ ${answer} == "y" ]]; then
            # add to staged
            for single_file in ${selected_items[@]}; do
                if [[ " ${selected_items[@]} " =~ " ${single_file} " ]]; then
                    git add "${single_file}"
                fi
            done
            echo "already add the files, now is the short git status"
            git status --short
        else
            echo "not add any file"
            git status --short
            exit 1
        fi
    fi

    # git commit
    local answer=""
    printf "sure to continue ${cyan}git commit${color_reset} ? input [y] or [n] "
    read answer
    while [[ ${answer} != "y" && ${answer} != "n" ]]; do
        echo "input [y] or [n] ... "
        read answer
    done
    if [[ ${answer} == "y" ]]; then
        local template_dir="/Users/albert/my_script/script_git/"
        git commit -t "${template_dir}git_template.txt"
        echo "already finish git commit, git log as follows: "
        git log --oneline --graph
    else
        echo "no commit"
        git status
        exit 1
    fi
}
