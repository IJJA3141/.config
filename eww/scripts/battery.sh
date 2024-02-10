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

    if [ "$level" -lt 6 ]; then
        notify-send "fuck you"
        notify-send "3..."
        sleep 1
        notify-send "2..."
        sleep 1
        notify-send "1..."
        sleep 1
        systemctl hibernate
    elif [ "$level" -lt 30 ] && ! [ -f $file ] && ! [ "$state" = "Charging" ]; then
        notify-send "Battery Battery low ! only ${level}% left."
        touch $file
    fi

    if [ "$state" != 100 ]; then
        state=" ${state}"
    fi

    echo "(battery :icon '${icon}' :level '${level}')"

    sleep 20
done
