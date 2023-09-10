#!/bin/bash

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")

dirlist="$1/Auchan
$1/AZG P1
$1/Match
$1/Pottelberg"

for dir in "$dirlist"
do
  echo "$dir"
done

IFS=$SAVEIFS
