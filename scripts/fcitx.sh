#!/bin/sh

im=$(fcitx5-remote -n)

if [ "$im" = "mozc" ]; then
    fcitx5-remote -s keyboard-ch-fr
elif [ "$im" = "keyboard-us" ]; then
    fcitx5-remote -s mozc
else
    fcitx5-remote -s keyboard-us
fi

im2=$(fcitx5-remote -n)

if [ "$im2" = "mozc" ]; then
    eww update keyboard_listener='日\n本\n語'
elif [ "$im2" = "keyboard-us" ]; then
    eww update keyboard_listener='en'
else
    eww update keyboard_listener='fr'
fi
