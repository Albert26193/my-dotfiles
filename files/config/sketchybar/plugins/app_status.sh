#!/bin/bash

# $1: app name
function check_running {
	local app_name=$1
	if lsappinfo -all list | grep -qi "$app_name"; then
		echo "on"
		return 0
	fi
	echo "off"
	return 1
}

app_padding=8
if lsappinfo -all list | grep $NAME >>/dev/null; then
	LABEL=$(lsappinfo -all list | grep $NAME | egrep -o "\"StatusLabel\"=\{ \"label\"=\"?(.*?)\"? \}" | sed 's/\"StatusLabel\"={ \"label\"=\(.*\) }/\1/g')
	if [[ $LABEL =~ ^\".*\"$ ]]; then
		LABEL=$(echo $LABEL | sed 's/^"//' | sed 's/"$//')
		if [ -z "$LABEL" ]; then
			LABEL=""
			app_padding=0
		fi
	else
		LABEL=""
		app_padding=2
	fi
else
	LABEL="?"
fi

# update_freq=5 \
# drawing="$(check_running $NAME)"
sketchybar --set $NAME label=$LABEL \
	label.padding_right=${app_padding}
