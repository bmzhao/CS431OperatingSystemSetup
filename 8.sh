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
printMsg 'editing configure file'
cd $HOME/cs431-os161/os161-1.99
cp ~/Downloads/configure .
chmod 775 configure


printMsg 'ASST0...'
./configure --ostree=$HOME/cs431-os161/root --toolprefix=cs431-
cd kern/conf
./config ASST0
cd ../compile/ASST0
bmake depend
bmake
bmake install


printMsg 'Building OS/161 User programs'
cd $HOME/cs431-os161/os161-1.99
bmake
bmake install


printMsg 'Copying configuration file'
cd $HOME/cs431-os161/root
cp $HOME/sys161/sys161.conf sys161.conf

printMsg 'CONGRATULATIONS YOU FINISHED THE INSTALLATION PROCESS!!'
echo 'To check if everything worked, execute the following two commands: '
echo 'cd $HOME/cs431-os161/root'
echo 'sys161 kernel-ASST0'
echo 'You should see a terminal pop up, if so, whoo-hoo it worked!'
echo 'If not, better luck next time!'
