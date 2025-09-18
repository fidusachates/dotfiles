#!/bin/bash

xbacklight -dec 10
dunstify "Brightness [`xbacklight -get`%]" -u low -t 1000 -h string:x-canonical-private-synchronous:brightness -h int:value:"`xbacklight -get`"

