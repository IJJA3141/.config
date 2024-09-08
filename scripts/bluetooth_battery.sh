#!/bin/sh

connected=$(bluetoothctl devices Connected)

if [ "$connected" != "" ]; then
    level=$(bluetoothctl info | grep -o '([0-9]\{2,3\})')
    level=${level:1:-1}
    class=""

    if [ "$level" -gt 90 ]; then
        icon="󰥈"
    elif [ "$level" -gt 80 ]; then
        icon="󰥆"
    elif [ "$level" -gt 70 ]; then
        icon="󰥅"
    elif [ "$level" -gt 60 ]; then
        icon="󰥄"
    elif [ "$level" -gt 50 ]; then
        icon="󰥃"
    elif [ "$level" -gt 40 ]; then
        icon="󰥂"
    elif [ "$level" -gt 30 ]; then
        icon="󰥁"
        class=":class_name 'red'"
    elif [ "$level" -gt 20 ]; then
        icon="󰥀"
        class=":class_name 'red'"
    elif [ "$level" -gt 10 ]; then
        icon="󰤿"
        class=":class_name 'red'"
    else
        icon="󰤾"
        class=":class_name 'red'"
    fi

    echo "(icon_text :class_name '$class' :icon '$icon' :text '$level')"
else
    echo ""
fi
