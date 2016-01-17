#!/bin/bash
for i in mips-*; do
	ln -s $HOME/sys161/tools/bin/$i $HOME/sys161/bin/cs431-`echo $i | cut -d'-' -f4`
done
ln -s $HOME/sys161/tools/bin/bmake $HOME/sys161/bin/bmake
