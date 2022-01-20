#!/bin/bash
#
# This is a script that toggles the Bluetooth

# is the Bluetooth on?
status=$(systemctl status bluetooth | grep "dead")

if [ "${status}" ]  # if not running
then
    sudo systemctl start bluetooth    # start
else
    sudo systemctl stop bluetooth     # stop
fi

# inform `i3blocks` about the change
pkill -RTMIN+10 i3blocks

exit 0
