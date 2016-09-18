#!/usr/bin/bash

#this file is used to setup symlinks for all the source 
#controlled dot files

#----- ~/ clean up--------#

#removes all dot files that will be added
echo "cleaning up home directory\n"

rm -v ~/.vim ~/.vimrc ~/.bash_aliases ~/.bashrc 
rm -v ~/.dotFiles 

echo "\nclean up complete\n"

#------install section-----#

echo "Adding symlinks to ~/\n"

#.vimrc
ln -sv $HOME/.dotFiles/vimrc $HOME/.vimrc

#.vim
ln -sv $HOME/.dotFiles/vim $HOME/.vim

#.bashrc
ln -sv $HOME/.dotFiles/bashrc $HOME/.bashrc

#.bash_aliases
ln -sv $HOME/.dotFiles/bash_aliases $HOME/.bash_aliases

echo "\nSymlinks added\n"

echo "Vundle install\n"

#adds vundle to vim folder
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

#adds the packages included in the vimrc
vim +PluginInstall +qall

echo "#----Install Complete!!----#"


