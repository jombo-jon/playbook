#!/bin/sh
extern=DP-1
intern=eDP-1

if xrandr | grep "$extern disconnected"; then
    xrandr --output "$extern" --off --output "$intern" --auto
else
    xrandr --output "$intern" --off --output "$extern" --mode 5120x1440 --off
fi

