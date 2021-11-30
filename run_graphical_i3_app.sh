#!/bin/bash

i3sock=/run/user/*/i3/ipc-socket*

i3-msg -s $i3sock "exec --no-startup-id ""$1"""

exit 0
