#!/bin/bash
#
# MySQL Database Backup Script
# Author: Your Name
# Date: YYYY-MM-DD
# Description:
# This script backs up a MySQL database, stores it with a timestamp,
# and removes backups older than 7 days.

# Variables
USER="your_mysql_user"
PASSWORD="your_mysql_password"
DATABASE="your_mysql_dababase"
BACKUP_DIR="/home/user/mysql_backup"
DATE=$(date +%Y%m%d%H%M)

# Ensure backup directory exists
mkdir -p $BACKUP_DIR

# Create backup
mysqldump -u $USER -p$PASSWORD $DATABASE > $BACKUP_DIR/$DATABASE-$DATE.sql

# Check if the backup was successful
if [ $? -eq 0 ]; then
    echo "Backup successful: $BACKUP_DIR/$DATABASE-$DATE.sql"
else
    echo "Backup failed!" >&2
    exit 1
fi

# Remove old backups (older than 7 days)
find $BACKUP_DIR -type f -name "*.sql" -mtime +7 -exec rm {} \;

echo "Old backups removed."
