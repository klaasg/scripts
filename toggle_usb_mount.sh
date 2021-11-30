#!/bin/bash
#
# This script mounts a usb /dev/sdb1 if not mounted and 
# umounts it if it is mounted
# There is an `fstab` entry for it, so no root permissions required

if [[ -z "$(mount | grep "/dev/sdb1 on /home/klaasg/usb")" ]]; then
    mount /dev/sdb1
else
    umount /dev/sdb1
fi

