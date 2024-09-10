#!/usr/bin/env bash

COLOR="$WHITE"

sketchybar \
	--add item front_app_icon center \
	--set front_app_icon \
	script="$PLUGIN_DIR/front_app.sh" \
	label.drawing=off \
	background.drawing=off \
	icon.drawing=on \
	icon.background.drawing=on \
	padding_right=15 \
	display=active \
	associated_display=active \
	--subscribe front_app_icon front_app_switched

sketchybar \
	--add item front_app center \
	--set front_app \
	script="$PLUGIN_DIR/front_app.sh" \
	background.padding_left=0 \
	background.padding_right=10 \
	background.border_width="$BORDER_WIDTH" \
	background.border_color="$COLOR" \
	background.corner_radius="8" \
	background.color="$BAR_COLOR" \
	icon.drawing=off \
	icon.background.drawing=off \
	display=active \
	label.color="$COLOR" \
	label.padding_left=18 \
	label.padding_right=18 \
	associated_display=active \
	click_script="open -a 'Mission Control'" \
	--subscribe front_app front_app_switched
