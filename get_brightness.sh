#!/bin/bash
#
# This is a script to display the brightness percentage
# It outputs colors, using pango markup

# directory of brightness settings
dir="/sys/class/backlight/intel_backlight/"

# brightness level
brightness=$(cat "${dir}brightness")
max_brightness=$(cat "${dir}max_brightness")

# percentage of brightness
percentage=$(echo "100 * ${brightness}/${max_brightness}" | bc -l)

# actual displaying of brightness
echo "☼ ${percentage%.*}%"

exit 0
