#!/bin/ksh

export clonename=$1; export A=1; sanlun lun show -p | grep -A5 $1 | grep "DM-MP DevName:" | awk '{print $3}' | while read line; do export disk$A=$line; let A=$A+1; done

export clonename=$1; export A=1; set | grep disk | while read line; do line=`echo $line | awk -F '=' '{print $2}'`; /oracle/app/product/10.2/db/bin/kfed read /dev/mapper/$line"p1" | grep kfdhdb.grpname | sed -e 's/RR/'$clonename'/g' > disk-$A.txt; /oracle/app/product/10.2/db/bin/kfed merge /dev/mapper/$line"p1" disk-$A.txt; let A=$A+1; done

export clonename=$1; export A=1; export asmdisk="";set | grep disk | while read line; do line=`echo $line | awk -F '=' '{print $2}'`; /oracle/app/product/10.2/db/bin/kfed read /dev/mapper/$line"p1" | grep kfdhdb.dskname | sed -e 's/RR/'$clonename'/g' > asmlibdisk-$A.txt; cat asmlibdisk-$A.txt | awk '{ print "/etc/rc.d/init.d/oracleasm force-renamedisk /dev/mapper/" "'$line'" "p1 " $2}';let A=$A+1; done

rm -rf /root/clone/*.txt
