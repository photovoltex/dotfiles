#!/bin/bash

# Terminate already running bar instances
# killall -q polybar
# If all your bars have ipc enabled, you can also use 
polybar-msg cmd quit

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --config=~/.config/polybar/config.ini --reload main
  done
else
  polybar --config=~/.config/polybar/config.ini --reload main
fi

echo "Polybar launched..."
