#!/bin/sh
#(defvar languages '[["US","english"],["JP","日本語"],["FR","français"]]')

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
	eww update current_keyboard='(keyboard :language "日本語" :lg "あ")'
elif [ "$im2" = "keyboard-us" ]; then
	eww update current_keyboard='(keyboard :language "english" :lg "A")'
else
	eww update current_keyboard='(keyboard :language "français" :lg "Ç")'
fi
