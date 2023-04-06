#!/bin/bash
set -e
amixer -D pulse sset Capture toggle

current_scene=$(obs-cli --password "xejiewoog" scene get)
if [ "$current_scene" == "webcam" ]; then
  obs-cli --password "xejiewoog" scene switch afk
  notify-send "AFK Mode Toggle" "AFK Mode [ON]" -i microphone-disabled-symbolic.symbolic -t 2000
else
  obs-cli --password "xejiewoog" scene switch webcam
  notify-send "AFK Mode Toggle" "AFK Mode [OFF]" -i microphone-disabled-symbolic.symbolic -t 2000
fi
