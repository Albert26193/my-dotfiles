#!/bin/sh

COLOR="${WHITE}"
sketchybar --add item input_source right
sketchybar --set input_source \
	icon.font="$FONT:Regular:14.0" \
	icon.color="${COLOR}" \
	icon.padding_right=10 \
	icon.padding_left=15 \
	background.height=26 \
	background.corner_radius="$CORNER_RADIUS" \
	background.border_width="$BORDER_WIDTH" \
	background.border_color="$COLOR" \
	background.color="$BAR_COLOR" \
	background.drawing=on \
	script="$PLUGIN_DIR/get_input_source.sh" \
	update_freq=1
