#!/usr/bin/env bash

case "$SENDER" in
"front_app_switched")
	sketchybar --set "$NAME" label="$INFO" icon.background.image="app.$INFO" icon.background.image.scale=0.8
	;;
esac
