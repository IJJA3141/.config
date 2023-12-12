#!/bin/sh

#if [ "$(nmcli | grep 'wlp1s0: connected' --count)" -eq 1 ]; then
#  echo '(box "󰤨")'
#else
#  echo '(box "󰤯")'
#fi

if ping -q -c 1 -W 1 google.com >/dev/null; then
	echo '(box "󰤨")'
else
	echo '(box "󰤯")'
fi
