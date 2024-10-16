#!/bin/sh

##
#󰄯󰪥󰄰#
#󰄮󰡖󰄱#

handle() {
case $1 in workspace*)
            str='(box :orientation "v" :class "workspaces" '

            for i in 1 2 3 4 5; do
                if [ $i -eq "${1: -1}" ]; then
                    str="${str} (box :class \"workspace-active\" \"󰄯\")"
                elif [ "$(hyprctl workspaces -j | jq '.[] | select(.id=='$i').windows')" -gt 0 ]; then
                    str="${str} (box :class \"workspace-used\" \"󰄯\")"
                else
                    str="${str} (box :class \"workspace-unused\" \"󰄰\")"
                fi
            done

            str="${str} )"
            echo "$str"
            ;;
    esac
}

echo "(box :orientation \"v\" :class \"workspaces\"\
(box :class \"workspace-unused\" \"\")\
(box :class \"workspace-unused\" \"\")\
(box :class \"workspace-active\" \"\")\
(box :class \"workspace-unused\" \"\")\
(box :class \"workspace-unused\" \"\"))"

socat -U - "$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do handle "$line"; done
