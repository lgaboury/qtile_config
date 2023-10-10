#!/bin/bash

# Update system
sudo apt update
sudo apt upgrade

# Install required packages
sudo apt install python3-pip jq imagemagick picom rofi curl \
    xfce4-power-manager fonts-firacode

# Install alacritty
wget https://launchpad.net/~aslatter/+archive/ubuntu/ppa/+files/alacritty_0.12.0+1-20230416T020426~jammy-ead65221_amd64.deb
sudo dpkg -i alacritty_0.12.0+1-20230416T020426~jammy-ead65221_amd64.deb

# Install google-chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# Install latest version of dunst
wget https://launchpad.net/ubuntu/+archive/primary/+files/dunst_1.9.2-1_amd64.deb
sudo dpkg -i dunst_1.9.2-1_amd64.deb

# Install latest version of polybar
#wget http://mirrors.kernel.org/ubuntu/pool/universe/p/polybar/polybar_3.6.3-1_amd64.deb
#sudo dpkg -i polybar_3.6.3-1_amd64.deb

pip install qtile --user
pip install pulsectl_asyncio --user
pip install pywal --user
#pip install types-psutil --user
#pip install psutil --user

# Copy required fonts not available in Ubuntu
sudo cp FiraCodeNerdFont-Regular.ttf /usr/local/share/fonts/
sudo cp 'Font Awesome 6 Free-Solid-900.otf' /usr/local/share/fonts/

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
