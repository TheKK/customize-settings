#!/bin/bash

SINK_NO="alsa_output.pci-0000_00_1b.0.analog-stereo"

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

get_current_vol() {
    amixer get Master \
      | grep --color=never % \
      | awk '{print $5}' \
      | sed 's/[^0-9+\%]//g'
}

notify_current_vol() {
    local current_vol
    current_vol=$(get_current_vol)

    sendNotify \
    "Master Vol:
$current_vol"
}

toggle_mute() {
        amixer sset Master toggle

        local is_muted
        is_muted=$(amixer get Master | grep '\[off\]' >> /dev/null && echo $?)

        if [ "$is_muted" == 0 ]; then
                sendNotify "Muted"
        else
                notify_current_vol
        fi
}

raise_vol() {
        current_vol=''

        if [ "$(has_pulseaudio)" == 'true' ]; then
                pactl set-sink-mute $SINK_NO false
                pactl set-sink-volume $SINK_NO +5%
        else
                sendNotify 'Under construction...'
        fi

        notify_current_vol
}

decrease_vol() {
        current_vol=''

        if [ "$(has_pulseaudio)" == 'true' ]; then
                pactl set-sink-mute $SINK_NO false
                pactl set-sink-volume $SINK_NO -5%
        else
                sendNotify 'Under construction...'
        fi

        notify_current_vol
}

set_vol() {
        current_vol=''

        if [ "$(has_pulseaudio)" == 'true' ]; then
                pactl set-sink-mute $SINK_NO false
                pactl set-sink-volume $SINK_NO "$1%"
        else
                sendNotify 'Under construction...'
        fi

        notify_current_vol
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
