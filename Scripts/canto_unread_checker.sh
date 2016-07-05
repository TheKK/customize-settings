#!/usr/bin/env sh

if [ "$(canto-remote -h > /dev/null; echo $?)" -ne 0 ]; then
        echo "bye"
        exit 1
fi

unread_num=$(canto-remote status)

if [ "$unread_num" -ne 0 ]; then
        notify-send "You have $unread_num unread rss feed!"
fi
