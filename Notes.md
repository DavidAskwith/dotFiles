The-Stuff-I-Need-To-Know
======================

##HDD Mounting

* Run fdisk -l to find aprtitions
* Run blkid /dev/partition
* Copy the uuid
* Entry in fstab in the following format
    * UUID=00000000 /media/Storage ntfs-3g uid=1000,gid=1000,dmask=022,fmask=133 0 0

##Installing VMware view 

* libpng12-0 is a mssed dependency must install direct from debian site

##Installing emulator for android

* cd ~/Android/Sdk/emulator/lib64/libstdc++
* sudo mv libstdc++.so.6 libstdc++.so.6.og 
* sudo ln -s /usr/lib64/libstdc++.so.6 ~/Android/Sdk/emulator/lib64/libstdc++

##

#TODO

* eslint --intit after install
* change bg color
* go htrough TODO's in files
* test install in VM 
* there is somethin gup with the permission on the mounted storage drive
* you need to configure powerline in the dotfiles


