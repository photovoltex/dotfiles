#!/bin/bash

# Terminate already running bar instances
# killall -q polybar
# If all your bars have ipc enabled, you can also use

polybar-msg cmd quit

source ~/.secrets

if type "xrandr"; then
  primary=$(xrandr --query | grep " connected primary" | cut -d" " -f1)
  polybar --config=~/.config/polybar/config.ini --reload top &
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ "$m" != "$primary" ]
    then 
        MONITOR=$m polybar --config=~/.config/polybar/config.ini --reload top &
    fi
  done

else
  polybar --config=~/.config/polybar/config.ini --reload top
fi

echo "Polybar launched..."
