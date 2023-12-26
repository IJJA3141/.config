#!/bin/sh

if [ "$1" = "up" ]; then
	pactl set-sink-volume 0 +1%
elif [ "$1" = "down" ]; then
	pactl set-sink-volume 0 -1%
elif [ "$1" = "mute" ]; then
	pactl set-sink-mute 0 toggle
fi

volume=$(pulsemixer --get-volume | sed -n -e 's/\( .*\)// p')

if [ "$(pactl get-sink-mute 0)" = "Mute: yes" ]; then
	eww update sound_listener="(sound :volume ${volume} :icon ' 󰸈 ')"
else
	if [ "$volume" -gt 66 ]; then
		eww update sound_listener="(sound :volume ${volume} :icon ' 󰕾 ')"
  elif [ "$volume" -gt 33 ]; then
		eww update sound_listener="(sound :volume ${volume} :icon ' 󰖀 ')"
  else
		eww update sound_listener="(sound :volume ${volume} :icon ' 󰕿 ')"
  fi
fi
