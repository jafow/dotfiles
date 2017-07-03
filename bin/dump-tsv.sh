#! /usr/bin/env sqlite3

db=$1
table=$2

sqlite3 $db <<!
.headers on
.mode tabs
.output
select * from $table;
!

# read everything in a single table of an sqlite3 db and print to stdout
