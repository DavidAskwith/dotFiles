echo "\n#-----Installing X Server----#\n"

#xorg
apt-get --assume-yes install xorg

#----i3gaps----#

echo "\n#-----Installing i3gaps----#\n"

#programs needed to instal i3gaps
apt-get --assume-yes install autoconf make gcc

#dependencies
apt-get --assume-yes install libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-icccm4-dev libcairo2-dev

#clones the i3gaps repo to ~/.gitInstalled
git clone https://www.github.com/Airblader/i3 /usr/local/bin/i3-gaps

#compile and install all must be perfoemed in i3-gaps folder
#TODO: test with the navigateing to dir once in same process
(cd /usr/local/bin/i3-gaps && exec autoreconf --force --install)
(cd /usr/local/bin/i3-gaps && exec rm -rf build)
(cd /usr/local/bin/i3-gaps && exec mkdir -p build)

(cd /usr/local/bin/i3-gaps/build && exec ../configure --prefix=/usr --sysconfdir=/etc)
(cd /usr/local/bin/i3-gaps/build && exec make)
(cd /usr/local/bin/i3-gaps/build && exec make install)


#----i3 components----#

echo "#----Installing i3 Components----#"

#for i3
apt-get --assume-yes install i3lock

#i3blocks dependencies
apt-get --assume-yes install alsa-utils gawk libanyevent-i3-perl libanyevent-perl libasound2 libasound2-data libasync-interrupt-perl libcommon-sense-perl libev-perl libguard-perl acpi

#i3blocks without recomenededd packages
apt-get --no-install-recommends install i3blocks

#install to allow for mstat cpu
apt-get --assume-yes  install sysstat

#rofi for alternate d menu
apt-get --assume-yes install rofi

#compton for display effects eg. transparency
apt-get --assume-yes install compton

#lightdm display manager
apt-get --assume-yes install lightdm

#backlight control
apt-get --assume-yes install xbacklight

#TODO: Manually add themes
#lxapearance installed in order to allow for theme changes
apt-get --assume-yes install lxappearance
