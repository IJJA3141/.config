#!/bin/sh

for i in 4 5 1 2 3; do
    hyprctl dispatch movetoworkspace $i > /dev/null
done
