#!/bin/bash
normal=$(tput sgr0)
blue=$(tput setaf 4)
red=$(tput setaf 1)
# progress bar function
prog() {
    local w=40 p=$1;  shift
    # create a string of spaces, then change them to dots
    printf -v dots "%*s" "$(( $p*$w/100 ))" ""; dots=${dots// /.};
    # print those dots on a fixed-width space plus the percentage etc. 
    printf "\r\e[K|%-*s| %3d %% %s" "$w" "$dots" "$p" "$*"; 
}
# test loop

while true
do
    for x in {1..100} ; do
        prog "$x" ${blue} ${normal}time to work...
        sleep 30 # total 50 min
    done ; echo
    for x in {1..100} ; do
        prog "$x" ${red}ﱄ${normal} time to relax...
        sleep 12 # total 20 min
    done ; echo
done
