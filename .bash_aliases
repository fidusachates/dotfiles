eval $(thefuck --alias)

export PATH=$PATH:~/.gem/ruby/2.5.0/bin
TERMINAL=termite

export LANG="pl_PL.UTF-8"

alias ls='colorls --sd'
alias lc='colorls --sd'

alias startminix='qemu-system-x86_64 -curses -drive file=/home/jakub/vm/minix.img -localtime -net user,hostfwd=tcp::15881-:22 -net nic,model=virtio -m 1024M -enable-kvm -drive file=/home/jakub/vm/extra.img,format=raw,index=1,media=disk'
alias restoreminix='cp /home/jakub/vm/backup/minix.img /home/jakub/vm/'

alias vim='nvim'

alias mountwindows='sudo mount /dev/sda5 /mnt/windows'

alias upgradesystem='sudo mount /dev/sda9 /boot && sudo rm /home/backup.tar.gz && sudo tar czf /home/backup.tar.gz --exclude=/home --exclude=/media --exclude=/dev --exclude=/proc --exclude=/sys --exclude=/tmp / && pacaur -Syu'

