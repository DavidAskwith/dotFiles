#-----------------------------------------#
#--this file holds all my custom aliases--#
#-----------------------------------------#

#sudo 
alias s='sudo'

#opening files in gui
alias open='xdg-open'

#alias for logout
alias logout='xfce4-session-logout --logout'

#alias for poweroff
alias off='sudo poweroff'

#--------apt-get actions

#used to for completely removing package and dependencies
alias aptp='sudo apt-get purge --auto-remove'

#used to install packages
alias apti='sudo apt-get install'

#used for searching packages
alias apts='sudo apt-cache search'

#used for updateing
alias aptu='sudo apt-get update'

#upgrades the distrubution
alias aptupg='sudo apt-get dist-upgrade'

alias toh='vim ~/Dev/TourOfHeroes/src/app'

#launches android studio
alias android-studio='nohup /opt/android-studio/bin/studio.sh &'

#launches android emulator
alias emu='cd ~/Android/Sdk/emulator/ && nohup emulator -avd'

#lists emulator devices
alias emul='emulator -list-avds'
