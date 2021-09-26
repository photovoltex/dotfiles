#!/bin/sh

sudo pacman -S virtualbox-guest-iso
sudo mount /usr/lib/virtualbox/additions/VBoxGuestAdditions.iso /mnt
cd /mnt
sudo ./VBoxLinuxAdditions.run
