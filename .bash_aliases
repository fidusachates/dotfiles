export PATH=$PATH:~/.local/bin

export LANG="pl_PL.UTF-8"

if which eza >/dev/null; then
    alias ls='eza --group-directories-first --icons=always --color=always'
    ls >/dev/null
fi

alias startminix='qemu-system-x86_64 -curses -drive file=/home/jakub/vm/minix.img -localtime -net user,hostfwd=tcp::15881-:22 -net nic,model=virtio -m 1024M -enable-kvm -drive file=/home/jakub/vm/extra.img,format=raw,index=1,media=disk'
alias restoreminix='cp /home/jakub/vm/backup/minix.img /home/jakub/vm/'

alias vim='nvim'

alias mountwindows='sudo mount /dev/sda2 /mnt/windows'

