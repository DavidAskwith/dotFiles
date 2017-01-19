#!/bin/sh

#-----Install notes----#

#jessie backports must be enabled for i3 dependencies

#remove the cdrom repo from /etc/apt/sources.list
#added - UUID=4E34BCFC34BCE85B /media/Windows ntfs-3g defaults 0 0 -to /etc/fstab for Windows partition mounting Ashlyn
#libreoffice-gtk to enablt gtk theme
#TODO:set up pinning for the stretch repo for rofi and libcairo2 package

#microsoft fonts
#apt-get install ttf-mscorefonts-installer
#ln -s /etc/fonts/conf.avail/10-autohint.conf /etc/fonts/conf.d/

#installed grive2 in .gitInstalled info on install at https://github.com/vitalif/grive2.git

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
#/usr/share/X11/xorg.conf.d/50-synaptic....?
#added to Default clickpad buttons
#option "AreaBottomEdge" "1"


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

#compton for display effects eg. transparency
#apt-get --assume-yes install compton

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
#apt-get --assume-yes install vim-gtk

#rxvt terminal emulator
#apt-get --assume-yes install rxvt-unicode-256color

#chrome install
#wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
#sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
#apt-get update
#apt-get --assume-yes install google-chrome-stable

#ntfs-3g for working with ntfs eg. windows
#apt-get --assume-yes install ntfs-3g

#----Networking---#
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
#apt-get --asssume-yes install pulseaudio pavucontrol alsa-utils

#used to set up the order of the sound devices
#both may be needed unsure test it

#allow user to edit .asoundrc !!!
#printf "#switches the order of sound devices\ndefaults.pcm.card=1" > /home/dave/.asoundrc
#printf "#switches the order of sound devices\noptions snd_hda_intel index=1,0" > /etc/modprobe.d/thinkpad-t450s.conf

#---Theme----#
#echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/Debian_8.0/ /' > /etc/apt/sources.list.d/arc-theme.list
#apt-get update
#apt-get --assume-yes install arc-theme

#lxapearance
#installed in order to allow for theme changes
#apt-get --assume-yes install lxappearance

#background
#mkdir /usr/share/images/backgrounds
#cp /home/dave/.dotFiles/AshlynBg.png /usr/share/images/backgrounds/background.png
#mv /usr/share/images/backgrounds/AshlynBg.png /usr/share/backgrounds/background.png
#!!! copy BirthaBg to same location

#installs unzip
#apt-get --force-yes --assume-yes install unzip

#used to add apt feature such as add-apt-repository
#apt-get --assume-yes install software-properties-common

#drive install
#sudo apt-get --assume-yes -t jessie-backports install golang mercurial
#go get -u github.com/odeke-em/drive/cmd/drive

#!!!!! Ashlyn ONLY
#ln -sv /media/Windows/Users/dkask/ /home/dave/GoogleDrive

#libreoffice and package for gtk theme suport
#apt-get --assume-yes --force-yes install libreoffice libreoffice-gtk

#transmission
#apt-get --assume-yes install transmission

#solves backlight error
#created /etc/X11/xorg.conf with this content
#Section "Device"
    #Identifier  "Card0"
    #Driver      "intel"
    #Option      "Backlight"  "intel_backlight"
#EndSection

#----File locations for copied files---##

#lightdm-gtk-greeter.conf located in /etc/lightdm
#NetworkManager.conf located in /etc/NetworkManager

#----Random Notes----#
#must run below in order to have virtualbox run without errors
# sudo apt-get install build-essential linux-headers-`uname -r`
# sudo dpkg-reconfigure virtualbox-dkms
# sudo modprobe vboxdrv

