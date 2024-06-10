#!/bin/bash
#
# This script illustrates somse strange things that I noticed at work with dd.
# The problem was that the output did not have the expected size of 33061608
# but was chopped of at 65536.
#
# The file ntc6498_V701.00.R7.1.0.1.bin was about 95 MB large, you can replace it with
# some randomly generated file to test this script.
#
# References:
#   https://stackoverflow.com/questions/6782806/not-understanding-dd-command-arguments-at-all

image_file=./images/ntc6498_V701.00.R7.1.0.1.bin

echo "PROBLEM: dd is used in an unreliable way."
echo "(See 'dd' section in https://www.pixelbeat.org/docs/coreutils-gotchas.html)"
time (
  dd if=${image_file} ibs=12624 skip=1 count=2619 obs=33061608 2>/dev/null | dd bs=33061608 count=1 | wc -c
)

echo

echo "Solution 1: write to intermediate file"
echo "(This solution is portable.)"
time (
  temp_file=$(mktemp)
  dd if=${image_file} of=${temp_file} ibs=12624 skip=1 count=2619 obs=33061608 2>/dev/null
  dd if=${temp_file} bs=33061608 count=1 | wc -c
  rm ${temp_file}
)

echo

echo "Solution 2: replace second dd command with head -c"
echo "(This is not portable as not all head implementations support the -c option)"
time (
  dd if=${image_file} ibs=12624 skip=1 count=2619 obs=33061608 2>/dev/null | head -c 33061608 | wc -c
)

echo

echo "Solution 3: use iflag=fullblock in second dd command"
echo "(This is not portable as it only works with GNU dd)"
time (
  dd if=${image_file} ibs=12624 skip=1 count=2619 obs=33061608 2>/dev/null | dd iflag=fullblock bs=33061608 count=1 | wc -c
)
