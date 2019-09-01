#!/bin/bash
#
# This script displays 'WiFi: SSID' if connected via wifi
# Else, this displays 'WiFi SYMBOL' where SYMBOL is:
#   ✓ if WiFi is off (it's correct that there is no connection)
#   ✗ if WiFi is on (should have a connection but doesn't)
# It outputs it in green or red if connected or not, using pango markup

# get the SSID, if there is one
ssid=$( iw wlo1 link | grep SSID | cut -d' ' -f2)

# is there a connection?
if [ ${ssid} ]
then
    # output green, and SSID
    echo -e "<span color='green'>WiFi: ${ssid}</span>"
else
    # output red/pink, with correct symbol
    # following command sets $symbol to ✓ if wifi is off
    symbol=$(systemctl status wpa_supplicant@wlo1 | grep "dead" | sed 's/^.*$/✓/')
    echo -e "<span color='#FF1D8E'>WiFi ${symbol:-✗}</span>"
fi

exit 0
