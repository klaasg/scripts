#!/bin/bash

vpn=$(ps -A | grep openconnect)
if [ "${vpn}" ]
then
	echo "<span color='green'>VPN</span>"
fi
