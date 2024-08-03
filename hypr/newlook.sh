#!/bin/sh

wall=$(find $HOME/.walls -type f -name "*.jpg" -o -name "*.png" | shuf -n 1)

wal -q -i $wall
swaybg -i $wall

xdotool key super+F5
