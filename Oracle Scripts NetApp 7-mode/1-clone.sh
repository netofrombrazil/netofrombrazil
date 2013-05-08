#!/bin/ksh

export snapshotname=$2; export clonename=$1; cat rr.conf | grep rr_oradata_10g | awk '{print "ssh " $1 " vol clone create " "'$clonename'__" $5 " -s none -b " $5}' | while read line; do echo $line $snapshotname;  done
export snapshotname=$2; export clonename=$1; cat rr.conf | grep rr_oralog_10g  | awk '{print "ssh " $1 " vol clone create " "'$clonename'__" $5 " -s none -b " $5}' | while read line; do echo $line $snapshotname;  done
export snapshotname=$3; export clonename=$1; cat rr.conf | grep rr_oraarch_10g | awk '{print "ssh " $1 " vol clone create " "'$clonename'__" $5 " -s none -b " $5}' | while read line; do echo $line $snapshotname; done

export snapshotname=$2; export clonename=$1;cat rr.conf | grep rr_oradata_10g | awk '{print "ssh " $1 " lun online " "/vol/" "'$clonename'" "__"$5"/" $5".lun" }' 
export snapshotname=$2; export clonename=$1;cat rr.conf | grep rr_oralog_10g  | awk '{print "ssh " $1 " lun online " "/vol/" "'$clonename'" "__"$5"/" $5".lun" }'
export snapshotname=$3; export clonename=$1;cat rr.conf | grep rr_oraarch_10g | awk '{print "ssh " $1 " lun online " "/vol/" "'$clonename'" "__"$5"/" $5".lun" }'

export snapshotname=$2; export clonename=$1;cat rr.conf | grep rr_oradata_10g | awk '{print "ssh " $1 " lun map " "/vol/" "'$clonename'" "__"$5"/" $5".lun" " mickey-host0" }'
export snapshotname=$2; export clonename=$1;cat rr.conf | grep rr_oradata_10g | awk '{print "ssh " $1 " lun map " "/vol/" "'$clonename'" "__"$5"/" $5".lun" " mickey-host1" }'

export snapshotname=$2; export clonename=$1;cat rr.conf | grep rr_oralog_10g | awk '{print "ssh " $1 " lun map " "/vol/" "'$clonename'" "__"$5"/" $5".lun" " mickey-host0" }'
export snapshotname=$2; export clonename=$1;cat rr.conf | grep rr_oralog_10g | awk '{print "ssh " $1 " lun map " "/vol/" "'$clonename'" "__"$5"/" $5".lun" " mickey-host1" }'

export snapshotname=$3; export clonename=$1;cat rr.conf | grep rr_oraarch_10g | awk '{print "ssh " $1 " lun map " "/vol/" "'$clonename'" "__"$5"/" $5".lun" " mickey-host0" }'
export snapshotname=$3; export clonename=$1;cat rr.conf | grep rr_oraarch_10g | awk '{print "ssh " $1 " lun map " "/vol/" "'$clonename'" "__"$5"/" $5".lun" " mickey-host1" }'

echo "rescan.sh -r -s"
echo "multipath -v3"
echo "multipath -v3 -ll"
