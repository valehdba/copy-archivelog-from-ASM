#!/bin/bash
. /home/oracle/.bash_profile
export ORACLE_SID=+ASM1  
export ORACLE_HOME=$GRID_HOME  
export PATH=$ORACLE_HOME/bin:$BASE_PATH  
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib  
export CLASSPATH=$ORACLE_HOME/JRE:$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib 
cd /home/oracle/backup/rman/archivelogs/
mkdir `date -d "1 day ago" "+%Y_%m_%d"`
for i in $(asmcmd ls +FRA/TESTDB/ARCHIVELOG/`date -d "1 day ago" "+%Y_%m_%d"`);
do asmcmd cp +FRA/TESTDB/ARCHIVELOG/`date -d "1 day ago" "+%Y_%m_%d"`/$i /home/oracle/backup/rman/archivelogs/`date -d "1 day ago" "+%Y_%m_%d"`;
done
zip -r `date -d "1 day ago" "+%Y_%m_%d"`.zip `date -d "1 day ago" "+%Y_%m_%d"`
rm -r `date -d "1 day ago" "+%Y_%m_%d"`
