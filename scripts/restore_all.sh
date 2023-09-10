#!/bin/sh
#
# Restore everything under /home/backup/.

WHAT_TO_RESTORE="/home/mc303/backup/home/" # with trailing slash!!!

WHERE_TO_RESTORE="root@192.168.0.1:/home/"

# Restore homedir
rsync -avzr -e "ssh -p 2222" ${WHAT_TO_RESTORE} ${WHERE_TO_RESTORE}
