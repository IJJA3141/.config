#!/bin/sh

if [ "$(nmcli | grep 'wlp1s0: connected' --count)" -eq 1 ]; then
  echo '(box "󰤨")'
else
  echo '(box "󰤯")'
fi
