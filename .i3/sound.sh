#!/bin/bash

if [ $1 == "raise" ]; then
	amixer -q sset Master 5%+

	Msg="Master Vol:"
	Vol=$(amixer get Master | egrep -o "[0-9]+%")
	notify-send -t 1 "$Msg $Vol"

elif [ $1 == "down" ]; then
	amixer -q sset Master 5%-

	Msg="Master Vol:"
	Vol=$(amixer get Master | egrep -o "[0-9]+%")
	notify-send -t 1 "$Msg $Vol"

elif [ $1 == "mute" ]; then
	amixer sset Master toggle
	amixer get Master | grep -P "\[on\]"

	if [ $? == "1" ]; then
		notify-send -t 1 "Mute"
	else
		notify-send -t 1 "Play"
	fi
fi

