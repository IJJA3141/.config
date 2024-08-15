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
    eww update keyboard_listener='(box :class "fcitx" :space-evenly false :orientation "v" (label :class "icon" :text "󰥻") (label :text "日")(label :text "本")(label :text "語"))'
elif [ "$im2" = "keyboard-us" ]; then
    eww update keyboard_listener='(box :class "fcitx" :space-evenly false :orientation "v" (label :class "icon" :text "󰥻") (label :text "en"))'
else
    eww update keyboard_listener='(box :class "fcitx" :space-evenly false :orientation "v" (label :class "icon" :text "󰥻") (label :text "fr"))'
fi
