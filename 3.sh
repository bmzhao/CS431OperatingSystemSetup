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
printMsg 'Unpacking gcc'
tar -zxf os161-gcc.gz

cd gcc-4.1.2+os161-2.0
printMsg 'Configuring GCC'
./configure -nfp --disable-shared --disable-threads --disable-libmudflap --disable-libssp --target=mips-harvard-os161 --prefix=$HOME/sys161/tools

find . -name *.o
find . -name *.o -exec rm -rf {} \;

printMsg 'Making'
make

printMsg 'Installing'
make install

find . -name *.o
find . -name *.o -exec rm -rf {} \;

printMsg 'Making'
make

printMsg 'Installing'
make install
