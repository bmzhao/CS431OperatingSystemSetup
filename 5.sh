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
printMsg 'Unpacking bmake'
tar -zxf os161-bmake.gz

printMsg 'Entering bmake directory'
cd bmake
pwd

printMsg 'unpacking mk within bmake directory'
tar -zxf ../os161-mk.gz

printMsg 'Running bmake bootstrap script'
./boot-strap --prefix=$HOME/sys161/tools | tee bootstrapOutput.txt

printMsg 'Obtaining list of commands to run after bootstrap script'
tail -7 bootstrapOutput.txt | tee bootstrapCommandsScript.sh
chmod 755 bootstrapCommandsScript.sh

printMsg 'executing commands after bootstrap script'
./bootstrapCommandsScript.sh