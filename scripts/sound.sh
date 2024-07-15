#!/bin/sh

if [ "$1" = "up" ]; then
    pactl set-sink-volume 0 +1%
elif [ "$1" = "down" ]; then
    pactl set-sink-volume 0 -1%
elif [ "$1" = "mute" ]; then
    pactl set-sink-mute 0 toggle
fi

volume=$(pactl get-sink-volume 0 | sed -n -e 's/\%.*// p' | sed -n -e 's/.* // p')

if [ "$(pactl get-sink-mute 0)" = "Mute: yes" ]; then
    eww update sound_listener="(icon_text :icon '' :text '${volume}')"
elif [ "$volume" -lt 33 ]; then
    eww update sound_listener="(icon_text :icon '' :text '${volume}')"
elif [ "$volume" -lt 66 ]; then
    eww update sound_listener="(icon_text :icon '' :text '${volume}')"
else
    eww update sound_listener="(icon_text :icon '' :text '${volume}')"
fi
