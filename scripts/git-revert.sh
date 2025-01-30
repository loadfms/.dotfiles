#!/bin/bash

#commit=$(git log --oneline --color=always | fzf --ansi | awk '{print $1}')
commit=$(git log --oneline --color=always | sed 's/^/  /' | fzf --ansi --height 20 | awk '{print $2}')

if [ -n "$commit" ]; then
    git revert "$commit^..HEAD"
else
    echo "No commit selected."
fi
