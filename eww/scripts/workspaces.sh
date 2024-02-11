#!/bin/sh

##

handle() {
case $1 in workspace*)
            str='(box :class "workspaces" '

            for i in 1 2 3 4 5; do
                if [ $i -eq "${1: -1}" ]; then
                    str="${str} (box :class \"workspace-active\" \" \")"
                elif [ "$(hyprctl workspaces -j | jq '.[] | select(.id=='$i').windows')" -gt 0 ]; then
                    str="${str} (box :class \"workspace-used\" \" \")"
                else
                    str="${str} (box :class \"workspace-unused\" \" \")"
                fi
            done

            str="${str} )"
            echo "$str"
            ;;
    esac
}

echo "(box :class \"workspaces\"\
(box :class \"unused_workspace\" \" \")\
(box :class \"unused_workspace\" \" \")\
(box :class \"workspace-active\" \" \")\
(box :class \"unused_workspace\" \" \")\
(box :class \"unused_workspace\" \" \"))"

sleep 11

for i in 4 5 1 2 3; do
    hyprctl dispatch movetoworkspace $i > /dev/null
done

socat -U - "UNIX-CONNECT:/tmp/hypr/${HYPRLAND_INSTANCE_SIGNATURE}/.socket2.sock" | while read -r line; do handle "$line"; done
