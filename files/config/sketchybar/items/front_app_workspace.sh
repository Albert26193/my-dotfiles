#!/usr/bin/env bash

COLOR="${GREEN}"

sketchybar --add event aerospace_workspace_change

sketchybar \
	--add item front_app_num center \
	--set front_app_num \
	script="$PLUGIN_DIR/front_app_workspace.sh" \
	background.padding_left=0 \
	background.padding_right=10 \
	background.border_width="$BORDER_WIDTH" \
	background.border_color="$COLOR" \
	background.corner_radius="6" \
	background.color="$BAR_COLOR" \
	icon.drawing=off \
	icon.background.drawing=off \
	display=active \
	label.color="$COLOR" \
	label.padding_left=10 \
	label.padding_right=10 \
	associated_display=active \
	--subscribe front_app_num aerospace_workspace_change
