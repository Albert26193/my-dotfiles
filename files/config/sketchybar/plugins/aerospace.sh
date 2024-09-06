#!/usr/bin/env bash

source "$HOME/.config/sketchybar/variables.sh"

SPACE_ICONS=("0" "1" "2" "3" "4" "5" "6" "7" "8" "9")

sid=$1
if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
	sketchybar --animate tanh 5 --set "$NAME" \
		icon.color="$BLACK" \
		icon="${SPACE_ICONS[$sid]}" \
		icon.highlight=True \
		label.color="$WHITE" \
		background.drawing=on
else
	sketchybar --animate tanh 5 --set "$NAME" \
		icon.color="$CYAN" \
		icon="${SPACE_ICONS[$sid]}" \
		label.color="$WHITE" \
		background.drawing=off
fi
