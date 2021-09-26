#!/bin/sh

sudo usermod -aG $(whoami) lightdm
chmod g+rx ~
sudo mv /etc/lightdm/lightdm.conf ~/.lightdm.conf
sudo ln -s ~/.config/lightdm/lightdm.conf /etc/lightdm/lightdm.conf
sudo ln -s ~/.config/lightdm/slick-greeter.conf /etc/lightdm/slick-greeter.conf
sudo ln -s ~/Wallpapers/3440x1440p_neon.jpg /usr/share/pixmaps/3440x1440p_neon.jpg

systemctl enable lightdm
