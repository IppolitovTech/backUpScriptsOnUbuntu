#!/bin/bash
timestamp=`date +%Y-%m-%d-%H-%M` # Determine the current date
backupFS="/home/www/user/data/www/siteName/webroot/img/ /home/www/user/data/www/siteName/webroot/files/" # Determine which directories we will back up
backupTO="/home/backups/files/" # Determine where we will save back up
backupLog="/home/backups/files/backup.log" # Determine where we save a log file
KeepTime=4 # Determine period of keeping backups


echo "$timestamp — Start" >> $backupLog # Write down the start date of the backups
if [ -d $backupTO ]; then # Checking directory exist for backups
find $backupTO -maxdepth 1 -name \*.tar.gz -mtime ${KeepTime} -exec rm -f {} \; # Removing files older than Keep time
   for i in $backupFS # Beginning to do backup copy directories from  из backupFS
   do
      j=`expr ${i//\//-}` # Removing extra characters “/”
      tar -zcvf $backupTO/`hostname`.${timestamp}.${j}.tar.gz $i  # Compressing to archive
      echo "$timestamp — Finish" >> $backupLog # Writing down the date and time of the end of the backup
      echo "$i is done" # Displaying a completion message
   done
else
   echo "backup directory is missing...exiting"
   exit 1
fi