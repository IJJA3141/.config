#!/bin/bash

pactl set-source-mute 0 toggle
if [[ "$(pactl get-source-mute 0)" == "Mute: yes" ]]; then
    echo  ''
else
    echo ''
fi
