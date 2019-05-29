#!/bin/bash

cd /home/klaasg/drivers/rtlwifi_new
make clean && make
sudo make install
reboot
