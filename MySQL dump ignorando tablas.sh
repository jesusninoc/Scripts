OUTFILETABLES="/opt/backup/$FECHA.estructura.sql"
OUTFILE="/opt/backup/$FECHA.sql"

mysqldump --no-data basedatos > $OUTFILETABLES
mysqldump --single-transaction \
	--ignore-table=basedatos.search_index \
	--ignore-table=basedatos.cache \
	basedatos > $OUTFILE
