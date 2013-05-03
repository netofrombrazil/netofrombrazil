#!/bin/ksh

#export snapshotname=$2; export clonename=$1; ssh neto@superman volume clone create -flexclone $1__SN_data -parent-volume SN_data_vol -parent-snapshot $2 -foreground false -vserver oracle_SN -space-guarantee none
#export snapshotname=$2; export clonename=$1; ssh neto@superman volume clone create -flexclone $1__SN_log -parent-volume SN_log_vol -parent-snapshot $2 -foreground false -vserver oracle_SN -space-guarantee none
 
#export snapshotname=$2; export clonename=$1; ssh neto@superman lun map -vserver oracle_SN -path /vol/$1__SN_data/SN_data -igroup happy -lun-id 16
#export snapshotname=$2; export clonename=$1; ssh neto@superman lun map -vserver oracle_SN -path /vol/$1__SN_log/SN_log -igroup happy -lun-id 26

rescan.sh -r -s
multipath -v3
multipath -v3 -ll
