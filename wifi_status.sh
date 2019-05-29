#!/bin/bash

ssid=$( iw wlo1 link | grep SSID | cut -d' ' -f2)

if [ ${ssid} ]
then
	echo -e "<span color='green'>WiFi: ${ssid}</span>"
else
	symbol=$(systemctl status wpa_supplicant@wlo1 | grep "dead" | sed 's/^.*$/✓/')
	echo -e "<span color='#FF1D8E'>WiFi ${symbol:-✗}</span>"
fi
