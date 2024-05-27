#!/bin/sh

INPUT=../data/soboltab.txt
OUTPUT_POLYS=joe_kuo_polys.txt
OUTPUT_DIRNUMS=joe_kuo_dirnums.txt

# Extract polynomials
echo -n "data = [" >"$OUTPUT_POLYS"
echo -n $(tail +3 "$INPUT" | awk '{ print $4 }') >>"$OUTPUT_POLYS"
echo -n "]';" >>"$OUTPUT_POLYS"

# Extract direction numbers
tail +3 "$INPUT" | sed -e "s/^ *\([0-9][0-9]*\) *\([0-9][0-9]*\) *[0-9][0-9]* *[0-9][0-9]* *\(.*\)$/   data(1:\2,\1) = \[\3\]';\4/" >"${OUTPUT_DIRNUMS}"
