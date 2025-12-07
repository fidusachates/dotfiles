#!/bin/bash

function check_dotfiles_updates {
    dotfiles_path=$(dirname "$(readlink -f ~/.bashrc)")
    head_branch=$(cd $dotfiles_path && git remote show origin | grep "HEAD" | sed 's/.*: //')
    commits_behind_origin=$(cd $dotfiles_path && git rev-list $head_branch --count HEAD..@{u})
    if [[ $commits_behind_origin -ne 0 ]]; then
        msg="$commits_behind_origin updates available in dotfiles on $head_branch branch"
        echo "$msg"
        notify-send -u normal "$msg"
    fi
}

sleep 3 && check_dotfiles_updates >/dev/null 2>&1 &
