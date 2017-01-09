#!/bin/sh

#-----Install notes----#

#below is for the install of i 3gaps and configureing its dependency to update from stretch
#added sid repo to /etc/apt/sources.list in order to install dependencies 
#added APT: : Default-Release "jessie"; to /etc/apt/apt.cond.d/70debconf to stop updates from stretch
#TODO: create /etc/apt/preferences.d/stretch and pin all depeendenies to update from stretch

#
#remove the cdrom repo from /etc/apt/sources.list

#----Installs Programs----#

#xorg
#apt-get --assume-yes install xorg

#lightdm display manager 
#apt-get --assume-yes install lightdm

#programs needed for install of i3gaps
#apt-get --assume-yes install autoconf make gcc

#git 
#apt-get --assume-yes install git

#i3gaps

#dependencies
apt-get --assume-yes install libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-icccm4-dev  


#makes folder for git installed programs
#mkdir /home/dave/.gitInstalled

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

#for i3 
#apt-get --assume-yes install i3lock i3blocks 

