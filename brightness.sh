#!/bin/bash

# this is a file to change the brightness level
# takes one argument: the percentage of increase, as whole number
# e.g. brightness.sh -5, brighness.sh 5

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

if [ ${brightness} -gt "${max_brightness}" ]
then
	brightness=${max_brightness}
fi
if [ ${brightness} -lt "0" ]
then
	brightness=0
fi

sudo chmod 666 ${file}
echo "${brightness}" > ${file}
