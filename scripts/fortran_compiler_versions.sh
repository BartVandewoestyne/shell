#! /bin/bash
#
# Show the versions of the Fortran compilers I'm using.

F -version | head -1
echo ""
g95 --version | head -1
echo ""
f95 -version | head -1
echo ""
gfortran --version | head -1
echo ""
ifc -V | head -1
