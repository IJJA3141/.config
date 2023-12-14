#!/bin/sh

while true; do
	level=$(cat /sys/class/power_supply/BAT0/capacity)
	state=$(cat /sys/class/power_supply/BAT0/status)
	file=/tmp/battery

	if [ -f "$file" ]; then
		if [ "$state" = "Charging" ]; then
			rm /tmp/battery
			echo '(battery :color "yellow" :charging true :icon "󰂄" :level '$level')'

		elif [ "$level" -gt 30 ]; then
			rm /tmp/battery
			echo '(battery :color "red" :charging false :icon "󰁹" :level '$level')'

		else
			echo '(battery :color "green" :charging false :icon "󰁼" :level '$level')'
		fi

	else
		if [ "$state" = "Charging" ]; then
			echo '(battery :color "yellow" :charging true :icon "󰂄" :level '$level')'

		elif [ "$level" -gt 30 ]; then
			touch /tmp/battery
			#notify-send "tset"

			echo '(battery :color "red" :charging false :icon "󰁹" :level '$level')'

		else
			echo '(battery :color "green" :charging false :icon "󰁼" :level '$level')'
		fi
	fi

	sleep 10
done
