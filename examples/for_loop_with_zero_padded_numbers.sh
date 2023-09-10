#!/bin/bash

# Method 1
for i in $(seq -f "%05g" 0 20)
do
  echo $i
done

# Method 2
for i in {00..20};
do
  echo $i
done
