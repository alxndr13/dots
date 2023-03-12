#!/bin/bash 

export XDG_RUNTIME_DIR=/run/user/1001
export XDG_CURRENT_DESKTOP="sway"
export WAYLAND_DISPLAY="wayland-1"
set -x 
#exec 1> >(logger -s -t "$(basename "$0")") 2>&1
echo "RUN"
if [ "$1" = "lock" ]; then
        /home/ahuck/.local/bin/lock.sh
else
        # unlock
                # PAM login successful
                # kill locker
                kill -9 $(pgrep swaylock)
                ps aux | grep swaylock
                # turn on displays
                SWAYSOCK=$(ls /run/user/1001/sway-ipc.*.sock) swaymsg "output * dpms on"
fi
exit 0

