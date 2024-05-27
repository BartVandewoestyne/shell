# Setup Matlab R2011b (Bart, 08/02/2012)
if [ ! -n "$MLM_LICENSE_FILE" ]; then
  export PATH=/hped/apps/matlab/R2011b/bin:$PATH
  export MLM_LICENSE_FILE=1705@sunny.scs.agilent.com:1705@rockie.cos.agilent.com
fi
