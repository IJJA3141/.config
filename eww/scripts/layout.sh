#!/bin/sh

while true; do
	im=$(fcitx5-remote -n)

	if [ "$im" = "keyboard-us" ]; then
    echo "(box :class \"layout\" \"US\")"
	elif [ "$im" = "mozc" ]; then
    echo "(box :class \"layout\" \"JP\")"
	else
    echo "(box :class \"layout\" \"FR\")"
	fi

  sleep 2
done
