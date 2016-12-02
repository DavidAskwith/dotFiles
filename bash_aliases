#-----------------------------------------#
#--this file holds all my custom aliases--#
#-----------------------------------------#

#opening files in gui
alias op='xdg-open'

#alias for logout
alias logout='xfce4-session-logout --logout'

#--------below for apt-get actions--------#

#used to for completely removing package and dependencies
alias aptp='sudo apt-get purge --auto-remove'

#used to install packages
alias apti='sudo apt-get install'

#used for searching packages
alias apts='sudo apt-cache search'

#used for updating
alias aptupd='sudo apt-get update'

#used to upgrading
alias aptupg='sudo apt-get dist-upgrade'
