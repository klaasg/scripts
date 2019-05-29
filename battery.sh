#!/bin/bash

percentage=$(cat /sys/class/power_supply/BAT1/capacity)

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

state=$(upower -i $(upower -e | grep BAT) | grep state | tr -s ' ' | cut -d' ' -f3)

if [ "${state}" == "discharging" ]
then
	color="white"
else
	color="yellow"
fi

echo -e "<span color='${color}'>BAT:</span> <span color='${pcolor}'>${percentage}%</span>"
