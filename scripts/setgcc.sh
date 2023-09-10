# Setup gcc (Michiel, 20/01/2012)
setgcc() {

  GCC_VERSION=$1
  GCC_DIR=/hped/builds/tools/gcc/$GCC_VERSION

  # Remove any /hped/builds/tools/gcc/* directories from the PATH
  # and LD_LIBRARY_PATH.
  export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 !~ /\/hped\/builds\/tools\/gcc.*/' | sed 's/:$//'`
  export LD_LIBRARY_PATH=`echo -n $LD_LIBRARY_PATH | awk -v RS=: -v ORS=: '$0 !~ /\/hped\/builds\/tools\/gcc.*/' | sed 's/:$//'`
  export MANPATH=`echo -n $MANPATH | awk -v RS=: -v ORS=: '$0 !~ /\/hped\/builds\/tools\/gcc.*/' | sed 's/:$//'`

  if [ -d $GCC_DIR/bin ]; then

    export PATH=$GCC_DIR/bin:$PATH
    export LD_LIBRARY_PATH=$GCC_DIR/lib64:$GCC_DIR/lib:$LD_LIBRARY_PATH
    export MANPATH=$GCC_DIR/share/man:$MANPATH

  else
    echo "GCC version not specified or unavailable, using the"
    echo "gcc that came from the package managent system:"
    echo `gcc --version | head -1`
  fi

}
