#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]$(basename $(dirname "$PWD"))/$(basename "$PWD")\[\033[1;31m\]\$\[\033[0m\] '

HISTCONTROL=erasedups

if [ -n "$DISPLAY" ]; then
  xset b off
fi

source ~/.bash_aliases
source /etc/profile.d/autojump.sh

if [ -e ~/.bash_custom ]; then
    source ~/.bash_custom
fi

