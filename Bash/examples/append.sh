#!/bin/bash

#for name in `cat test.txt`; do 
while read name fps; do

  ALL_VIDEOS="$ALL_VIDEOS $name"
  echo $ALL_VIDEOS

done < test.txt

echo $ALL_VIDEOS
