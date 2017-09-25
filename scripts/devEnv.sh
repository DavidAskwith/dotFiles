#----Base vim config----#

#adds vundle to vim folder
sudo -u dave git clone https://github.com/VundleVim/Vundle.vim.git /home/dave/.dotFiles/vim/bundle/Vundle.vim

#installs the curl dependency for vundle
apt-get --assume-yes install curl

#adds the packages included in the vimrc
sudo -u dave vim +PluginInstall +qall

#install powerline status line for terminal and vim
apt-get --assume-yes install powerline

#install eslint for js syntax linting
npm install -g eslint

#----Java Dev----#

#java and javafx install
#apt-get --assume-yes install openjdk-8-jdk openjfx

#scene builder
#apt-get --assume-yes install scenebuilder
#TODO: create a PATH variable for opt/
