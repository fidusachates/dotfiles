#!/bin/bash

xbacklight -inc 10
notify-send "Brightness: `xbacklight -get`%" -u low -t 1000 -h string:x-canonical-private-synchronous:brightness

