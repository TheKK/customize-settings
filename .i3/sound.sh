#!/bin/bash

SINK_NO=0

has_pulseaudio() {
        if [ "$(pgrep -c pulseaudio)" -eq 1 ]; then
                echo 'true'
        else
                echo 'false'
        fi
}

sendNotify() {
        notify-send -t 1 "$1"
}

toggle_mute() {
        is_muted=''

        if [ "$(has_pulseaudio)" == 'true' ]; then
                pactl set-sink-mute $SINK_NO toggle

                is_muted=$(pactl list sinks | sed -n -e "/Sink #$SINK_NO/,\$p" | grep '^\sMute' | awk '{print $2}')
        else
                amixer -q sset Master toggle

                sendNotify 'jlsdjld'
                is_muted=$(amixer -1 get Master | grep -P '[on]')
        fi

        if [ "$is_muted" == 'yes' ]; then
                sendNotify "Muted"
        else
                sendNotify "Unmuted"
        fi
}

raise_vol() {
        current_vol=''

        if [ "$(has_pulseaudio)" == 'true' ]; then
                pactl set-sink-mute $SINK_NO false
                pactl set-sink-volume $SINK_NO +5%

                current_vol=$(pactl list sinks | sed -n -e "/Sink #$SINK_NO/,\$p" | grep '^\sVolume:' | awk '{print $5}')
        else
                sendNotify 'Under construction...'
        fi

        sendNotify "Master Vol: $current_vol"
}

decrease_vol() {
        current_vol=''

        if [ "$(has_pulseaudio)" == 'true' ]; then
                pactl set-sink-mute $SINK_NO false
                pactl set-sink-volume $SINK_NO -5%

                current_vol=$(pactl list sinks | sed -n -e "/Sink #$SINK_NO/,\$p" | grep '^\sVolume:' | awk '{print $5}')
        else
                sendNotify 'Under construction...'
        fi

        sendNotify "Master Vol: $current_vol"
}

set_vol() {
        current_vol=''

        if [ "$(has_pulseaudio)" == 'true' ]; then
                pactl set-sink-mute $SINK_NO false
                pactl set-sink-volume $SINK_NO "$1%"

                current_vol=$(pactl list sinks | sed -n -e "/Sink #$SINK_NO/,\$p" | grep '^\sVolume:' | awk '{print $5}')
        else
                sendNotify 'Under construction...'
        fi

        sendNotify "Master Vol: $current_vol"
}

if [ "$1" == 'raise' ]; then
        raise_vol

elif [ "$1" == 'decrease' ]; then
        decrease_vol

elif [ "$1" == 'set' ]; then
        if [ "$2" -ne '' ]; then
                set_vol "$2"
        else
                echo 'wrong usage'
        fi

elif [ "$1" == 'dmenu-set' ]; then
        run_dmenu='dmenu -b -i -l 15 -p vol_level -fn Hermit-9'

        set_vol "$(printf "10\n20\n30\n40\n50\n60\n70\n80\n90\n100" | $run_dmenu)"

elif [ "$1" == 'toggleMute' ]; then
        toggle_mute
fi
