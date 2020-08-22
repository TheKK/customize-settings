# Get user selection.
exec 3>&1
wm=$(dialog --menu test 0 0 0 \
    "i3" "" \
    "awesome" "" \
    "xmonad" "" \
    2>&1 1>&3)
exec 3>&-

startx ~/.xinitrc "$wm"
