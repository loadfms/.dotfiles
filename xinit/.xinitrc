# Disable bell
xset -b

# Load Xresources
[[ -f ~/.Xresources ]] && xrdb -merge "${HOME}/.Xresources"

# Configure keyboard layout
setxkbmap -layout us -variant altgr-intl
#xmodmap -e "keycode 119 = grave asciitilde"

xrdb -merge <<< "Xft.dpi: 120"

# Start i3
exec i3
