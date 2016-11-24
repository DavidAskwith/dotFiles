#!/usr/bin/bash

#TO DO

#Research and change the file promitions for generated 
#symbolic links

#this file is used to setup symlinks for all the source 
#controlled dot files

#----- ~/ clean up--------#

#removes all dot files that will be added

rm -v ~/.vim ~/.vimrc ~/.bash_aliases ~/.bashrc 

#------install section-----#

#creating symbolic links for . folders

#.vimrc
ln -sv $HOME/.dotFiles/vimrc $HOME/.vimrc

#.vim
ln -sv $HOME/.dotFiles/vim $HOME/.vim

#.bashrc
ln -sv $HOME/.dotFiles/bashrc $HOME/.bashrc

#.bash_aliases
ln -sv $HOME/.dotFiles/bash_aliases $HOME/.bash_aliases

#.profile 
ln -sv $HOME/.dotFiles/profile $HOME/.profile

#.gitconfig
ln -sv $HOME/.dotFiles/gitconfig $HOME/.gitconfig

#.startScript
lv -s $HOME/.dotFiles/startScript $HOME/.startScript


#adds vundle to vim folder
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#prompt for install of curl
echo "#---Password for install of curl---#\n"

#installs the curl dependency for vundle
sudo apt-get install curl

#adds the packages included in the vimrc
vim +PluginInstall +qall

echo "#----Install Complete!!----#"


