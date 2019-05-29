#!/bin/bash

vpn=$(ps -A | grep openconnect)
if [ "${vpn}" ]
then
	sudo killall openconnect
else
	sudo cat /etc/openconnect/passwd | sudo openconnect --protocol=anyconnect -u klagoeth --passwd-on-stdin asavpn.ugent.be
fi
sleep 2; sudo pkill -RTMIN+2 i3blocks
