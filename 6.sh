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

printMsg 'Copied over myscript.sh'
cd $HOME/sys161/tools/bin
cp ~/Downloads/myscript.sh .
chmod 755 myscript.sh
mkdir $HOME/sys161/bin

printMsg 'Executing myscript.sh'
./myscript.sh


printMsg 'Do not worry if you see two error messages saying FILE EXISTS, thats OK!!!'