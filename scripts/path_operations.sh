#!/usr/bin/env bash

# See http://stackoverflow.com/questions/370047/what-is-the-most-elegant-way-to-remove-a-path-from-the-path-variable-in-bash

path_append () {
  path_remove "$1";
  export PATH="$PATH:$1";
}

path_prepend () {
  path_remove "$1";
  export PATH="$1:$PATH";
}

path_remove () {
  export PATH=$(echo -n "$PATH" | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//');
}

# Check whether directory exists and only add it if it is not in your path yet.
path_add() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="$1:$PATH"
    fi
}

showpath() {

  # Without indent.
  #echo $PATH | tr ':' '\n'
  #echo $LD_LIBRARY_PATH | tr ':' '\n'

  # With indent.
  echo "PATH:"
  echo "$PATH" | awk -F: '{for(i=1;i<=NF;i++){printf("  %s\n",$i)}}'
  echo "LD_LIBRARY_PATH:"
  echo "$LD_LIBRARY_PATH" | awk -F: '{for(i=1;i<=NF;i++){printf("  %s\n",$i)}}'
  echo "MANPATH:"
  echo "$MANPATH" | awk -F: '{for(i=1;i<=NF;i++){printf("  %s\n",$i)}}'

}
