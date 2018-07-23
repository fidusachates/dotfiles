#!/bin/bash

declare -A ignore=(
    [.git]=1 [README.md]=1 [requirements.txt]=1
)

pacaur -S --noconfirm autojump tilda terminology neovim python python-pip dunst ruby ttf-font-awesome networkmanager rofi network-manager-applet pasystray pcmanfm chromium zathura pulseaudio betterlockscreen feh
gem install colorls
pip install thefuck


function link_files {
    echo "Directory: $1"
    for f in $(ls -A $1); do
        if [[ -n "${ignore[$f]}" ]]; then
            echo "Ignoring: $f"
        else
            if [[ -d $1$f ]]; then
                mkdir -p ~/$1$f
                link_files "$1$f/" $2
            else
                if [[ $2 = 1 ]]; then
                    rm -f ~/$1$f
                fi
                file=$(realpath $1$f)
                echo "Linking $file with ~/$1$f"
                ln -s $file ~/$1$f
            fi
            
        fi
    done
}

if [ "$1" = "--force" ] || [ "$1" = "-f" ]; then
    link_files "" 1
else
    link_files "" 0
fi

