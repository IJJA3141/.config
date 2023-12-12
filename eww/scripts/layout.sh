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
	eww update 'k=(box "JP")'
elif [ "$im2" = "keyboard-us" ]; then
	eww update 'k=(box "US")'
else
	eww update 'k=(box "FR")'
fi
