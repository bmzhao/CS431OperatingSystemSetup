#!/bin/bash
#this script assume you have already downloaded all the files from Nima's blackboard
#and that they are all located in ~/Downloads
printMsg(){
        echo '---------------------------------'
        echo $1
        echo
        echo
        sleep 2
}

printMsg 'Making directory for toolchain binaries'
mkdir $HOME/sys161/bin

printMsg 'moving to homedirectory'
cd
pwd

printMsg 'editing path within bashrc and profile'
echo 'export PATH="$PATH:$HOME/sys161/bin:$HOME/sys161/tools/bin"' >> .bashrc
echo 'export PATH="$PATH:$HOME/sys161/bin:$HOME/sys161/tools/bin"' >> .profile
source .bashrc
source .profile

echo 'YOU MUST QUIT THE TERMINAL AND REOPEN THE TERMINAL FOR THE PATH TO BE MODIFIED'
echo 'LITERALLY QUIT ALL TERMINALS BY CLICKING THE X BUTTON IN THE TOP RIGHT CORNER'
echo 'Then reopen the terminal program and run the next setup script'
