#!/bin/bash

wechat=(
	update_freq=5
	icon=""
	icon.color=$BLACK
	icon.font="$FONT:Regular:20.0"
	icon.padding_left=8
	background.color=$LIGHT_GREEN
	background.height=26
	background.corner_radius=8
	background.border_width=0
	padding_right=6
	# label.padding_right=8
	label.color=$BLACK
	script="$PLUGIN_DIR/app_status.sh"
	click_script="open -a Wechat"
)

sketchybar --add item wechat right \
	--set wechat "${wechat[@]}"
