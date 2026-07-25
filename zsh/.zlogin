#!/bin/sh

if [ "$(tty)" = "/dev/tty1" ];then
    exec start-hyprland #>> /dev/null
fi
