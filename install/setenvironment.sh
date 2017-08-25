
alias vstart='vstart --append=root=98.0'
alias lstart='lstart --pass=--append=root=98.0'

export NETKIT_HOME=~/netkit
export MANPATH=:$NETKIT_HOME/man
export PATH=$NETKIT_HOME/bin:$PATH

. $NETKIT_HOME/bin/netkit_bash_completion

