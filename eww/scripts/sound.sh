#!/bin/sh






handle() {
	if [ "$(pactl get-sink-mute 0)" = "Mute:yes" ]; then
		echo '(sound :muted true :level 0 :icon "󰸈")'
	else
		volume=$(pulsemixer --get-volume | sed -n -e 's/\( .*\)// p')

		if [ "$volume" -gt 80 ]; then
			echo '(sound :level '$volume' :muted false :icon "󰕾")'
		elif [ "$volume" -gt 60 ]; then
			echo '(sound :level '$volume' :muted false :icon "󰖀")'
		elif [ "$volume" -gt 40 ]; then
			echo '(sound :level '$volume' :muted false :icon "󰕿")'
		else
			echo '(sound :level '$volume' :muted false :icon "󰕿")'
		fi
	fi
}

handle

pactl subscribe | while read -r x event y type num; do
	handle
done
