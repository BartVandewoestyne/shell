#!/bin/bash

grep "Deleted.*`date +"%a, %d %b %Y"`" $HOME/.mailfilter.log \
| sed 's/mailfilter: Deleted \(.*\) <\([^>]*\)>:\(.*\)\[Applied filter.*/\1 <\2>\n\3\n/g'

grep "Deleted.*`date +"%a, %d %b %Y"`" $HOME/.mailfilter.log \
| sed 's/mailfilter: Deleted \(.*\) <\([^>]*\)>:\(.*\)\[Applied filter.*/\1 <\2>\n\3\n/g' | wc -l

#| sed -e 's/mailfilter: Deleted.*<.*>.*/\1<>/g'
#sed 's/mailfilter: Deleted \([^>]*>\).*/\1'
