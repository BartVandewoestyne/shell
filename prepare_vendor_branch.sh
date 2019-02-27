#!/bin/bash
#
# Script to prepare a vendor branch upgrade.
#
# TODO: this script is unfinished.
#
# Prerequisites:
#   1. You have an extracted tarball/zip of the original source in dir_orig
#   2. You have a working copy that is an extracted tarball with the
#      svn source of the previous version checked out on top of it,
#      in $dir_working
#
# Example:
#
#   ./prepare_vendor_branch.sh cmake-3.13.4-orig cmake-3.13.4


dir_orig=$1
dir_working=$2

echo "Directory with the original source: $dir_orig"
echo "Directory with the working copy: $dir_working"

# Svn add any vendor drop items to version control.
svn add --force $dir_working --no-ignore --no-auto-props 

# Find out what files are in the working copy, but not in
# the original directory, and should thus be removed.
diff -r $dir_orig $dir_working | grep "Only in $dir_working" | sed -r -e 's/^.*Only in //' -e 's@: @/@' > ~/files_to_svn_delete.txt

# TODO: remove line with $dir_working/.svn from ~/files_to_svn_delete.txt

# Svn delete all files that are in the working copy, but not
# in the directory with the original source.
# TODO:
#   - for files that have an @ in them, we must append an ampersand to the end of the filename to do the svn delete,
#     for example:
#       foo@2.txt becomes foo@2.txt@
#     See also http://svnbook.red-bean.com/en/1.7/svn.advanced.pegrevs.html
#     Maybe we can even append an @ to every file???
#   - files in the root dir are not in files_to_svn_delete.txt???
#   - avoid deleting root .svn directory, which is also in ~/files_to_svn_delete.txt
for file in `cat ~/files_to_svn_delete.txt`
do
    svn delete "$file"
done

# Are other modifications necessary?  Maybe case-sensitive related changes?
# The files that changed their capitalization, probably show up as missing.  I
# I think you can svn delete these, but then also check if their counterparts
# were svn added (or should we svn rename them?)
