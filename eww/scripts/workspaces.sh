#!/bin/sh

##

handle() {
	case $1 in workspace*)
		str='(box :class "workspaces" '

		for i in 1 2 3 4 5; do
			if [ $i -eq "${1: -1}" ]; then
				str="${str} (box :class \"active_workspace\" \"\")"
			elif [ "$(hyprctl workspaces -j | jq '.[] | select(.id=='$i').windows')" -gt 0 ]; then
				str="${str} (box :class \"used_workspace\" \"\")"
      else
        str="${str} (box :class \"unused_workspace\" \"\")"
      fi
		done

		str="${str} )"
		echo "$str"
		;;
	esac
}

for i in 2 3 4 5 1; do
	hyprctl dispatch movetoworkspace $i
done

echo '(box :class "workspaces" (box :class \"active_workspace\" \"\") (box :class \"unused_workspace\" \"\") (box :class \"unused_workspace\" \"\") (box :class \"unused_workspace\" \"\") (box :class \"unused_workspace\" \"\"))'

socat -U - "UNIX-CONNECT:/tmp/hypr/${HYPRLAND_INSTANCE_SIGNATURE}/.socket2.sock" | while read -r line; do handle "$line"; done
