#!/bin/bash
#
# This is a script that toggles the WiFi, using `wpa_supplicant`

# is the WiFi on?
status=$(systemctl status wpa_supplicant@wlo1 | grep "dead")

if [ "${status}" ]  # if not running
then
    sudo systemctl start wpa_supplicant@wlo1.service    # start
else
    sudo systemctl stop wpa_supplicant@wlo1.service     # stop
fi

exit 0
