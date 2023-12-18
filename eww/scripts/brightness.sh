#!/bin/sh

level=$(brightnessctl g)

if [ "$1" = "up" ]; then
  brightnessctl set $((level + 2))
elif [ "$1" = "down" ]; then
    brightnessctl set $((level - 2))
fi

eww update brightness_listener="(brightness :level $((level * 100 / 255)))"
