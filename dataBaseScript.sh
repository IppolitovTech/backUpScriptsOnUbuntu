# set up all the mysqldump variables
PERIOD=daily
DATE=`date +"%d_%b_%Y_%H%M"`
DATABASE=your-database
SQLFILE=/home/backups/db/${PERIOD}/${DATABASE}_backup_${PERIOD}_${DATE}.sql
USER=your-username
PASSWORD=your-password

# remove the previous version of the file
unalias rm     2> /dev/null
rm ${SQLFILE}     2> /dev/null
rm ${SQLFILE}.gz  2> /dev/null

# do the mysql database backup (dump)
mysqldump -u ${USER} -p${PASSWORD} ${DATABASE}|gzip > ${SQLFILE}.gz