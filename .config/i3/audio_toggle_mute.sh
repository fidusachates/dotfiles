#!/bin/bash

pamixer -t
is_muted=`pamixer --get-mute`
if [ "$is_muted" == "false" ]; then
    notify-send "Volume: `pamixer --get-volume`%" -u low -t 1000 -h string:x-canonical-private-synchronous:audio_volume
else
    notify-send "Volume: muted" -u low -t 1000 -h string:x-canonical-private-synchronous:audio_volume
fi

# notify-send "Volume: `pamixer --get-volume`%" -u low -t 1000 -h string:x-canonical-private-synchronous:audio_volume

