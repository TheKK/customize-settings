#!/usr/bin/env sh

# This is fun!
scrot -m /tmp/lockImg.png
convert /tmp/lockImg.png -blur 0x06 /tmp/lockImg.png
i3lock -i /tmp/lockImg.png -p win -e
