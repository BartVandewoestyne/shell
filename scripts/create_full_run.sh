#!/bin/bash

# This script allows you to create a bash script that runs the given executable
# on the given set of input files.

executable=$1

if [ "$#" -lt "2" ]; then

  echo -e "Usage: create_full_run.sh <executable> <inputfiles>"
  exit 1

else

  script_name=run_all_`basename ${executable}`.sh

  echo "#!/bin/bash" > $script_name
  echo "" >> $script_name

  shift

  for inputfile in "$@"; do
    echo "$executable < $inputfile" >> $script_name
  done

  chmod 755 $script_name

fi
