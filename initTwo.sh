#!/bin/sh

#-----Install notes----#

#jessie backports must be enabled for i3 dependencies

#remove the cdrom repo from /etc/apt/sources.list
#TODO:set up pinning for the stretch repo

#----Installs Programs----#

#echo "\n#-----xorg Install----#\n"

#xorg
#apt-get --assume-yes install xorg

#echo "\n#-----aoutconf make gcc for i3gaps compilation from source----#\n"

#programs needed for install of i3gaps
#apt-get --assume-yes install autoconf make gcc

#i3gaps

#dependencies
#apt-get -t jessie-backports --assume-yes install libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-icccm4-dev 

#must be installed from stretch!!!!!!! not backports
#apt-get --assume-yes install libcairo2-dev  

#clones the i3gaps repo to ~/.gitInstalled 
#git clone https://www.github.com/Airblader/i3 /home/dave/.gitInstalled/i3-gaps 

#compile and install all must be perfoemed in i3-gaps folder
#TODO: make it work from script 
#autoreconf --force --install 
#rm -rf build
#mkdir -p ap:build && cd build
#../configure --prefix=/usr --sysconfdir=/etc
#make
#sudo make install 

#lightdm display manager 
#apt-get --assume-yes install lightdm

#for i3 
#apt-get --assume-yes install i3lock 

#installs i3blocks without recomenededd packages
#apt-get --no-install-recommends install i3blocks

#installs i3blocks dependencies
#apt-get --assume-yes install alsa-utils gawk libanyevent-i3-perl libanyevent-perl libasound2 libasound2-data libasync-interrupt-perl libcommon-sense-perl libev-perl libguard-perl

#installs rofi !!!!!!must be installed from stretch
#apt-get --assume-yes install rofi

#install of vim 
apt-get --assume-yes install vim-gtk

#rxvt terminal emulator
#apt-get --assume-yes install rxvt-unicode
