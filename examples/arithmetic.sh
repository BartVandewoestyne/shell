#!/bin/bash

# These two ways of arithmetic in bash are the same
echo $((1+1))
echo $[1+1]

# Watch out with integer division
echo $[3/4]
echo 3/4 | bc

# Watch out with floating point numbers
echo 1.5/2 | bc
