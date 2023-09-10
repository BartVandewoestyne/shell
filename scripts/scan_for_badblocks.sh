#!/bin/sh

echo "Bad block scan report of `date` on `hostname`" >> badblocks_report.txt
echo "------------------------------------------------------------------" >> badblocks_report.txt

for disk in /proc/ide/hd*
do
  diskname=`basename $disk`
  medium=`cat /proc/ide/$diskname/media`
  if [ $medium = "disk" ]; then
    echo "Scanning /dev/$diskname..." >> badblocks_report.txt
    badblocks -sv -o badblocks.txt /dev/$diskname 10 1> /dev/null 2>&1
    cat badblocks.txt >> badblocks_report.txt
    echo "done." >> badblocks_report.txt
  else
    echo "Not scanning /dev/$diskname because the medium is a $medium" >> badblocks_report.txt
  fi
done

rm badblocks.txt

mailx -s "Bad block scan summary of `hostname` on `date`" Bart.Vandewoestyne@telenet.be < badblocks_report.txt

rm badblocks_report.txt

# Notes:
# `mycommand > /dev/null 2>&1` means "redirect standard output (1) to
# /dev/null and then redirect standard error (2) to the same redirect
# as standard output (1)
