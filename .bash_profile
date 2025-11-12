#
# ~/.bash_profile
#

if [[ "$(tty)" == '/dev/tty1' ]]; then
    hyprland
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
