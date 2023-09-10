#!/bin/bash

node=1
location="Actiflow"

if [[ ($node = 1) && ($location = "Lab") ]];
then
  echo "yes"
else
  echo "no"
fi
