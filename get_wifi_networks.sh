#!/bin/bash

sudo iw dev wlo1 scan | egrep "SSID|signal"
