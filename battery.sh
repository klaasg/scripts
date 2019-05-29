#!/bin/bash

bat_dir="/sys/class/power_supply/BAT1"
percentage=$(cat ${bat_dir}/capacity)

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

state=$(cat ${bat_dir}/status)

if [ "${state}" == "Discharging" ]
then
	color="white"
else
	color="yellow"
fi

echo -e "<span color='${color}'>BAT:</span> <span color='${pcolor}'>${percentage}%</span>"
