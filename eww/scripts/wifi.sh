#!/bin/sh

if ping -q -c 1 -W 1 google.com >/dev/null; then
  echo '(icon :icon "")'
else
  echo '(icon :class_name "red" :icon "")'
fi

#if [ "$(nmcli | grep 'wlp1s0: connected' --count)" -eq 1 ]; then
#  echo '(box "󰤨")'
#else
#  echo '(box "󰤯")'
#fi
