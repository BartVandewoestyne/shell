#!/bin/bash

unamestr=`uname -o`

# Note: as of bash 3.2 of Bash, expression to match no longer quoted.
# This behavior was changed between 3.1 and 3.2.
if [[ $unamestr =~ .*Linux.* ]]; then
  echo "Linux-based os found!"
else
  echo "No Linux-based os found!"
fi
