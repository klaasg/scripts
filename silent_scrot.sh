#!/bin/bash
#
# This script takes a screenshot with `scrot` and copies is to clipboard
# `scrot` normally 'rings the bell', so it get's toggled

xset -b     # disable the bell sound

# set the file to save too
mkdir -p "/home/klaasg/screenshots"
file="/home/klaasg/screenshots/$(date +%y-%m-%d_%T).png"

# all options are passed
scrot "$@" "${file}"
# now copy the file to clipboard, with `xclip`
xclip -selection clipboard -t image/png -in < "${file}"
# create "latest" link
latestfile="/home/klaasg/screenshots/latest_screenshot.png"
[[ -f "${latestfile}" ]] && rm "${latestfile}"
ln -s "${file}" "${latestfile}"

xset b      # enable the bell sound

exit 0
