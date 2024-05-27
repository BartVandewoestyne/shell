#!/bin/bash
#
# Script to check whether Hadoop is optimally configured.
#
# THIS IS UNFINISHED!!!

NODES="sandy-quad-1 sandy-quad-2 sandy-quad-3 sandy-quad-4"

echo "FILESYSTEM CHECK (must be ext 3 or, even better, ext4)"
for node in $NODES
do
  echo -n "$node: "
  ssh -q root@"$node" mount | grep "^\/dev"
done
echo ""

echo "SWAPPINESS (must be 0 for kernels < 3.5 and 1 for kernels >= 3.5:"
for node in $NODES
do
  echo -n "$node: "
  #ssh -q root@$node cat /proc/sys/vm/swappiness
  ssh -q root@"$node" sysctl vm.swappiness
done
echo ""

echo "NOATIME (filesystem must be mounted with noatime)"
for node in $NODES
do
  echo -n "$node: "
  ssh -q root@"$node" grep "noatime" /etc/fstab
done
echo ""
