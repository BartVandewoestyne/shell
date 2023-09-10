#!/bin/bash

for i in $(seq -f "%01g" 1 4)
do
  echo "smquadnode${i}: "
  ssh bart@smquadnode${i} "$@"
done
