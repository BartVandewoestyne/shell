# Note that we no longer need to run these scripts when running MomEngine from
# Eclipse.

export PHYSBLD_BASE=$HOME/ablr_nobackup/physbld

setup_mom_32opt()
{
  clear_momentum_dirs
  export PATH=$PHYSBLD_BASE/_build_progress_10.20/linux_x86-opt/linux_x86/bin:$PATH
  export PATH=$PHYSBLD_BASE/_build_stable_10.20/linux_x86-opt/linux_x86/bin:$PATH
  export LD_LIBRARY_PATH=$PHYSBLD_BASE/_build_progress_10.20/linux_x86-opt/linux_x86/lib:$LD_LIBRARY_PATH
  export LD_LIBRARY_PATH=$PHYSBLD_BASE/_build_stable_10.20/linux_x86-opt/linux_x86/lib:$LD_LIBRARY_PATH
  export HPEESOF_DIR=/hped/builds/gent/devXXX/rcmom_int/release/prod
}

setup_mom_32debug()
{
  clear_momentum_dirs
  export PATH=$PHYSBLD_BASE/_build_progress_10.20/linux_x86-debug/linux_x86/bin:$PATH
  export PATH=$PHYSBLD_BASE/_build_stable_10.20/linux_x86-debug/linux_x86/bin:$PATH
  export LD_LIBRARY_PATH=$PHYSBLD_BASE/_build_progress_10.20/linux_x86-debug/linux_x86/lib:$LD_LIBRARY_PATH
  export LD_LIBRARY_PATH=$PHYSBLD_BASE/_build_stable_10.20/linux_x86-debug/linux_x86/lib:$LD_LIBRARY_PATH
  export HPEESOF_DIR=/hped/builds/gent/devXXX/rcmom_int/debug/prod
}

setup_mom_64opt()
{
  clear_momentum_dirs
  export PATH=$PHYSBLD_BASE/_build_progress_10.20/linux_x86_64-opt/linux_x86_64/bin:$PATH
  export PATH=$PHYSBLD_BASE/_build_stable_10.20/linux_x86_64-opt/linux_x86_64/bin:$PATH
  export LD_LIBRARY_PATH=$PHYSBLD_BASE/_build_progress_10.20/linux_x86_64-opt/linux_x86_64/lib:$LD_LIBRARY_PATH
  export LD_LIBRARY_PATH=$PHYSBLD_BASE/_build_stable_10.20/linux_x86_64-opt/linux_x86_64/lib:$LD_LIBRARY_PATH
  export HPEESOF_DIR=/hped/builds/gent/devXXX/rcmom_int/release/prod
}

setup_mom_64debug()
{
  clear_momentum_dirs
  export PATH=$PHYSBLD_BASE/_build_progress_10.20/linux_x86_64-debug/linux_x86_64/bin:$PATH
  export PATH=$PHYSBLD_BASE/_build_stable_10.20/linux_x86_64-debug/linux_x86_64/bin:$PATH
  export LD_LIBRARY_PATH=$PHYSBLD_BASE/_build_progress_10.20/linux_x86_64-debug/linux_x86_64/lib:$LD_LIBRARY_PATH
  export LD_LIBRARY_PATH=$PHYSBLD_BASE/_build_stable_10.20/linux_x86_64-debug/linux_x86_64/lib:$LD_LIBRARY_PATH
  export HPEESOF_DIR=/hped/builds/gent/devXXX/rcmom_int/debug/prod
}

clear_momentum_dirs()
{
  # Remove any .*_build_.* directories from the PATH and LD_LIBRARY_PATH
  export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 !~ /.*_build_.*/' | sed 's/:$//'`
  export LD_LIBRARY_PATH=`echo -n $LD_LIBRARY_PATH | awk -v RS=: -v ORS=: '$0 !~ /.*_build_.*/' | sed 's/:$//'`
}

update_momentum()
{
  (
   cd ~/ablr_nobackup/physbld;
   ./mk.sh --only-srcupdate build
  )
}

build_momentum_debug()
{
  (
   cd ~/ablr_nobackup/physbld;
   ./mk.sh -t debug -a 64 -s --skip-versiontouch build install $*
  )
}

build_momentum_optimized()
{
  (
   cd ~/d1/physbld;
   ./mk.sh -t opt -a 64 -s --skip-versiontouch build install $*
  )
}

run_momentum_debug()
{
  LD_LIBRARY_PATH=~/ablr_nobackup/physbld/_install_debug/prod/Momentum/10.20/linux_x86_64/lib:$LD_LIBRARY_PATH
  ~/ablr_nobackup/physbld/_install_debug/prod/Momentum/10.20/linux_x86_64/bin/MomEngine "$@"
}
