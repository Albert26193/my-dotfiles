#!/bin/bash

# source utils functions
git_root=$(git rev-parse --show-toplevel 2>/dev/null)
source "${git_root}/scripts/utils.sh"

###################################################
# description: link all dot files to target path
#      return: nothing
###################################################
function create_config_softlinks {
	local dot_file_dirs="${git_root}/files"
	local home_dot_path="${dot_file_dirs}/home_dotfiles"
	local home_dot_files=($(ls -al ${home_dot_path} | tail -n +4 | awk '{print $9}'))
	local config_dot_path="${dot_file_dirs}/config_dotfiles"
	local config_dot_files=($(ls -al ${config_dot_path} | tail -n +4 | awk '{print $9}'))

	# files which should be linked to ~/.xxx
	for dot_file in "${home_dot_files[@]}"; do
		local source_dot_file="${home_dot_path}/${dot_file}"
		local target_dot_file="${HOME}/${dot_file}"
		link_single_file "${source_dot_file}" "${target_dot_file}"
	done

	# files which should be linked to ~/.config/xxx
	for dot_file in "${config_dot_files[@]}"; do
		local source_dot_file="${config_dot_path}/${dot_file}"
		local target_dot_file="${HOME}/.config/${dot_file}"
		link_single_file "${source_dot_file}" "${target_dot_file}"
	done
}

###################################################
# description: link single file to target path
#          $1: origin file path
#      	   $2: target file path
#      return: 0 or 1
###################################################
function link_single_file {
	local origin_file="$1"
	local target_file="$2"

	# if origin file not exist
	if [[ ! -e "${origin_file}" ]]; then
		utils_print_white_line "----------------------------------------"
		utils_print_error "!Error!"
		utils_print_red_line ": you should provide origin file"
		utils_print_red_line "   path: $1"
		utils_print_red_line "Now, Exit..."
		utils_print_white_line "----------------------------------------"
		return 1
	fi

	# if target file path is a soft link and point to origin file
	if [[ -L "${target_file}" && "$(readlink ${target_file})" == "${origin_file}" ]]; then
		utils_print_info "!Info!"
		utils_print_white_line ": your target file is a soft link and point to origin file"
		utils_print_green_line "  path: "${target_file}""
		printf "\n"
		return 1
	fi

	# if target file path is a soft link, but not point to any file
	if [[ -L "${target_file}" && ! -f ${target_file} ]]; then
		utils_print_white_line "----------------------------------------"
		utils_print_warning "!WARNING!"
		utils_print_yellow_line ": your target file is a soft link, but not point any file"
		utils_print_green_line "     path: "${target_file}""
		utils_print_white_line "----------------------------------------"
		utils_print_white "remove soft link: "
		rm -r "${target_file}"
		if [[ $? -eq 0 ]]; then
			utils_print_green_line "remove soft link success"
		else
			utils_print_red_line "remove soft link failed"
			return 1
		fi
	fi

	# if target file exist
	# choose overwrite or not
	if [[ -e "${target_file}" ]]; then
		utils_print_white_line "--------------------------------------"
		utils_print_warning "!WARNING!"
		utils_print_yellow_line ": you have origin config file exist"
		utils_print_green_line "     path: "${target_file}""
		utils_print_white_line "--------------------------------------"
		if utils_yn_prompt "Do you want to overwrite it?"; then
			mv "${target_file}" "${target_file}.backup"
			utils_print_white "backup origin file to "
			utils_print_info_line "${target_file}.backup"
		else
			utils_print_white_line "Now, Exit..."
			return 1
		fi
	fi

	# create soft link
	utils_print_white "create soft link: "
	utils_print_info_line "${origin_file} --> ${target_file}"
	ln -s "${origin_file}" "${target_file}"

	if [[ $? -eq 0 ]]; then
		utils_print_green_line "create soft link success"
		printf "\n"
		return 0
	else
		utils_print_red_line "create soft link failed"
		printf "\n"
		return 1
	fi

	return 0
}

# call main function
create_config_softlinks
