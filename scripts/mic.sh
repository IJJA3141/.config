#!/bin/bash

pactl set-source-mute alsa_input.pci-0000_03_00.6.analog-stereo toggle
if [[ "$(pactl get-source-mute 0)" == "Mute: yes" ]]; then
    eww update mic_listener="(icon :icon '󰍭')"
else
    eww update mic_listener="(icon :icon '󰍬')"
fi
