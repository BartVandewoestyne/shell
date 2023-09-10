#!/bin/sh

# Voor Maxtor 33073U4
# -c1:
# -d1: enable DMA
# -m16: set the number of sectors to use for IDE block mode (multicount)
# -A1: enable auto-readahead feature of the drive
# -X66: enable UDMA 2 mode
hdparm -c1 -d1 -m16 -A1 -X66 /dev/hda

hdparm -d0 /dev/hda
