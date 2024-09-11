#!/bin/bash

app_padding=8
if lsappinfo -all list | grep $NAME >>/dev/null; then
	LABEL=$(lsappinfo -all list | grep $NAME | egrep -o "\"StatusLabel\"=\{ \"label\"=\"?(.*?)\"? \}" | sed 's/\"StatusLabel\"={ \"label\"=\(.*\) }/\1/g')
	if [[ $LABEL =~ ^\".*\"$ ]]; then
		LABEL=$(echo $LABEL | sed 's/^"//' | sed 's/"$//')
		if [ -z "$LABEL" ]; then
			# LABEL=0
			LABEL=""
			app_padding=0
		fi
	else
		LABEL=""
		app_padding=2
		# LABEL=0
	fi
else
	LABEL="?"
fi

sketchybar --set $NAME label=$LABEL \
	label.padding_right=${app_padding}
