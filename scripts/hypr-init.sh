#!/bin/sh

zsh ~/.config/scripts/XDPH.sh &
zsh ~/.config/scripts/fuckbluetooth.sh &
iwctl adapter phy0 set-property Powered on &
zsh ~/.config/scripts/eww-init.sh &
sleep 10 && zsh ~/.config/scripts/monitoradded.sh &
