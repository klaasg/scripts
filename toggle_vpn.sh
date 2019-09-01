#!/bin/bash
#
# A script that toggles an openconnect vpn for Ugent 

# Is there a VPN running?
vpn=$(ps -A | grep openconnect)

if [ "${vpn}" ]     # If running
then
    sudo killall openconnect    # Kill all openconnect instances, because of past bugs
else
    # connect to ugent vpn, with password stored in a file.
    # sudo has no password so this works non-interactively
    sudo cat /etc/openconnect/passwd | sudo openconnect --protocol=anyconnect -u klagoeth --passwd-on-stdin asavpn.ugent.be &
fi

# notify i3blocks so it displays the change, doesn't work always :(
sleep 1; sudo pkill -RTMIN+10 i3blocks

exit 0
