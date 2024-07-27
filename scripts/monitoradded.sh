#!/bin/sh

single=true;

notify-send "$1 has been added"

if hyprctl monitors all | grep -q 'description: Dell Inc. DELL S2721DGF HQGJW83'; then
    if $single ; then
        hyprctl keyword monitor desc:California Institute of Technology 0x1402, disable
        hyprctl keyword monitor description: Dell Inc. DELL S2721DGF HQGJW83, 2560x1440@60, 0x0, 1

        eww close-all
        eww open-many bar:primary --arg primary:screen=0 --arg primary:id=1 notifications
    else
        eww open bar --screen 1 --id 1
    fi

    zsh ~/.config/scripts/eww-init.sh
fi
