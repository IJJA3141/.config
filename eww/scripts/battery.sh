#!/bin/sh

while true; do
	level=$(cat /sys/class/power_supply/BAT0/capacity)
	state=$(cat /sys/class/power_supply/BAT0/status)

	echo "(box :class \"battery\" \"$level\")"

	if [ "$state" = "Charging" ]; then
		rm /tmp/battery

	elif [ "$level" -lt 30 ]; then
		FILE=/tmp/battery

		if ! [ -f "$FILE" ]; then
			echo "$level"

			touch /tmp/battery
		fi
	fi

	sleep 10
done
