#!/bin/bash

mkdir -p $HOME/NT2
cd $HOME/NT2

#Fetch installer files
if [ -e netkit-2.8.tar.bz2 ]
then
	echo "File already downloaded!"
else
	wget http://wiki.netkit.org/download/netkit/netkit-2.8.tar.bz2
	tar -xjSf netkit-2.8.tar.bz2
fi

if [ -e netkit-filesystem-i386-F5.2.tar.bz2 ]
then
	echo "File already downloaded!"
else	
	wget http://wiki.netkit.org/download/netkit-filesystem/netkit-filesystem-i386-F5.2.tar.bz2
	tar -xjSf netkit-kernel-i386-K2.8.tar.bz2
fi

if [ -e netkit-kernel-i386-K2.8.tar.bz2 ]
then
	echo "File already downloaded!"
else
	wget http://wiki.netkit.org/download/netkit-kernel/netkit-kernel-i386-K2.8.tar.bz2
	tar -xjSf netkit-filesystem-i386-F5.2.tar.bz2
fi

# experimental netkit images
#wget http://wiki.netkit.org/download/netkit-filesystem/netkit-fs-sid-x86_64-experimental.bz2
#wget http://wiki.netkit.org/download/netkit-kernel/netkit-kernel-4.0.0-x86_64-experimental.tar.bz2


#unpack installer files
#tar -xjSf netkit-fs-sid-x86_64-experimental.bz2
#tar -xjSf netkit-kernel-4.0.0-x86_64-experimental.tar.bz2

# Add environment vriables to .bashrc file
cat << EOF >> ~/.bashrc

#NETKIT

alias vstart='vstart --append=root=98.0'
alias lstart='lstart --pass=--append=root=98.0'

export NETKIT_HOME=$HOME/NT2/netkit
export MANPATH=$MANPATH:$NETKIT_HOME/man
export PATH=$NETKIT_HOME/bin:$PATH

source $NETKIT_HOME/bin/netkit_bash_completion

#TIKTEN

EOF

# during the installation we also need to check the configation

alias vstart='vstart --append=root=98.0'
alias lstart='lstart --pass=--append=root=98.0'

export NETKIT_HOME=$HOME/NT2/netkit
export MANPATH=$MANPATH:$NETKIT_HOME/man
export PATH=$NETKIT_HOME/bin:$PATH

if [ `uname -i` == 'x86_64' ]
then
	apt install ia32-libs
	apt install libc6-i386
fi

if [ `which xterm`.x == .x ]
then
	apt install xterm
fi

if [ `which wireshark`.x == .x ]
then
	apt install wireshark
fi


