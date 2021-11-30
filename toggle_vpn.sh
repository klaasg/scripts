#!/bin/bash
#
# A script that toggles an openconnect vpn for Ugent 

# Is there a VPN running?
vpn=$(ps -A | grep openconnect)

if [ "${vpn}" ]     # If running
then
    sudo killall openconnect    # Kill all openconnect instances, because of past bugs
else
    openconnect-sso -s vpn.ugent.be --browser-display-mode shown
fi

# notify i3blocks so it displays the change, doesn't work always :(
sleep 1; sudo pkill -RTMIN+10 i3blocks

exit 0

