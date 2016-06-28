#!/usr/bin/env sh

tmpFile="/tmp/lockImg.png"

# This is fun!
scrot -m "$tmpFile"
convert "$tmpFile" -sepia-tone 75% -noise 5% "$tmpFile"
composite -gravity SouthEast -geometry +40+40 ~/Pictures/lockscreen/jojo.png "$tmpFile" "$tmpFile"
i3lock -i "$tmpFile" -p win -e
