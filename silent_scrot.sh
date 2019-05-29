#!/bin/bash

xset -b
file="/home/klaasg/screenshots/$(date +%d-%m-%y_%T).png"
scrot ${1} "${file}"
xclip -selection clipboard -t image/png -in < "${file}"
xset b
