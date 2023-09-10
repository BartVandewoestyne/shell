#!/bin/sh

# Rasterizing EPS figures.

# Method 1
# In recent versions of Ghostscript, adding -dEPSCrop will crop the 
# page to the bounding box, both when converting to bitmap formats
# and when converting to PDF.  See doc/Use.htm for details.
# (eps3:.....) does not work :-(
gs -r300 -dEPSCrop -dTextAlphaBits=4 -sDEVICE=png16m -sOutputFile=test.png -dBATCH -dNOPAUSE test.eps
convert test.png eps2:test_gs.eps

# Method 2: via png and then to eps PostScript Level 2
#convert -density 300 test.eps test.png
#convert test.png eps2:test_png.eps

# Method 3
#convert -density 300 test.eps test.gif
#convert test.gif test_gif.eps

# Method 4
# Don't use this, because it leads to ``ringing'' noise around the borders of
# the text.
#convert test.eps test.jpg
#convert test.jpg test_jpg.eps

# Clean up
rm test.jpg test.gif test.png
