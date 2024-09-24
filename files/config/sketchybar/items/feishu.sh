#!/bin/bash

feishu=(
	update_freq=5
	icon=""
	icon.font="$FONT:Regular:15.0"
	icon.color=$BLACK
	icon.padding_left=8
	background.color=$LIGHT_YELLOW
	background.height=26
	background.corner_radius=8
	background.border_width=0
	padding_right=6
	label.color=$BLACK
	script="$PLUGIN_DIR/app_status.sh"
	click_script="open -a lark"
)
# label.padding_right=6

sketchybar --add item lark right \
	--set lark "${feishu[@]}"
