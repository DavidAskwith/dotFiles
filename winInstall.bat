REM TODO: Delete the existing version before link
REM TODO: Test that the delete doesnt efect symlinks poorly
REM TODO: Add a statement to make C:/tmp for git diffing 
mklink /H %userprofile%\.vimrc vimrc
mklink /H %userprofile%\.gitconfig gitconfig
mklink /D %userprofile%\.vim vim 
mklink /D %userprofile%\.bash_aliases bash_aliases
git clone https://github.com/VundleVim/Vundle.vim.git %USERPROFILE%/.vim/bundle/Vundle.vim
