#!/bin/bash 

su - oracle -c "sqlplus / as sysdba << EOF
alter database begin backup;
EOF"

ssh neto@superman snapshot create -vserver oracle_SN -volume SN_data_vol -snapshot $1 

su - oracle -c "sqlplus / as sysdba << EOF
alter database end backup;
alter system archive log current;
alter system archive log current;
alter system archive log current;
EOF"
ssh neto@superman snapshot create -vserver oracle_SN -volume SN_log_vol -snapshot $1 
