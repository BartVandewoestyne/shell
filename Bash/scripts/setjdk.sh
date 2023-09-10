#!/bin/sh

# Script for selecting different JDK versions.

function setjdk() {

local JDK1_3=/usr/local/jdk1.3.1_01/bin
local J2SDK1_4=/usr/local/j2sdk1.4.0/bin

local OLD="$JDK1_3"
local NEW="$J2SDK1_4"

if [ "x$1" = "x1.3" ]; then
  local AUX="$OLD"
  OLD="$NEW"
  NEW="$AUX"
fi  

if echo $PATH | grep -q jdk || echo $PATH | grep -q j2sdk ;
then
  echo "PATH already contains jdk version!"
  echo -n "Substituting correct jdk path..."

  # substitute correct jdk version into path
  PATH=`echo $PATH | sed "s,$OLD,$NEW," `

  echo "done."
else
  echo "Found no java version."
  echo -n "Updating PATH environment variable... "

  # expand path
  PATH="${NEW}:${PATH}"

  echo "done."

fi

echo "PATH is now $PATH"

}

# Note from Wouter Verhelst:
#
# Dat kan je ook op een andere manier:
#
# JAVAHOME=/usr/local/java
#
# waarbij /usr/local/java een symlink is naar de uiteindelijke
# JDK-installatie. Je setjdk laat je dan die symlink verzetten...
