#!/bin/sh
# inspired of:
#   http://unix.stackexchange.com/questions/4489/a-tool-for-automatically-applying-randr-configuration-   when-external-display-is-p
#   http://ozlabs.org/~jk/docs/mergefb/
#   http://superuser.com/questions/181517/how-to-execute-a-command-whenever-a-file-changes/181543#181543

export MONITOR2=/sys/class/drm/card0-DP-1/status

while inotifywait -v -e modify,create,delete,open,close,close_write,access $MONITOR2; do

    dmode="$(cat $MONITOR2)"

    if [ "${dmode}" = 'disconnected' ]; then
        echo "${dmode}"
        ~/.screenlayout/single_edp_normal.sh

    elif [ "${dmode}" = 'connected' ];then
        echo "${dmode}"
        ~/.screenlayout/multi_dp_left_rotate_right.sh

    else /usr/bin/xrandr --auto
         echo "${dmode}"
    fi
done
