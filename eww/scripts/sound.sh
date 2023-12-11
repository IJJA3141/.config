#!/bin/sh

if [ "$(pactl get-sink-mute 0)" = "Mute:yes" ]; then
	echo "(box :class \"muted\" \"muted\")"
else
	volume=$(pulsemixer --get-volume | sed -n -e 's/\( .*\)// p')

	if [ "$volume" -gt 80 ]; then
		echo "(box :class \"high\" \"$volume%\")"
	elif [ "$volume" -gt 60 ]; then
		echo "(box :class \"mid\" \"$volume%\")"
	elif [ "$volume" -gt 40 ]; then
		echo "(box :class \"low\" \"$volume%\")"
	else
		echo "(box :class \"wisper\" \"$volume%\")"
	fi
fi

pactl subscribe | while read -r x event y type num; do
	if [ "$event" = "'change'" ] && [ "$type" = "sink" ]; then
		if [ "$(pactl get-sink-mute 0)" = "Mute: yes" ]; then
			echo "(box :class \"muted\" \"muted\")"
		else
			volume=$(pulsemixer --get-volume | sed -n -e 's/\( .*\)// p')

			if [ "$volume" -gt 80 ]; then
				echo "(box :class \"high\" \"$volume%\")"
			elif [ "$volume" -gt 60 ]; then
				echo "(box :class \"mid\" \"$volume%\")"
			elif [ "$volume" -gt 40 ]; then
				echo "(box :class \"low\" \"$volume%\")"
			else
				echo "(box :class \"wisper\" \"$volume%\")"
			fi
		fi
	fi
done
