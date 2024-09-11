#!/bin/bash

tg=(
	update_freq=10
	icon=""
	icon.font="$FONT:Regular:15.0"
	icon.color=$WHITE
	icon.padding_left=10
	background.color=$DARK_BLUE
	background.height=26
	background.corner_radius=8
	background.border_width=0
	padding_right=4
	label.padding_right=6
	label.color=$WHITE
	script="$PLUGIN_DIR/app_status.sh"
	click_script="open -a Telegram"
)

sketchybar --add item Telegram right \
	--set Telegram "${tg[@]}"
