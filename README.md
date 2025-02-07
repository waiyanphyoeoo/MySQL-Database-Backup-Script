# MySQL Database Backup Script

## **1. Description**
This script automates MySQL database backups and ensures that only recent backups (less than 7 days old) are kept. It performs the following tasks:

- Connects to MySQL and creates a backup of a specified database.
- Saves the backup in a designated directory with a timestamp.
- Deletes backup files older than 7 days to free up storage.
- Provides logging for success or failure.

---

## **2. Table of Contents**
1. [Requirements](#2-requirements)  
2. [Installation](#3-installation)  
3. [Usage](#4-usage)  
4. [Configuration](#5-configuration)  
5. [Automating with Cron Job](#6-automating-with-cron-job)  
6. [Security Considerations](#7-security-considerations)  
7. [GitHub Version](#8-github-version)  

---

## **3. Requirements**
- MySQL installed and running  
- Bash shell (Linux/macOS)  
- Sufficient disk space for backups  
- Permissions to execute scripts  

---

## **4. Installation**
### **Clone the Repository**
```bash
git clone https://github.com/yourusername/mysql-backup-script.git
cd mysql-backup-script
```

### **Make the Script Executable**
```bash
chmod +x mysql_backup.sh
```

---

## **5. Usage**
Run the script manually:
```bash
./mysql_backup.sh
```
Or schedule it to run automatically (see [Automating with Cron Job](#6-automating-with-cron-job)).

---

## **6. Configuration**
Edit the script variables to match your MySQL setup:
```bash
USER="your_mysql_user"
PASSWORD="your_mysql_password"
DATABASE="your_database"
BACKUP_DIR="/path/to/backup"
```
Ensure the **backup directory exists** before running the script:
```bash
mkdir -p /path/to/backup
```

---

## **7. Automating with Cron Job**
To automate backups daily at 2 AM, add this line to `crontab -e`:
```bash
0 2 * * * /path/to/mysql_backup.sh >> /var/log/mysql_backup.log 2>&1
```
This logs output to `/var/log/mysql_backup.log`.

---

## **8. Security Considerations**
- **Avoid storing passwords in scripts.** Instead, use a **MySQL configuration file** (`~/.my.cnf`):
  ```ini
  [client]
  user=your_mysql_user
  password=your_mysql_password
  ```
- Then modify the script to exclude the password:
  ```bash
  mysqldump $DATABASE > $BACKUP_DIR/$DATABASE-$DATE.sql
  ```

---

🚀 **Now your MySQL backups are automated and secure!**  
