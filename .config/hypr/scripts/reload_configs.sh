#!/bin/bash

hyprctl reload

dunstctl reload

killall waybar
hyprctl dispatch exec waybar
