#!/bin/bash

dir="$HOME/.config/rofi"
uptime="`uptime -p | sed -e 's/up //g'`"

options="Logout\nSuspend\nReboot\nShutdown"

opt_shutdown="";
opt_logout="";
opt_suspend="";
opt_reboot="";
opt_lock="";

opt_yes="";
opt_no="";

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-p "Uptime: $uptime" \
		-mesg "Uptime: $uptime" \
        -theme ${dir}/scripts/powermenu.rasi
}

echo_options() {
    echo -e "$opt_shutdown\n$opt_lock\n$opt_reboot\n$opt_logout\n$opt_suspend"
}

run_rofi() {
    echo_options | rofi_cmd
}

confirm_exit() {
	echo -e "$opt_yes\n$opt_no" | confirm_cmd
}

confirm_cmd() {
	rofi -theme-str 'window {location: center; anchor: center; fullscreen: false; width: 350px;}' \
		-theme-str 'mainbox {children: [ "message", "listview" ];}' \
		-theme-str 'listview {columns: 2; lines: 1;}' \
		-theme-str 'element-text {horizontal-align: 0.5;}' \
		-theme-str 'textbox {horizontal-align: 0.5;}' \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?'
}

# Execute Command
run_cmd() {
	selected="$(confirm_exit)"
    if [[ "$selected" == "$opt_yes" ]]; then
		if [[ $1 == '--shutdown' ]]; then
			systemctl poweroff
		elif [[ $1 == '--reboot' ]]; then
			systemctl reboot
		elif [[ $1 == '--suspend' ]]; then
			amixer set Master mute
			systemctl suspend
		elif [[ $1 == '--logout' ]]; then
            hyprctl dispatch exit
		fi
	else
		exit 0
	fi
}

# Actions
choice=$(run_rofi)
case ${choice} in
    $opt_shutdown)
		run_cmd --shutdown
        ;;
    $opt_reboot)
		run_cmd --reboot
        ;;
    $opt_lock)
        hyprlock
        ;;
    $opt_suspend)
		run_cmd --suspend
        ;;
    $opt_logout)
		run_cmd --logout
        ;;
esac

