#!/bin/bash
#
# Script to download "Open en Bloot"
# (See http://www.kanaaltwee.be/openenbloot/)
#
# This script has not been tested very well... if you notice mistakes in
# the URL's, or you notice that an URL has been forgotten for download,
# please let us know!  If you don't know who 'us' is, ask the guy who
# sent you this script ;-)

prefix="http://wm.streampower.be/vtm/kanaaltwee/openenbloot/"

mkdir afl1

echo "Getting season 1..."

# Depending on the week of the broadcast, a certain item in the show
# changes it's name and can therefore have a different filename...
specials=('_full_Medium.wmv' \
	  '_dierenwereld_Medium.wmv' \
	  '_seksuoloog_Medium.wmv' \
	  '_leger_Medium.wmv' \
	  '_seksuoloog_Medium.wmv' \
	  '_seksuoloog_Medium.wmv' \
	  '_seksuoloog_Medium.wmv' \
	  '_seksuoloog_Medium.wmv')

echo "Downloading items that are the same for each broadcast..."

for i in 1 2 3 4 5 6 7 8
  do
    nb=0
    # I think this order is the chronological order of the program...
    for suffix in "_trailer.wmv" \
    	          "_inleiding_Medium.wmv" \
    	          "_seks_zoals_het_is_Medium.wmv" \
		  "_je_veux_lamour_01_Medium.wmv" \
		  "_je_veux_lamour_02_Medium.wmv" \
		  "_10_tips_Medium.wmv" \
		  "_tweemaal_bloot_Medium.wmv" \
		  "_mundo_erotica_Medium.wmv" \
		  ${specials[$(($i-1))]} \
		  "_seksnieuws_Medium.wmv" \
		  "_mythe_01_Medium.wmv" \
		  "_mythe_02_Medium.wmv" \
		  "_mythe_03_Medium.wmv" \
		  "_mythe_04_Medium.wmv" \
		  "_wedstrijd_Medium.wmv"
      do
      	# Name the files in the chronological order of the program
      	nb=$((nb+1))
	if [ $nb -lt 10 ]; then
	  filename="afl1/afl${i}_0${nb}${suffix}"
	else
	  filename="afl1/afl${i}_${nb}${suffix}"
	fi
        mylink="${prefix}afl1/afl${i}${suffix}"

        mplayer -dumpstream ${mylink} -dumpfile ${filename}
	# For debugging...
        #echo "mplayer -dumpstream ${mylink} -dumpfile ${filename}"

      done
  done


echo "Getting season 2..."

for i in 9 10 11 12 13 14 15 16 17 18 19
  do

    nb=0

    # afl9 doesn't have this extra 16-9- in the filenames...
    if [i == 9]; then
      addme=""
    else
      addme="16-9-"
    fi

    # Aren't there any more trailers for season 2???
    # Aflevering 9, 10 and 11 seem to have a trailer...
    for suffix in "_inleiding_${addme}wmv.wmv" \
    	          "_seks_zoals_het_is_${addme}wmv.wmv" \
		  "_letstalkaboutsex1_${addme}wmv.wmv" \
		  "_letstalkaboutsex2_${addme}wmv.wmv" \
		  "_sociobioloog_${addme}wmv.wmv" \
		  "_mundoerotica_${addme}wmv.wmv" \
		  "_tweemaalbloot_${addme}wmv.wmv" \
		  "_seksnieuws_${addme}wmv.wmv" \
		  "_wedstrijd_${addme}wmv.wmv" \
		  "_seksadviesjackenannelies_${addme}wmv.wmv"
      do
      	# Name the files in the chronological order of the program
      	nb=$((nb+1))
	if [ $nb -lt 10 ]; then
	  filename="afl1/afl${i}_0${nb}${suffix}"
	else
	  filename="afl1/afl${i}_${nb}${suffix}"
	fi
        mylink="${prefix}afl1/afl${i}${suffix}"

        mplayer -dumpstream ${mylink} -dumpfile ${filename}
	# For debugging...
        #echo "mplayer -dumpstream ${mylink} -dumpfile ${filename}"

      done
  done
