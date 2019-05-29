#!/bin/bash

status=$(systemctl status wpa_supplicant@wlo1 | grep "dead")
if [ "${status}" ]
then
	sudo systemctl start wpa_supplicant@wlo1.service
else
	sudo systemctl stop wpa_supplicant@wlo1.service
fi
