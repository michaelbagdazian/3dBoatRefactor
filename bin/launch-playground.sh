#!/bin/sh
bindir=$(pwd)
cd /home/michael/Workspace/refactor/3dBoatRefactor/src/Main/playground/
export 

if test "x$1" = "x--debugger"; then
	shift
	if test "xYES" = "xYES"; then
		echo "r  " > $bindir/gdbscript
		echo "bt" >> $bindir/gdbscript
		/usr/bin/gdb -batch -command=$bindir/gdbscript --return-child-result /home/michael/Workspace/refactor/3dBoatRefactor/bin/playground 
	else
		"/home/michael/Workspace/refactor/3dBoatRefactor/bin/playground"  
	fi
else
	"/home/michael/Workspace/refactor/3dBoatRefactor/bin/playground"  
fi
