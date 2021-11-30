#!/bin/bash
#
# A script that outputs battery percentage after "BAT: "
# It outputs colors, using pango markup

# battery information is stored in this directory
bat_dir="/sys/class/power_supply/BAT1"
percentage=$(cat ${bat_dir}/capacity)   # current percentage
# is the battery charging?
state=$(cat ${bat_dir}/status)

# choosing color for percentage
if [ ${percentage} -le 20 ]
then
    if [ "${state}" == "Discharging" ]
    then
        # show only when last showed 5 minutes ago
        alreadyshowed=$(find "$(dirname "$0")" -name "$(basename "$0")" -cmin -5 | wc -l)
        if [ ${alreadyshowed} -eq 0 ]
        then
            # mpv --no-terminal --fs --loop=6 /home/klaasg/memes/batterylow.mp4 &
            i3-msg fullscreen disable >/dev/null
            mpv --no-terminal --loop=6 /home/klaasg/memes/batterylow.mp4 &
            touch "$0"
        fi
    fi
    pcolor="#FF1D8E"
elif [ ${percentage} -ge 80 ]
then
    pcolor="green"
    if [ ${percentage} -eq 100 ]
    then
    	pcolor="yellow"
    fi
else
    pcolor="white"
fi

# choosing color for BAT sign
if [ "${state}" == "Discharging" ]
then
    color="white"
else
    color="yellow"
fi

# echo correct output
echo -e "<span color='${color}'>BAT:</span> <span color='${pcolor}'>${percentage}%</span>"

exit 0
