#!/bin/sh

notify-send 'new-monitor'

if hyprctl monitors all | grep -q 'description: Dell Inc. DELL S2721DGF HQGJW83'; then
    hyprctl keyword monitor desc:California Institute of Technology 0x1402, disable
    hyprctl keyword monitor description: Dell Inc. DELL S2721DGF HQGJW83, 2560x1440@144, 0x0, 1

    eww close-all
    eww open-many bar_short notification
    eww reload
fi
