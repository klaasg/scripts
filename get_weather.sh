#!/bin/bash
#
# This script displays the weather, using github.com/chubin/wttr.in
# Default location is Gistel, West-Flanders, Belgium 

curl wttr.in/~${1:-Gistel}?lang=nl
