#!/bin/bash

# Check if a file exists to determine the current state
if [ -f "/tmp/toogle_sound_output.txt" ]; then
    current_state=$(cat /tmp/toogle_sound_output.txt)
else
    current_state="A"
fi

if [ "$current_state" = "A" ]; then
    echo "󰽟 "
else
    echo "󰋎 "
fi


case "$1" in
--toggle)
    # Toggle between commands A and B
    if [ "$current_state" = "A" ]; then
        # Execute command A
        pactl set-default-sink alsa_output.pci-0000_00_1f.3.analog-stereo
        echo "B" > /tmp/toogle_sound_output.txt
    else
        # Execute command B
        pactl set-default-sink alsa_output.pci-0000_01_00.1.hdmi-stereo-extra3
        echo "A" > /tmp/toogle_sound_output.txt
    fi
esac
