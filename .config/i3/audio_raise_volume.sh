#!/bin/bash

pamixer -i 5
notify-send "Volume: `pamixer --get-volume`%" -u low -t 1000 -h string:x-canonical-private-synchronous:audio_volume

