#!/bin/bash

# sudo add-apt-repository ppa:aslatter/ppa
sudo apt update
sudo apt install python3-pip jq imagemagick alacritty picom dunst rofi curl \
    xfce4-power-manager

pip install qtile --user
pip install pulsectl_asyncio --user
pip install pywal --user
pip install types-psutil --user
pip install psutil --user

# sudo touch /usr/share/xsessions/qtile.desktop
sudo bash -c 'cat > /usr/share/xsessions/qtile.desktop <<EOF
[Desktop Entry]
Name=Qtile
Comment=Qtile Session
Exec=qtile start
Type=Application
Keywords=wm;tiling
EOF'

sudo bash -c 'cat > /etc/X11/xorg.conf.d/30-touchpad.conf <<EOF
Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "Tapping" "on"
    Option "NaturalScrolling" "true"
    Option "TappingButtonMap" "lrm"
EndSection
EOF'
