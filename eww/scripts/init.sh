#!/bin/sh

sleep 2

pactl set-source-mute 0 true
eww update mic_listener="(icon :icon '')"

level=$(brightnessctl i | grep -o '[0-9][0-9]\?[0-9]\?%')
eww update brightness_listener="(icon_text :icon ' ' :text ${level::-1})"

if bluetoothctl show | grep -q 'Powered: yes';  then
    eww update bluetooth_listener="(icon :icon '󰂯')"
else
    eww update bluetooth_listener="(icon :icon '󰂲')"
fi

zsh ~/.config/eww/scripts/sound.sh

for i in 4 5 1 2 3; do
    hyprctl dispatch workspace $i
done
