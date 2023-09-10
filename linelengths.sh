#!/usr/bin/env bash
#
# Plot histogram of line lengths for all .cpp files recursively found inside
# a directory.
#
# Usage: run
#
#   ./linelength.sh
#
# somewhere in a directory that has .cpp files somewhere recursively down.

export LC_ALL=C

find . -type f -name "*.cpp" -print0 | xargs -0 awk '{ print length }' \
  | sort -n | uniq -c > linelengths.txt

gnuplot --persist -e "plot 'linelengths.txt' u 2:1 notitle"
