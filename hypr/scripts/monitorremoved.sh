#!/bin/sh

if ! hyprctl monitors all | grep -q 'description: Dell Inc. DELL S2721DGF HQGJW83'; then
    hyprctl keyword monitor desc:California Institute of Technology 0x1402, 2880x1800@90, 0x0, 1

    eww close-all
    eww open-many bar_long notification
    eww reload
fi
