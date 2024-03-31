#!/bin/bash

pactl set-source-mute 0 toggle
if [[ "$(pactl get-source-mute 0)" == "Mute: yes" ]]; then
    eww update mic_listener="(icon :icon '')"
else
    eww update mic_listener="(icon :icon '')"
fi
