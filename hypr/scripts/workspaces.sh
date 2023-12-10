#!/bin/sh

for i in 2 3 4 5 1; do
	hyprctl dispatch movetoworkspace $i
done
