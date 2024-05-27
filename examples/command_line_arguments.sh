#!/bin/bash
#
# References:
#
#   [1] http://linuxshellaccount.blogspot.de/2008/04/shell-special-variables-in-bash.html

echo Name of script is $0
echo First argument is $1
echo Second argument is $2
echo Seventeenth argument is ${17}
echo Number of arguments is $#

# The * variable expands to all the parameters on a command line.  Since we're
# talking about built in variables today, I don't mean *, like in "ls *",
# but * as in "echo $*", which produces nothing.  However if there are other
# parameters on the command line, expanding this variable equals all of the
# command line parameters, like $1, $2, $3, etc.  If $* is surrounded by quotes
# ("$*"), it equals all of the parameters as one value, separated by the
# default field separator (IFS - usually a space, tab or newline),
# like "$1 $2 $3"
echo All command line parameters: $*
echo All command line parameters as one value: "$*"

# The @ variable expands the same as the * variable when called without quotes
# as $@.  When called between double quotes, as "$@", it expands into all the
# command line parameters, but each parameter is separate (rather than all
# together in one giant double quoted string, separated by spaces, as
# with "$*"), like "$1", "$2", "$3", etc.
echo All command line variables are: $@
