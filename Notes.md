The-Shit-I-Need-To-Know
======================

##HDD Mounting

* Run fdisk -l to find aprtitions
* Run blkid /dev/partition
* Copy the uuid
* Entry in fstab in the following format
    * UUID=00000000 /media/Storage ntfs-3g uid=1000,gid=1000,dmask=022,fmask=133 0 0

##Installing VMware view 

* libpng12-0 is a mssed dependency must install direct from debian site

#TODO

* eslint --intit after install
* choose fonts and add to font file if not done
* change bg color
* go htrough TODO's in files
* test install in VM 


