# Set up stuff for running (and building?) ADS.
export AGILEESOFD_LICENSE_FILE=27001@ablw.belgium.agilent.com
export LOCALDOMAIN="belgium.agilent.com soco.agilent.com wlv.agilent.com agilent.com"
setup_ads()
{
  export HPEESOF_DIR=$1
  export PATH=$HPEESOF_DIR/bin:$PATH
}
