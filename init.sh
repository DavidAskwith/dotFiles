#!/usr/bin/bash

#TODO:Research and change the file promitions for generated 
#symbolic links
#TODO:Breakout vim for to allow for vim only installs

#this file is used to setup symlinks for all the source 
#controlled dot files

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
ln -sv /home/dave/.dotFiles/fonts /home/dave/.fonts

#adds vundle to vim folder
sudo -u dave git clone https://github.com/VundleVim/Vundle.vim.git /home/dave/.dotFiles/vim/bundle/Vundle.vim

#prompt for install of curl
echo "#---Password for install of curl---#\n"

#installs the curl dependency for vundle
sudo apt-get --assume-yes install curl

#adds the packages included in the vimrc
#TODO: Run as dave not root!
vim +PluginInstall +qall

echo "#----Install Complete!!----#"


