#!/bin/bash

dir="$HOME/.config/rofi"

opt_yes="";
opt_no="";

echo_options() {
	echo -e "$opt_yes\n$opt_no"
}

rofi_cmd() {
	rofi \
		-dmenu \
		-p 'Confirmation' \
		-mesg 'Are you Sure?' \
        -theme ${dir}/widgets/confirmation.rasi
}

run_rofi() {
    echo_options | rofi_cmd
}

choice=$(run_rofi)
case ${choice} in
    $opt_yes)
        echo true
		exit 0
        ;;
    $opt_no)
        echo false
        exit 1
        ;;
esac
