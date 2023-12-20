#!/usr/bin/env bash

CHOICE=`gh search prs --state=open --review-requested=@me | fzf`
echo $CHOICE

    if [ ! -z "$CHOICE" ]
    then
        URL=`echo $CHOICE | awk '{print "https://www.github.com/"$1"/pull/"$2}'`
        google-chrome $URL
    fi
