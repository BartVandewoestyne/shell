#!/bin/bash
#
# For documentation on the options and devices of Ghostscript, see
#       http://pages.cs.wisc.edu/~ghost/doc/cvs/Use.htm
#       http://pages.cs.wisc.edu/~ghost/doc/cvs/Devices.htm
#
# Note:
#  The -dEPSCrop option does not work with ESP Ghostscript 7.07.1 (2003-07-12)
#  It does work with GPL Ghostscript SVN PRE-RELEASE 8.61 (2007-08-02)

echo "WARNING: this script must be used on archimedes!"

dpi=$1
sizex=$2
inputfile=$3

outputfile=${inputfile%.eps}.png

echo -n "Rasterizing EPS figure with Ghostscript... "
gs -q \
   -r"${dpi}" \
   -dEPSCrop \
   -dTextAlphaBits=4 \
   -sDEVICE=png16m \
   -sOutputFile="${outputfile}" \
   -dBATCH \
   -dNOPAUSE \
   "${inputfile}"
echo "done."

echo -n "Resizing PNG image with convert..."
convert "${outputfile}" -resize "${sizex}" -quality 100 -depth 8 "${outputfile}"
echo "done."
