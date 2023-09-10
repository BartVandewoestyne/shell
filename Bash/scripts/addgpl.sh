#!/bin/sh
#
# Add GPL to file.
#
# Example of use:
#
#   find . -name "*.rb" -exec ./addgpl {} header.txt \;

cat $2 $1 > $1.tmp
mv $1.tmp $1
