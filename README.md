# MySQL Database Backup Script

## **2. Table of Contents**
[1. Requirements](#1-requirements)  
[2. Installation](#2-installation)  
[3. Usage](#3-usage)  
[4. Configuration](#4-configuration)  
[5. Automating with Cron Job](#5-automating-with-cron-job)  
[6. Security Considerations](#6-security-considerations)  

---

## **1. Requirements** <a name="1-requirements"></a>
- MySQL installed and running  
- Bash shell (Linux/macOS)  
- Sufficient disk space for backups  
- Permissions to execute scripts  

---

## **2. Installation** <a name="2-installation"></a>
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

## **3. Usage** <a name="3-usage"></a>
Run the script manually:
```bash
./mysql_backup.sh
```
Or schedule it to run automatically (see [5. Automating with Cron Job](#5-automating-with-cron-job)).

---

## **4. Configuration** <a name="4-configuration"></a>
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

## **5. Automating with Cron Job** <a name="5-automating-with-cron-job"></a>
To automate backups daily at 2 AM, add this line to `crontab -e`:
```bash
0 2 * * * /path/to/mysql_backup.sh >> /var/log/mysql_backup.log 2>&1
```
This logs output to `/var/log/mysql_backup.log`.

---

## **6. Security Considerations** <a name="6-security-considerations"></a>
- **Avoid storing passwords in scripts.** Instead, use a **MySQL configuration file** (`~/.my.cnf`):
  ```ini
  [client]
  user=your_mysql_user
  password=your_mysql_password
  ```
- Then modify the script to exclude the password:
  ```bash
  mysqldump $DATABASE > $BACKUP_DIR/$DATABASE-$DATE.sql
  
