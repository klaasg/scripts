#!/bin/bash
#
# This script displays 'Bluetooth: <name>' if connected 
# Else, this displays 'Bluetooth SYMBOL' where SYMBOL is:
#   ✓ if Bluetooth is off (it's correct that there is no connection)
#   ✗ if Bluetooth is on (should have a connection but doesn't)
# It outputs it in green or red if connected or not, using pango markup

# following command sets $symbol to ✓ if bluetooth is off
dead=$(systemctl status bluetooth | grep "dead")

# is there a connection?
if [[ "${dead}" ]]
then
    echo -e "<span color='#FF1D8E'>Bluetooth ✓</span>"
else
    # get the connected device's name, if there is one
    name=$(bluetoothctl -- info | grep Name | cut -d" " -f2-)
    if [[ "${name}" ]]
    then
        # output green, and name
        echo -e "<span color='green'>Bluetooth: ${name}</span>"
    else
        echo -e "<span color='#FF1D8E'>Bluetooth ✗</span>"
    fi
fi

exit 0

