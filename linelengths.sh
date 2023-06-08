#/bin/bash
#
# This script plots line lengths of .cpp files inside a directory.
#
# Usage: run
#
#   linelength.sh
#
# somewhere in a directory.

export LC_ALL=C

# Generate data file
find . -type f -name *.cpp | xargs awk '{ print length }' \
  | sort -n | uniq -c > linelengths.txt

gnuplot --persist -e "plot 'linelengths.txt' u 2:1 notitle"
