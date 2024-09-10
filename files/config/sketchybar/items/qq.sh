#!/bin/bash

qq=(
	update_freq=10
	icon=""
	icon.color=$WHITE
	icon.font="$FONT:Regular:16.0"
	icon.padding_left=10
	background.color=$COMMENT
	background.height=27
	background.corner_radius=8
	background.border_width=0
	padding_right=6
	label.padding_right=10
	label.color=$WHITE
	script="$PLUGIN_DIR/app_status.sh"
	click_script="open -a qq"
)

sketchybar --add item qq right \
	--set qq "${qq[@]}"
