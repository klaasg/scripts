#!/bin/bash
#
# This script displays the weather, using github.com/chubin/wttr.in
# Format is: 'cloud-emoji' +/-DEGREES°C 
# Default location is Gistel, West-Flanders, Belgium 

curl wttr.in/~${1:-Gistel}?format=1 2>/dev/null
