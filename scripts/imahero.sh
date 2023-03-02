#!/bin/bash
GREEN="\033[1;32m"
BLUE="\033[1;34m"
NOCOLOR="\033[0m"

echo -e ${BLUE}
echo "██╗███╗   ███╗ █████╗ ██╗  ██╗███████╗██████╗  ██████╗ "
echo "██║████╗ ████║██╔══██╗██║  ██║██╔════╝██╔══██╗██╔═══██╗"
echo "██║██╔████╔██║███████║███████║█████╗  ██████╔╝██║   ██║"
echo "██║██║╚██╔╝██║██╔══██║██╔══██║██╔══╝  ██╔══██╗██║   ██║"
echo "██║██║ ╚═╝ ██║██║  ██║██║  ██║███████╗██║  ██║╚██████╔╝"
echo "╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝ ╚═════╝ "
echo -e ${NOCOLOR}

echo "Fetching tags..."
git fetch --tags

TAG_NEWEST=$1
TAG_OLDEST=$2
COMMITS=`git log $TAG_OLDEST..$TAG_NEWEST --oneline | cut -d' ' -f1 `

LAST=`echo $COMMITS | wc --words`
LAST="$((LAST-1))"
ITER=0

for commit in $COMMITS; do
    echo "Reverting commit: $commit..."
    git revert --no-commit $commit

    if [ $ITER = $LAST ]; then
        git commit -m "🐛 Reverting to release: $TAG_OLDEST"
    fi

    ITER=$(expr $ITER + 1)
done

echo -e ${GREEN}
echo "Okay, you're safe. Just check your commit and push it!"
echo -e ${NOCOLOR}
