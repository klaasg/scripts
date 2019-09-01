#!/bin/bash
#
# This script takes a screenshot with `scrot` and copies is to clipboard
# `scrot` normally 'rings the bell', so it get's toggled

xset -b     # disable the bell sound

# set the file to save too
file="/home/klaasg/screenshots/$(date +%d-%m-%y_%T).png"

# all options are passed
scrot "$@" "${file}"
#now copy the file to clipboard, with `xclip`
xclip -selection clipboard -t image/png -in < "${file}"

xset b      # enable the bell sound

exit 0
