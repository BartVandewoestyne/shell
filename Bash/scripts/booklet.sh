#!/bin/bash

if (( $# != 1 ));
then
	echo "Usage: $0 <inputp{df,s}>"
	exit
fi;

if [ ! -e $1 ];
then 
	echo ERROR:  $1 does not exist! 
	exit
fi;

EXTENSION=${1##*.}
COMMAND=""

# Error handling
if [ $EXTENSION != "pdf" ] && [ $EXTENSION != "ps" ];
then
	echo "Unknown extension $EXTENSION for input file $1. Abort..."
fi

# If we got a pdf, first convert it to a postscript.
[ $EXTENSION == "pdf" ] && COMMAND="pdftops -q $1 - | "
[ $EXTENSION == "ps"  ] && COMMAND="cat $1 | "

#targetname=`basename $1 .$EXTENSION`-booklet.pdf
#COMMAND=$COMMAND"psbook -q |psnup -q -2 |pstops -q '2:0,1U(1w,1h)' | ps2pdf14 - $targetname"

targetname=`basename $1 .$EXTENSION`-booklet.ps
#COMMAND=$COMMAND"psbook -q |psnup -q -2 |pstops -q '2:0,1U(1w,1h)' >  $targetname"
COMMAND=$COMMAND"psbook -q |psnup -q -2 |pstops -q '2:0,1U(1w,1h)' | ps2ps /dev/stdin /dev/stdout> $targetname"

eval $COMMAND

#echo "Exitcode: $?"
echo "--> $targetname created."

