#!/bin/sh

#-----Install notes----#

#added - "UUID=4E34BCFC34BCE85B /media/Windows ntfs-3g defaults 0 0 " to /etc/fstab for Windows partition mounting Ashlyn

#TODO:
#update Network setup to print into /etc/NetworkManager/NetworkManager.conf

#vmware-view
#ln -s /lib/x86_64-linux-gnu/libudev.so.1 /lib/x86_64-linux-gnu/libudev.so.0
#solves the error on install

#middle scroll
#/usr/share/X11/xorg.conf.d
#Section "InputClass"
   #Identifier	"Trackpoint Wheel Emulation"
   #MatchProduct	"TPPS/2 IBM TrackPoint|DualPoint Stick|Synaptics Inc. Composite TouchPad / TrackPoint|ThinkPad USB Keyboard with TrackPoint|USB Trackpoint pointing device|Composite TouchPad / TrackPoint"
   #MatchDevicePath	"/dev/input/event*"
   #Option		"EmulateWheel"		"true"
   #Option		"EmulateWheelButton"	"2"
   #Option		"Emulate3Buttons"	"false"
   #Option		"XAxisMapping"		"6 7"
   #Option		"YAxisMapping"		"4 5"
#EndSection

#trackpad disabled
#/usr/share/X11/xorg.conf.d/50-synaptic.conf
#added to Default clickpad buttons
#option "AreaBottomEdge" "1"

#must run below in order to have virtualbox run without errors
# sudo apt-get install build-essential linux-headers-`uname -r`
# sudo dpkg-reconfigure virtualbox-dkms
# sudo modprobe vboxdrv

#Networking
#remove
# The primary network interface
#allow-hotplug eth0
#iface eth0 inet dhcp

#NodeJS
#install both npm and nodejs
# to avoid errors with global packages /usr/bin/nodejs /usr/bin/node

#VMware View
#dependency issue fix
#ln -sv /lib/x86_64-linux-gnu/libudev.so.1 /lib/x86_64-linux-gnu/libudev.so.0

#----Installs Programs----#

#echo "\n#-----xorg Install----#\n"

#xorg
#apt-get --assume-yes install xorg


#----i3gaps----#

#programs needed for install of i3gaps
#apt-get --assume-yes install autoconf make gcc

#dependencies
#apt-get --assume-yes install libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-icccm4-dev libcairo2-dev

#rofi
#apt-get --assume-yes install rofi

#clones the i3gaps repo to ~/.gitInstalled
#git clone https://www.github.com/Airblader/i3 /usr/local/bin/i3-gaps

#compile and install all must be perfoemed in i3-gaps folder
#TODO: make it work from script
#(cd /usr/local/bin && exec command-executed) could work?
#(cd /usr/local/bin/i3-gaps && exec autoreconf --force --install)
#(cd /usr/local/bin/i3-gaps && exec rm -rf build)
#(cd /usr/local/bin/i3-gaps && exec mkdir -p build)

#(cd /usr/local/bin/i3-gaps/build && exec sudo ../configure --prefix=/usr --sysconfdir=/etc)
#(cd /usr/local/bin/i3-gaps/build && exec make)
#(cd /usr/local/bin/i3-gaps/build && exec make install)

#compton for display effects eg. transparency
#apt-get --assume-yes install compton

#lightdm display manager
#apt-get --assume-yes install lightdm

#for i3
#apt-get --assume-yes install i3lock

#installs i3blocks dependencies
#apt-get --assume-yes install alsa-utils gawk libanyevent-i3-perl libanyevent-perl libasound2 libasound2-data libasync-interrupt-perl libcommon-sense-perl libev-perl libguard-perl

#installs i3blocks without recomenededd packages
#apt-get --no-install-recommends install i3blocks

#install of vim
#apt-get --assume-yes install vim-gtk

#rxvt terminal emulator
#apt-get --assume-yes install rxvt-unicode-256color

#chromium install
#apt-get --assume-yes install chromium

#----drives----#

#ntfs-3g for working with ntfs eg. windows
#apt-get --assume-yes install ntfs-3g

#----Networking----#
#apt-get --assume-yes install firmware-iwlwifi network-manager network-manager-gnome

#sim links file to allow for ethernet management with nm-applet
#rm /etc/NetworkManager/NetworkManager.conf
#ln -sv /home/dave/.dotFiles/NetworkManager.conf /etc/NetworkManager/NetworkManager.conf

#----Lightdm----#
#rm /etc/lightdm/lightdm-gtk-greeter.conf
#ln -sv /home/dave/.dotFiles/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf

#----Backlight for Ashlyn----#

#!!!!! only works with intel remove for bertha
#apt-get --assume-yes install xbacklight

#----audio----#
#installs alsa pulseaudio pavucontrol to control sound alsa-utils
#gets you amixer for volume control
#apt-get --assume-yes install pulseaudio pavucontrol alsa-utils

#---Theme----#
#echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/Debian_8.0/ /' > /etc/apt/sources.list.d/arc-theme.list
#apt-get update
#apt-get --force-yes --assume-yes install arc-theme

#lxapearance
#installed in order to allow for theme changes
#apt-get --assume-yes install lxappearance

#background
mkdir /usr/share/images/backgrounds
cp /home/dave/.dotFiles/AshlynBg.png /usr/share/images/backgrounds/background.png
mv /usr/share/images/backgrounds/AshlynBg.png /usr/share/backgrounds/background.png

#installs unzip and zip
apt-get --force-yes --assume-yes install unzip zip

#used to add apt feature such as add-apt-repository
apt-get --assume-yes install software-properties-common

#drive install
sudo apt-get --assume-yes install golang mercurial
sudo -u dave mkdir /home/dave/.go

#works when ran ouside of file as dave.......
#sudo -u dave go get -u github.com/odeke-em/drive/cmd/drive

#libreoffice and package for gtk theme suport
#apt-get --assume-yes --force-yes install libreoffice libreoffice-gtk

#transmission
#apt-get --assume-yes install transmission

#install to allow for mstat cpu
#apt-get --assume-yes  install sysstat

#java and javafx install
#apt-get --assume-yes install openjdk-8-jdk openjfx

#scene builder
#apt-get --assume-yes install scenebuilder
#TODO: create a PATH variable for opt/

#microsoft fonts
#apt-get install ttf-mscorefonts-installer
#ln -s /etc/fonts/conf.avail/10-autohint.conf /etc/fonts/conf.d/


