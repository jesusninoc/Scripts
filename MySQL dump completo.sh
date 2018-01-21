fecha=`date +%Y%m%d%H%M`
/usr/bin/mysqldump basedatos > /backup/$fecha.sql
