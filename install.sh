#!/bin/bash

declare -A ignore=(
    [.git]=1 [README.md]=1 [requirements.txt]=1 [install.sh]=1
)

sudo pacman -S --noconfirm base-devel

if which yay > /dev/null; then
    echo "Skipping yay installation because it's already installed."
else
    echo "Installing yay"
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd ..
    rm -rf yay
fi

yay -S --noconfirm i3 dmenu xorg xorg-xinit autojump tilda alacritty neovim python python-pip dunst ruby ttf-font-awesome networkmanager rofi rofi-calc network-manager-applet pasystray pcmanfm chromium zathura pulseaudio pulseaudio-alsa pulseaudio-bluetooth feh udevil lxappearance arc-gtk-theme arc-icon-theme ttf-dejavu ttf-inconsolata flameshot wget bash-completion arandr bluez bluez-utils blueman clang htop pavucontrol xclip pamixer noto-fonts-emoji fzf ripgrep
yay -S --noconfirm betterlockscreen
gem install colorls

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

mkdir -p ~/.vim/autoload
wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O ~/.vim/autoload/plug.vim

sudo systemctl start NetworkManager.service
sudo systemctl enable NetworkManager.service

