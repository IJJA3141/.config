#!/bin/sh

# if ping -q -c 1 -W 1 google.com >> /dev/null; then
#   echo '(icon :icon "󰤨")'
# else
#   echo '(icon :class_name "red" :icon "󰤭")'
# fi

if iwctl station wlan0 show | grep -q " connected"; then
    echo '(icon :icon "󰤨")'
else
    echo '(icon :class_name "red" :icon "󰤭")'
fi
