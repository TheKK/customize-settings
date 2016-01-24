#!/bin/bash

SINK_NO=1

sendNotify()
{
        notify-send -t 1 "$1"
}

if [ $1 == "raise" ]; then
        pactl set-sink-mute $SINK_NO false
        pactl set-sink-volume $SINK_NO +5%

	Msg="Master Vol:"
        Vol=$(pactl list sinks | sed -n -e "/Sink #$SINK_NO/,\$p" | grep '^\sVolume:' | awk '{print $5}')

        sendNotify "$Msg $Vol"

elif [ $1 == "lower" ]; then
        pactl set-sink-mute $SINK_NO false
        pactl set-sink-volume $SINK_NO -5%

	Msg="Master Vol:"
        Vol=$(pactl list sinks | sed -n -e "/Sink #$SINK_NO/,\$p" | grep '^\sVolume:' | awk '{print $5}')

	sendNotify "$Msg $Vol"

elif [ $1 == "toggleMute" ]; then
        pactl set-sink-mute $SINK_NO toggle

        Muted=$(pactl list sinks | sed -n -e "/Sink #$SINK_NO/,\$p" | grep '^\sMute' | awk '{print $2}')

	if [ $Muted == "yes" ]; then
		sendNotify "Muted"
	else
		sendNotify "Unmuted"
	fi
fi

