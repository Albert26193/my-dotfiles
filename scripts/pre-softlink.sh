#!/bin/bash

function create_config_softlinks {
	local home_dot_files=(
		".zshrc"
		".tmux.conf"
		".vimrc"
		".amethyst.yml"
		".gitconfig"
	)

	local config_dot_files=(
		"alacritty.yml"
	)

	local other_dot_files=(
		"lazygit"
	)

	local git_root=$(git rev-parse --show-toplevel 2>/dev/null)
	local dot_file_dir="${git_root}/config"

	for dot_file in "${home_dot_files[@]}"; do
		local source_dot_file="${dot_file_dir}/${dot_file}"
		local target_dot_file="${HOME}/${dot_file}"
		if [[ -f "${source_dot_file}" ]] && [[ ! -L ${target_dot_file} ]]; then
			ln -s "${source_dot_file}" "${target_dot_file}"
			printf '%s\n' "create link to ${target_dot_file}"
		fi
	done

	for dot_file in "${config_dot_files[@]}"; do
		local source_dot_file="${dot_file_dir}/${dot_file}"
		local target_dot_file="${HOME}/.config/${dot_file}"
		if [[ -f "${source_dot_file}" ]] && [[ ! -L ${target_dot_file} ]]; then
			ln -s "${source_dot_file}" "${target_dot_file}"
			printf '%s\n' "create link to ${target_dot_file}"
		fi
	done

	for dot_file in "${other_dot_files[@]}"; do
		local source_dot_file="${dot_file_dir}/${dot_file}/config.yml"
		local target_dot_file="${HOME}/Library/Application Support/${dot_file}/config.yml"
		if [[ -f "${source_dot_file}" ]] || [[ -d "${source_dot_file}" ]]; then
			ln -s "${source_dot_file}" "${target_dot_file}"
			printf '%s\n' "create link to ${target_dot_file}"
		fi
	done
}

create_config_softlinks
