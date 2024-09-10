#!/usr/bin/env bash

source "$HOME/.config/sketchybar/variables.sh"

SPACE_ICONS=("0:TERM" "1:VSC" "2:WEB" "3:TOOL" "4:NOTE" "5:DOC" "6:WORK" "7:ENT" "8:OSX" "9:IM")

sid=$1
if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
	sketchybar --animate tanh 5 --set "$NAME" \
		icon.drawing=on \
		background.drawing=on \
		label.drawing=off \
		icon.color="$BLACK" \
		icon="${SPACE_ICONS[$sid]}" \
		label.color="$WHITE"
else
	sketchybar --animate tanh 5 --set "$NAME" \
		label.drawing=on \
		label.color="$CYAN" \
		background.drawing=off \
		label="$sid" \
		icon.drawing=off
fi
