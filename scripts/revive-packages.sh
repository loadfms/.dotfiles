#!/bin/bash
isCommandAvailable () {
  if [[ -x "$(command -v ${1})" ]] ; then return 0 ; fi
  return 1
}

if isCommandAvailable "pacman"; then
    pacman -Qqen > ~/.dotfiles/scripts/packages/community.txt 
    pacman -Qqem > ~/.dotfiles/scripts/packages/aur.txt 
fi
