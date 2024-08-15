#!/bin/sh

if bluetoothctl show | grep -q 'Powered: yes';  then
    bluetoothctl power off >> /dev/null
    eww update bluetooth_listener="(icon :icon '󰂲')"
else
    bluetoothctl power on >> /dev/null
    if ! bluetoothctl show | grep -q 'Powered: yes';  then
        zsh ~/.config/scripts/fuckbluetooth.sh
        bluetoothctl power on >> /dev/null
    fi
    eww update bluetooth_listener="(icon :class_name 'blue' :icon '󰂯')"
fi
