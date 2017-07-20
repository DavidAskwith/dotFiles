#vim with all features
apt-get --assume-yes install vim-gtk

#rxvt terminal emulator
apt-get --assume-yes install rxvt-unicode-256color

#chromium install
apt-get --assume-yes install chromium

#ntfs-3g for working with ntfs
apt-get --assume-yes install ntfs-3g

#wireless networking
apt-get --assume-yes install firmware-iwlwifi network-manager network-manager-gnome

#TODO: create a print statement that sets up the network config
#rm /etc/NetworkManager/NetworkManager.conf
#ln -sv /home/dave/.dotFiles/NetworkManager.conf /etc/NetworkManager/NetworkManager.conf

#unzip and zip
apt-get --force-yes --assume-yes install unzip zip

#adds apt feature such as add-apt-repository
apt-get --assume-yes install software-properties-common

#libreoffice and package for gtk theme suport
apt-get --assume-yes --force-yes install libreoffice libreoffice-gtk

#installs alsa pulseaudio pavucontrol to control sound alsa-utils gets you amixer for volume control
apt-get --assume-yes install pulseaudio pavucontrol alsa-utils

#TODO: test below
#microsoft fonts
#apt-get install ttf-mscorefonts-installer
#ln -s /etc/fonts/conf.avail/10-autohint.conf /etc/fonts/conf.d/

#TODO:test me
#drive install
#sudo apt-get --assume-yes install golang mercurial
#sudo -u dave mkdir /home/dave/.go

#works when ran ouside of file as dave.......
#sudo -u dave go get -u github.com/odeke-em/drive/cmd/drive
