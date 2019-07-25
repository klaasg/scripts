#!/bin/bash

if [ "$(ip a | grep eno1 | grep "state UP")" ]
then
	echo -e "<span color='green'>Eth</span>"
fi
