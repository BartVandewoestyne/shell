#!/bin/bash

a=(x y z)

echo ${a[*]}
echo ${a[@]}

echo ${a[@]:1:2}

# Pattern substitution
echo ${a[@]/x/xx}
echo ${a[@]/*/xx}
