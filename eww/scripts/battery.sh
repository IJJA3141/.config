#!/bin/sh

#󰁺󰁻󰁼󰁽󰁾󰁿󰂀󰂁󰂂󰁹󰂄

while true; do
    level=$(cat /sys/class/power_supply/BAT0/capacity)
    state=$(cat /sys/class/power_supply/BAT0/status)
    file=/tmp/battery

    if [ "$state" = "Charging" ]; then
        icon="󰂄"
    elif [ "$level" -gt 90 ]; then
        icon="󰁹"
    elif [ "$level" -gt 80 ]; then
        icon="󰂂"
    elif [ "$level" -gt 70 ]; then
        icon="󰂁"
    elif [ "$level" -gt 60 ]; then
        icon="󰂀"
    elif [ "$level" -gt 50 ]; then
        icon="󰁿"
    elif [ "$level" -gt 40 ]; then
        icon="󰁾"
    elif [ "$level" -gt 30 ]; then
        icon="󰁽"
    elif [ "$level" -gt 20 ]; then
        icon="󰁼"
    elif [ "$level" -gt 10 ]; then
        icon="󰁻"
    else
        icon="󰁺"
    fi

    if [ -f $file ] && [ "$state" = "Charging" ]; then
        rm /tmp/battery
    fi

    if [ "$level" -lt 31 ] && ! [ -f file ] && ! [ "$state" = "Charging" ]; then
        #notify-send "test"
        touch /tmp/battery
    fi

    echo "(battery :icon '${icon}' :level '${level}')"

    sleep 10 
done
