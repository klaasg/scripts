#!/bin/bash
#
# A script that toggles the touchpad on my laptop (I use X, so via `xinput`)

# get the state of the device
state=$(xinput list-props 'SynPS/2 Synaptics TouchPad' | grep "Device Enabled" | cut -f 3)

# if disabled
if [ ${state} -eq 0 ]
then
    xinput enable 'SynPS/2 Synaptics TouchPad'  # enable
else
    xinput disable 'SynPS/2 Synaptics TouchPad' # disable
fi


exit 0
