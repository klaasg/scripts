#!/bin/bash
#
# This script displays "VPN" if a openconnect vpn is in use
# It outputs it in green, using pango markup

# following command checks if openconnect is running somewhere
vpn=$(ps -A | grep openconnect)
if [ "${vpn}" ]
then
    # actual outputting
    echo "<span color='green'>VPN</span>"
fi
