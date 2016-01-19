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

printMsg 'Making directory for toolchain binaries'
mkdir $HOME/sys161/bin

printMsg 'moving to homedirectory'
cd
pwd

printMsg 'editing path within bashrc and profile'
echo 'export PATH="$PATH:$HOME/sys161/bin:$HOME/sys161/tools/bin"' >> .bashrc
echo 'export PATH="$PATH:$HOME/sys161/bin:$HOME/sys161/tools/bin"' >> .profile

export PATH="$PATH:$HOME/sys161/bin:$HOME/sys161/tools/bin"

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


cd ~/Downloads
printMsg 'Unpacking gdb'
tar -zxf os161-gdb.gz
cd gdb-6.6+os161-2.0


printMsg 'Now configuring gdb'
./configure --target=mips-harvard-os161 --prefix=$HOME/sys161/tools --disable-werror

printMsg 'Making'
make

printMsg 'Installing'
make install

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

printMsg 'Copied over myscript.sh'
cd $HOME/sys161/tools/bin
cp ~/Downloads/myscript.sh .
chmod 755 myscript.sh
mkdir $HOME/sys161/bin

printMsg 'Executing myscript.sh'
./myscript.sh


printMsg 'Do not worry if you see two error messages saying FILE EXISTS, thats OK!!!'


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

echo 'YOU MUST QUIT THE TERMINAL AND REOPEN THE TERMINAL FOR THE PATH TO BE MODIFIED'
echo 'LITERALLY QUIT ALL TERMINALS BY CLICKING THE X BUTTON IN THE TOP RIGHT CORNER'
echo 'Then reopen the terminal program and run the next setup script'

printMsg 'CONGRATULATIONS YOU FINISHED THE INSTALLATION PROCESS!!'
echo 'Close the terminal, then reopen it, then...'
echo 'To check if everything worked, execute the following two commands: '
echo 'cd $HOME/cs431-os161/root'
echo 'sys161 kernel-ASST0'
echo 'You should see a terminal pop up, if so, whoo-hoo it worked!'
echo 'If not, better luck next time!'
