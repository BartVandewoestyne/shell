#!/bin/sh
#
# TODO: I don't remember what this script was for.  Probably it was a
# test version for a script that I created to create a KML file with the
# locations of paragliding pilots.

echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" > pilots.kml
echo "<kml xmlns=\"http://www.opengis.net/kml/2.2\"> >> pilots.kml

#mysql --default-character-set=utf8 --silent -r --user=mc303 --password=mysql234 --host simba addresses < single_persons_without_box.sql > addresses.dat
