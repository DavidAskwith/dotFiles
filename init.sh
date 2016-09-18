#!/usr/bin/bash

#this file is used to setup symlinks for all the source 
#controlled dot files

#.vimrc
ln -sv $HOME/.dotFiles/vimrc $HOME/.vimrc

#.vim
ln -sv $HOME/.dotFiles/vim $HOME/.vim

#.bashrc
ln -sv $HOME/.dotFiles/bashrc $HOME/.bashrc

#.bash_aliases
ln -sv $HOME/.dotFiles/bash_aliases $HOME/.bash_aliases
