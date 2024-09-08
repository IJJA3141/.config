#!/bin/sh

if [ "$1" = "up" ] && [ "$volume" -lt 100 ]; then
    pactl set-sink-volume 0 +1%
elif [ "$1" = "down" ]; then
    pactl set-sink-volume 0 -1%
elif [ "$1" = "mute" ]; then
    pactl set-sink-mute 0 toggle
fi

volume=$(pactl get-sink-volume 0 | sed -n -e 's/\%.*// p' | sed -n -e 's/.* // p')
echo "$volume"

if [ "$(pactl get-sink-mute 0)" = "Mute: yes" ]; then
    if [ "$volume" -gt 100 ]; then
        pactl set-sink-volume 0 100%
        eww update sound_listener="(metric :icon '' :value '100')"
    else
        eww update sound_listener="(metric :icon '' :value '${volume}')"
    fi
elif [ "$volume" -lt 33 ]; then
    eww update sound_listener="(metric :icon '' :value '${volume}')"
elif [ "$volume" -lt 66 ]; then
    eww update sound_listener="(metric :icon '' :value '${volume}')"
elif [ "$volume" -lt 101 ]; then
    eww update sound_listener="(metric :icon '' :value '${volume}')"
else 
    pactl set-sink-volume 0 100%
    eww update sound_listener="(metric :icon '' :value '100')"
fi
