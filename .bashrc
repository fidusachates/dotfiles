#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# PS1='[\u@\h \W]\$ '

# PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]\w\[\033[1;31m\]\$\[\033[0m\] '
PS1='\[\033[1;36m\]\u\[\033[1;31m\]@\[\033[1;32m\]\h:\[\033[1;35m\]$(basename $(dirname "$PWD"))/$(basename "$PWD")\[\033[1;31m\]\$\[\033[0m\] '
# PS1='$(basename $(dirname "$PWD"))/$(basename "$PWD")/'

HISTCONTROL=erasedups

if [ -n "$DISPLAY" ]; then
  xset b off
fi

source ~/.bash_aliases
source /etc/profile.d/autojump.bash
