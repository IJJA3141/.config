#!/bin/sh

single=true;

notify-send "$1 has been added"

if hyprctl monitors all | grep -q 'description: Dell Inc. DELL S2721DGF HQGJW83'; then
    if $single ; then
        hyprctl keyword monitor desc:Lenovo Group Limited 0x8A90, disable
        hyprctl keyword monitor description: Dell Inc. DELL S2721DGF HQGJW83, 2560x1440@60, 0x0, 1

        eww close-all
        eww open-many notifications --arg height=1440 bar_left --arg height=1440 bar_right
    else
        eww open-many notifications --arg height=1800 bar_left --arg height=1800 bar_right
    fi

    zsh ~/.config/scripts/eww-init.sh
fi
