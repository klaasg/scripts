#!/bin/bash

state=$(xinput list-props 'SynPS/2 Synaptics TouchPad' | grep "Device Enabled" | grep "0")

if [ "${state}" ]
then
    xinput enable 'SynPS/2 Synaptics TouchPad'
else
    xinput disable 'SynPS/2 Synaptics TouchPad'
fi

