#!/bin/sh

while true; do
	level=$(cat /sys/class/power_supply/BAT0/capacity)
	state=$(cat /sys/class/power_supply/BAT0/status)
	file=/tmp/battery

	echo "(box :class \"battery\" \"$level\")"

	if [ -f "$file" ] && { [ "$level" -gt 30 ] || [ "$state" = "Charging" ]; }; then
		rm /tmp/battery

	else
		touch /tmp/battery
		notify-send "tset"

	fi

	sleep 10
done
