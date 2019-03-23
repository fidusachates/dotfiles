#!/bin/bash

xset +fp /home/jakub/.fonts
xset fp rehash

setxkbmap pl

exec i3
