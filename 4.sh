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

cd ~/Downloads
printMsg 'Unpacking gdb'
tar -zxf os161-gdb.gz
cd gdb-6.6+os161-2.0

printMsg 'GOING TO INSTALL A NECESSARY LIBRARY VIA APT-GET'
echo "YOUR GONNA TO NEED TO ENTER YOUR PASSWORD SINCE APT-GET REQUIRES SUDO PRIVELEGES!"
sudo apt-get install libncurses5-dev

printMsg 'Finished installing library. Now configuring gdb'
./configure --target=mips-harvard-os161 --prefix=$HOME/sys161/tools --disable-werror

printMsg 'Making'
make

printMsg 'Installing'
make install
