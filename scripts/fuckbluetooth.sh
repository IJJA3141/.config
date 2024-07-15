#!/bin/sh

sudo rfkill unblock bluetooth
sudo systemctl start bluetooth
