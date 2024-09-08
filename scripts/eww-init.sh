#!/bin/sh

sleep 2

pactl set-source-mute alsa_input.pci-0000_03_00.6.analog-stereo true

level=$(brightnessctl i | grep -o '[0-9][0-9]\?[0-9]\?%')
eww update brightness_listener="${level::-1}"

if bluetoothctl show | grep -q 'Powered: yes';  then
    bluetoothctl power off
fi

zsh ~/.config/scripts/sound.sh

for i in 4 5 1 2 3; do
    hyprctl dispatch workspace $i
done
