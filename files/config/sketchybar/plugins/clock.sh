#!/usr/bin/env bash

ICON="󰥔"
LABEL=$(date '+%H:%M:%S')
sketchybar --set "$NAME" label="$LABEL" icon=$ICON
