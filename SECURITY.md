# Re-create the SECURITY.md file after execution state reset

security_content = """# Security Policy

## **1. Supported Versions**
The following versions of the MySQL Backup Script receive security updates:

| Version | Supported |
|---------|-----------|
| 1.0     | ✅ Yes |
| <1.0    | ❌ No |

---

## **2. Reporting Security Issues**
If you discover a security vulnerability, please follow these steps:

1. **Do not disclose publicly.** Report the issue privately to the repository owner.
2. **Provide a detailed description**, including:
   - Steps to reproduce the vulnerability
   - Potential impact and risk level
   - Possible solutions or mitigations
3. **Email Contact**: [waiyanphyoeoo13@gmail.com]

---

## **3. Best Security Practices**
To keep your backup script secure, follow these best practices:

### **3.1. Do Not Store Passwords in Scripts**
- Instead of storing credentials in the script, use **MySQL’s configuration file** (`~/.my.cnf`):
  ```ini
  [client]
  user=your_mysql_user
  password=your_mysql_password

