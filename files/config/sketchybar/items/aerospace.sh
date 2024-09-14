#!/usr/bin/env bash

# SPACE_ICONS=("0" "1" "2" "3" "4" "5" "6" "7" "8" "9")

sketchybar --add event aerospace_workspace_change
sketchybar --add item spacer.1 left \
	--set spacer.1 background.drawing=off \
	label.drawing=off \
	icon.drawing=off \
	width=10

if [[ -z ${FOCUSED_WORKSPACE} ]]; then
	FOCUSED_WORKSPACE=0
fi

for sid in $(aerospace list-workspaces --all); do
	sketchybar --add item space.$sid left \
		--subscribe space.$sid aerospace_workspace_change \
		--set space.$sid \
		background.color="${LIGHT_YELLOW}" \
		background.corner_radius=4 \
		background.height=22 \
		background.drawing=off \
		icon.padding_left=6 \
		icon.padding_right=6 \
		icon.height=26 \
		icon.font="$FONT:Bold:15.0" \
		label.font="$FONT:Bold:16.0" \
		click_script="aerospace workspace $sid" \
		script="${PLUGIN_DIR}/aerospace.sh $sid"
done

sketchybar --add item spacer.2 left \
	--set spacer.2 background.drawing=off \
	label.drawing=off \
	icon.drawing=off \
	width=5

sketchybar --add bracket spaces '/space.*/' \
	--set spaces background.border_width="$BORDER_WIDTH" \
	background.border_color="${CYAN}" \
	background.corner_radius="$CORNER_RADIUS" \
	background.color="$BAR_COLOR" \
	background.height=26 \
	background.drawing=on

# sketchybar --add item separator left \
# 	--set separator icon="" \
# 	icon.font="$FONT:Regular:16.0" \
# 	background.padding_left=26 \
# 	background.padding_right=15 \
# 	label.drawing=off \
# 	associated_display=active \
# 	icon.color="$YELLOW"
