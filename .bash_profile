#
# ~/.bash_profile
#

if [[ "$(tty)" == '/dev/tty1' ]]; then
    start-hyprland
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
