#!/bin/bash

is_muted=`pamixer --get-mute`
if [ "$is_muted" == "true" ]; then
    pamixer -t
fi
pamixer -i 5
notify-send "Volume [`pamixer --get-volume`%]" -u low -t 1000 -h string:x-canonical-private-synchronous:audio_volume -h int:value:"`pamixer --get-volume`"

