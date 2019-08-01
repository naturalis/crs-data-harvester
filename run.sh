#!/bin/bash

echo "Pulling data from oracle database"
export LD_LIBRARY_PATH=/instantclient_11_2/

# run query with client
/instantclient_11_2/sqlplus $USER/$PASS@\"//$SERVER\" @/query.sql

echo "Done pulling data from oracle database"

echo "Printing result"
cat result.csv
