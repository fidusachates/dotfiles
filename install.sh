#!/bin/bash

force_installation=0
install_packages=1
positional_args=()

while [[ $# -gt 0 ]]; do
    case $1 in
        -f|--force)
            force_installation=1
            shift # past argument
            ;;
        -s|--skip-packages)
            install_packages=0
            shift # past argument
            ;;
        -*|--*)
            echo "Unknown option $1"
            exit 1
            ;;
        *)
            positional_args+=("$1") # save positional arg
            shift # past argument
            ;;
    esac
done

set -- "${positional_args[@]}" # restore positional parameters


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
PACKAGES_PATH=$SCRIPT_DIR/packages.txt
PACKAGES_AUR_PATH=$SCRIPT_DIR/packages-aur.txt

declare -A ignore=(
    [.git]=1
    [README.md]=1
    [requirements.txt]=1
    [install.sh]=1
    [packages.txt]=1
    [packages-aur.txt]=1
    [bin]=1
)

if [ "$install_packages" -eq 1 ]; then
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

    sudo pacman -S --noconfirm - < $PACKAGES_PATH
    sudo yay -S --noconfirm - < $PACKAGES_AUR_PATH
fi

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
                    echo "Removing: ~/$1$f"
                    rm -f ~/$1$f
                fi
                file=$(realpath $1$f)
                echo "Linking $file with ~/$1$f"
                ln -s $file ~/$1$f
            fi
            
        fi
    done
}

if [ "$force_installation" -eq 1 ]; then
    link_files "" 1
else
    link_files "" 0
fi

if [ ! -f ~/.vim/autoload/plug.vim ]; then
    echo "Downloading Plug"
    mkdir -p ~/.vim/autoload
    wget https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -O ~/.vim/autoload/plug.vim
    echo "Installing nvim plugins with Plug"
    nvim +'PlugInstall --sync' +qa
fi

sudo systemctl start NetworkManager.service
sudo systemctl enable NetworkManager.service
sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service

systemctl --user enable --now hyprpaper.service

hyprctl reload
