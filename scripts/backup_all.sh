#!/bin/bash
#
# This script should be run as root!
#
# Make a backup of /home/ and some important files from /etc/
#
# Notes:
#	* you might also want to take a look at the 'dump' command...
#
# Other interesting URL's:
#
#	http://houghi.org/pivot/entry.php?id=43
#	http://www.mikerubel.org/computers/rsync_snapshots/
#
# Last edited by Bart Vandewoestyne on 26/03/2005


# Specify this variable without a trailing slash in order to copy
# /the_directory/ and it's content.  If you add the trailing slash, only
# the content will be copied, not the directory itself!
WHAT_TO_BACKUP="/home"

WHERE_TO_BACKUP_IMPORTANT_FILES="~mc303/backup/"
WHERE_TO_BACKUP="/mnt/backup/"

FILELIST="/etc/init.d/my_firewall*"

# First make a copy of some important files into my homedir...
find ${FILELIST} | cpio -pumdv ${WHERE_TO_BACKUP_IMPORTANT_FILES};

# Now backup my homedirectory...

# Method 1:
#
#/bin/tar -zcpf /home/home.tar.gz /home/
#cat /home/home.tar.gz |ssh remotemachine "cd backup; cat > backup.tar.gz"
#
# or shorter:
#
#/bin/tar -zcpf mc303@erdos:home.tar.gz /home/

# Method 2:
#
#(cd /home && tar cf - . ) | \
#ssh mc303@erdos (cd /home/mc303/backup && tar xvfp - )
#
# or shorter:
#
#tar -f user@host:/foo doen...

# Method 3:
#
rsync -avzr --delete ${WHAT_TO_BACKUP} ${WHERE_TO_BACKUP}
#
#	-a: archive mode
#	-v: be verbose
#	-z: compress file data
#	-r: recurse into directories
#	--delete: delete any file from destination/ that is not in
#	          source/

# Method 4:
# --> via dump (ssh compressie)
