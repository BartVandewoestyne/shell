echo "Dexia Pension Fund Dynamic value:"

#lynx -source "https://www.dexia.be/wwwdexiabe/webapplications2/apps/products/fundfiche/default.aspx?isinc=BE0159537696&cotype=8&idfund=251" \
#  | grep -o '<strong><span id="lblHdrCapVNI">.*EUR</span></strong><br /><i style="font-size:80%">(<span id="lblCapitalizationDate">4/05/2012</span>)' \
#  | sed -e 's/<[^>]*>/ /g'

#    4xpath - command-line wrapper around Python's 4Suite package
#
#    XMLStarlet
#    http://www.ibm.com/developerworks/library/x-starlet/index.html
#
#    xpath - command-line wrapper around Perl's XPath library
#            nstalled with the Perl XML-XPath package
#
# I also use xmllint and xsltproc with little XSL transform scripts to do XML processing from the command line or in shell scripts. 
#
# XML2 from http://www.ofb.net/~egnor/xml2/
#
# http://stackoverflow.com/questions/4984689/xhtml-parsing-using-xpath
# http://stackoverflow.com/questions/297239/why-doesnt-xpath-work-when-processing-an-xhtml-document-with-lxml-in-python

lynx -source "https://www.dexia.be/wwwdexiabe/webapplications2/apps/products/fundfiche/default.aspx?isinc=BE0159537696&cotype=8&idfund=251" | xpath -e '//span[@id="lblHdrCapVNI"]'
