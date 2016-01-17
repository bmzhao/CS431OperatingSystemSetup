#!/bin/bash
#this script assume you have already downloaded all the files from Nima's blackboard
#and that they are all located in ~/Downloads
printMsg(){
        sleep 3
        echo '---------------------------------'
        echo $1
        echo
        echo
}

cd ~/Downloads
printMsg 'Attempting to unpack binutils'
tar -zxf 'os161-binutils.gz'

printMsg 'Finished untarring binutils'
cd *2.0.1

printMsg "Now in directory: `pwd`"

printMsg 'Configuring binutils'
./configure --nfp --disable-werror --target=mips-harvard-os161 --prefix=$HOME/sys161/tools

pringtMsg 'Making binutils'
make

printMsg 'Running make install....'
make install

