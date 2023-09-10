#!/bin/bash
#
# Back up all of my MySQL databases.
#
# To restore:
#   -> drop all tables from the database
#   -> make sure the database <dbname> exists and is empty.  If necessary,
#      drop all tables from <dbname> (make sure you don't need them anymore
#      and you want to overwrite them with your backed-up data).
#   -> mysql -u mc303 --password=<password> <dbname> < <dbname>.mysqldb
#      (or do it from within phpMyAdmin)
#
# TODO:
#   * Currently, this script must be run from the localhost where the mysql
#     server is running.  Allow a user to specify the mysql server.
#   * If an error occurs with the mysqldump command, the old backups are
#     overwritten with zero-sized files.  This should not happen.

# The username and password used for performing the backup.
USER_NAME=mc303
PASSWORD=mysql234
SERVER=simba

# Specify the list of databases here
DATABASES="addresses athletics azw boardgames books company_addresses paragliding"

for db in ${DATABASES}; do
  echo -n "Backing up database ${db}..."
  mysqldump -h ${SERVER} -u ${USER_NAME} --password=${PASSWORD} ${db} \
        > ${HOME}/Dropbox/databases/${db}.mysqldb;
  echo " done."
done
