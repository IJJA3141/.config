#!/bin/sh

notify-send "$1 has been added"

if hyprctl monitors all | grep -q 'description: Dell Inc. DELL S2721DGF HQGJW83'; then
    hyprctl keyword monitor desc:California Institute of Technology 0x1402, disable
    hyprctl keyword monitor description: Dell Inc. DELL S2721DGF HQGJW83, 2560x1440@60, 0x0, 1
fi
