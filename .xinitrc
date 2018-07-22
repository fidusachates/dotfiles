#! /bin/bash

xset +fp /home/bob/.fonts
xset fp rehash

setxkbmap pl

exec i3
/usr/local/bin/hotplug_monitor.sh &
