#!/bin/bash

touchpad_id="04CA00A0:00 04CA:00B1 Touchpad"
if [ "$(xinput list-props "$touchpad_id" | grep 'Device Enabled' | grep -o '[01]$')" == "1" ]; then
    xinput --disable '04CA00A0:00 04CA:00B1 Touchpad'
    notify-send "Touchpad Off" -u low -t 1000 -h string:x-canonical-private-synchronous:touchpad_status
else
    xinput --enable '04CA00A0:00 04CA:00B1 Touchpad'
    notify-send "Touchpad On" -u low -t 1000 -h string:x-canonical-private-synchronous:touchpad_status
fi

