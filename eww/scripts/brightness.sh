#!/bin/sh

level=$(brightnessctl i | grep -o '[0-9][0-9]\?[0-9]\?%')

if [ "$1" = "up" ]; then
    brightnessctl set "$((${level::-1} + 1))%"
elif [ "$1" = "down" ]; then
    brightnessctl set "$((${level::-1} - 1))%"
fi

level=$(brightnessctl i | grep -o '[0-9][0-9]\?[0-9]\?%')
eww update brightness_listener="(icon_text :icon ' ' :text '${level::-1}')"
