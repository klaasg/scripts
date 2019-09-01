#!/bin/bash
#
# A script that outputs battery percentage after "BAT: "
# It outputs colors, using pango markup

# battery information is stored in this directory
bat_dir="/sys/class/power_supply/BAT1"
percentage=$(cat ${bat_dir}/capacity)   # current percentage

# choosing color for percentage
if [ ${percentage} -le 20 ]
then
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

# is the battery charging?
state=$(cat ${bat_dir}/status)

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
