#!/usr/bin/env sh

# Terminate already running bad instances
killall -q polybar

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar top-bar &
  done
else
  polybar --reload top-bar &
fi
