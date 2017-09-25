#TODO: Research and change the file promitions for generated 
#symbolic links
#TODO: Breakout vim for to allow for vim only installs
#TODO: rmove font if not necessary
#----- ~/ clean up--------#

##removes all dot files that will be added

rm -rv /home/dave/.vim 
rm -v /home/dave/.vimrc 
rm -v /home/dave/.bash_aliases 
rm -v /home/dave/.bashrc 
rm -rv /home/dave/.i3 
rm -v /home/dave/.gitconfig
rm -v /home/dave/.Xresources
rm -v /home/dave/.fonts

#------install section-----#

#creating symbolic links for . folders

ln -sv /home/dave/.dotFiles/vimrc /home/dave/.vimrc
ln -sv /home/dave/.dotFiles/vim /home/dave/.vim
ln -sv /home/dave/.dotFiles/bashrc /home/dave/.bashrc
ln -sv /home/dave/.dotFiles/bash_aliases /home/dave/.bash_aliases
ln -sv /home/dave/.dotFiles/gitconfig /home/dave/.gitconfig
ln -sv /home/dave/.dotFiles/i3 /home/dave/.i3
ln -sv /home/dave/.dotFiles/Xresources /home/dave/.Xresources
ln -sv /home/dave/.dotFiles/fonts /home/dave/.local/share/fonts

# updates font cache
fc-cache -f -v

#TODO: use with sym link if possible
#background
mkdir /usr/share/images/backgrounds
cp /home/dave/.dotFiles/AshlynBg.png /usr/share/images/backgrounds/background.png

#Lightdm#
#TODO create with print statement
rm /etc/lightdm/lightdm-gtk-greeter.conf
ln -sv /home/dave/.dotFiles/lightdm-gtk-greeter.conf /etc/lightdm/lightdm-gtk-greeter.conf
