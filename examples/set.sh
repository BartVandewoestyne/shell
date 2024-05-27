#!/bin/bash

# Comment this out to see that Bash will exit if you try to use an undefined
# variable.
set -u

echo "This is a test script."
var=10
echo "The value of var is $var"
echo "The value of undefined_var is $undefined_var"
