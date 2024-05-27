#!/bin/bash

myarray=(zero one two three four five)

echo ${myarray[*]}

echo ${myarray[@]:0}
echo ${myarray[@]:1}
echo ${myarray[@]:2}
echo ${myarray[@]:3}
echo ${myarray[@]:4}
echo ${myarray[@]:5}

echo ${myarray[@]:2:3}  # expands to 3 elements, starting with element 2.
echo ${myarray[@]:2:10}  # expands to 3 elements, starting with element 2.


changed_array1=(${myarray[@]/#/<})
changed_array2=("${changed_array1[@]/%/>,}")
changed_array2[${#myarray[@]}-1]="<${myarray[@]:(-1)}>"
mystring=$(printf "%s\n"  "${changed_array2[@]}")
echo "${changed_array1[@]}"
echo "$mystring"
