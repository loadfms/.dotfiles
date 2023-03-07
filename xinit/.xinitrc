# Disable bell
xset -b

# Load Xresources
[[ -f ~/.Xresources ]] && xrdb -merge "${HOME}/.Xresources"

# Configure keyboard layout
setxkbmap -layout us -variant intl
xmodmap -e "keycode 119 = grave asciitilde"

# Start i3
exec i3
