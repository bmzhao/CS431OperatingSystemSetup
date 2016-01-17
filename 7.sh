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
printMsg 'Untarring sys161'
tar -xzf sys161.gz

printMsg 'Moving into directory...'
cd sys161-1.99.06
pwd

printMsg 'Configuring sys161...'
./configure --prefix=$HOME/sys161 mipseb

printMsg 'Making'
make

printMsg 'Make Installing'
make install

printMsg 'Creating symlink...'
cd $HOME/sys161
ln -s share/examples/sys161/sys161.conf.sample sys161.conf

printMsg 'Intalling OS/161 under proper directory...'
cd
mkdir cs431-os161
cd Downloads
mv os161.gz $HOME/cs431-os161
cd ~/cs431-os161
tar -xzf os161.gz
echo 'Directory Installed To: '
DIRECTORY=`pwd`
pwd
echo 'contents of that directory: '
ls -la $DIRECTORY