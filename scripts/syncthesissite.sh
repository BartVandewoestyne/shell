#/bin/sh

rsync -azvr --delete -e ssh ~mc303/3cw/thesiskul/website/ ace.ulyssis.org:/home/boss/mc303/www/thesiskul/website/
