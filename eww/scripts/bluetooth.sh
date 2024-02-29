#!/bin/sh

if bluetoothctl show | grep -q 'Powered: yes';  then
    if [ "$1" != "locked" ]; then
        bluetoothctl power off >> /dev/null
        eww update bluetooth_listener="(bluetooth :level '󰂲' :syle 'color: #cc241d')"
    else
        eww update bluetooth_listener="(bluetooth :level '󰂯')"
    fi
else
    if [ "$1" != "locked" ]; then
        bluetoothctl power on >> /dev/null
        eww update bluetooth_listener="(bluetooth :level '󰂯')"
    else
        eww update bluetooth_listener="(bluetooth :level '󰂲' :syle 'color: #cc241d')"
    fi
fi
