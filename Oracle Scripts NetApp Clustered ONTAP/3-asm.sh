#!/bin/ksh

export clonename=$1; export A=1; sanlun lun show -p | grep -A5 $1 | grep "Host Device:" | awk '{print $3}' | while read line; do export disk$A=$line; let A=$A+1; done

export clonename=$1; export A=1; set | grep disk | while read line; do line=`echo $line | awk -F '=' '{print $2}'`; /oracle/app/product/11g/db/bin/kfed read /dev/mapper/$line | grep kfdhdb.grpname | sed -e 's/SN/'$clonename'/g' > disk-$A.txt; /oracle/app/product/11g/db/bin/kfed merge /dev/mapper/$line disk-$A.txt; let A=$A+1; done

export clonename=$1; export A=1; set | grep disk | while read line; do line=`echo $line | awk -F '=' '{print $2}'`; multipath -ll | grep $line | awk '{ print "chown grid:oinstall /dev/" $2}' > disk-$A.txt; sh disk-$A.txt; let A=$A+1; done

export clonename=$1; export A=1; set | grep disk | while read line; do line=`echo $line | awk -F '=' '{print $2}'`; multipath -ll | grep $line | awk '{ print "chmod 660 /dev/" $2}' > disk-$A.txt; sh disk-$A.txt; let A=$A+1; done


rm -rf /root/clone/*.txt

su - grid -c "sqlplus / as sysasm << EOF
alter diskgroup CLONE_data mount;
alter diskgroup CLONE_log mount;
EOF"
