#!/bin/bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar --reload left &
    MONITOR=$m polybar --reload right &
  done
else
  polybar --reload left &
  polybar --reload right &
fi

echo "Polybar launched..."
