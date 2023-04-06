#!/bin/bash
set -e
amixer -D pulse sset Capture toggle
set +e
current_scene=$(obs-cli --password "xejiewoog" scene get)
if [ "$current_scene" == "webcam" ]; then
  obs-cli --password "xejiewoog" sceneitem toggle webcam mic
fi
set -e
notify-send "Microphone Toggle" "Toggled Mic to $(amixer -D pulse get Capture | grep '%' | grep -oE '[^ ]+$' | head -n 1)" -i microphone-disabled-symbolic.symbolic -t 2000
