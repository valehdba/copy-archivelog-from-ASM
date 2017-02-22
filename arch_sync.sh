#!/bin/bash
. /home/oracle/.bash_profile
cd /home/oracle/backup/rman/archivelogs/
mkdir `date -d "1 day ago" "+%Y_%m_%d"`
. /home/oracle/grid_env
for i in $(asmcmd ls +FRA/TESTDB/ARCHIVELOG/`date -d "1 day ago" "+%Y_%m_%d"`);
do asmcmd cp +FRA/TESTDB/ARCHIVELOG/`date -d "1 day ago" "+%Y_%m_%d"`/$i /home/oracle/backup/rman/archivelogs/`date -d "1 day ago" "+%Y_%m_%d"`;
done
zip -r `date -d "1 day ago" "+%Y_%m_%d"`.zip `date -d "1 day ago" "+%Y_%m_%d"`
rm -r `date -d "1 day ago" "+%Y_%m_%d"`
