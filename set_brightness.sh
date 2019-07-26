#!/bin/bash

# This is a script to change the brightness level
# Takes one argument: the percentage of increase, as whole number
# E.g. brightness.sh -5, brighness.sh 5

# directory of brightness settings
dir="/sys/class/backlight/intel_backlight/"

# brightness file
file="${dir}brightness"

# brightness level
brightness=$(cat "${dir}brightness")
max_brightness=$(cat "${dir}max_brightness")

# percentage of brightness
percentage=$(echo "${brightness}/${max_brightness}" | bc -l)

# new brightness percentage
percentage=$(echo "${percentage} + ($1 / 100)" | bc -l)

# new brightness, decimals cut off
brightness=$(echo "${max_brightness} * ${percentage}" | bc | cut -d'.' -f1)

# cut off new brightness if too big
if [ ${brightness} -gt "${max_brightness}" ]
then
    brightness=${max_brightness}
fi

# cut off new brightness if less than zero
if [ ${brightness} -lt "0" ]
then
    brightness=0
fi

# sometimes permissions change over time (update/reboot I think)
# my sudo has no password so I can use this
sudo chmod 666 ${dir}brightness

# actual changing the brightness
echo "${brightness}" > ${file}
