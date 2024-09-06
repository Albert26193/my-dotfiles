#!/usr/bin/env bash

source "$HOME/.config/sketchybar/variables.sh"

SPACE_ICONS=("0:TERM" "1:VSC" "2:WEB" "3:TOOL" "4:NOTE" "5:DOC" "6:WORK" "7:ENT" "8:OSX" "9:IM")

sid=$1
if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
	sketchybar --animate tanh 5 --set "$NAME" \
		icon.color="$BLACK" \
		icon="${SPACE_ICONS[$sid]}" \
		label.color="$WHITE" \
		background.drawing=on
else
	sketchybar --animate tanh 5 --set "$NAME" \
		icon.color="$CYAN" \
		icon="${SPACE_ICONS[$sid]}" \
		label.color="$WHITE" \
		icon.border=on \
		icon.border_color="$WHITE" \
		background.drawing=off
fi
