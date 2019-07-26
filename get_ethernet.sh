#!/bin/bash
#
# This script displays "Eth" if a ethernet cable is connected
# It outputs it in green, using pango markup

# following command checks if connected
if [ "$(ip a | grep eno1 | grep "state UP")" ]
then
    # actual outputting
    echo -e "<span color='green'>Eth</span>"
fi
