# XAMPPBackup
# MySQL Database Backup and Restore Script

This script allows you to create a backup of an external MySQL database and restore it to a local MySQL database using XAMPP.

## Prerequisites

Before using this script, ensure that you have the following:

- [XAMPP](https://www.apachefriends.org/index.html) installed on your local machine.
- Access to the external MySQL database that you want to backup.
- The external MySQL database should have the same name as the database you want to create locally.

## Usage

1. Clone or download this repository to your local machine.
2. Edit the `backup_restore.bat` file and modify the following variables:

   - `xamppdir`: Set the path to your XAMPP directory.
   - `externalurl`: Set the URL for the external database dump.
   
3. Save the changes to the `backup_restore.bat` file.

4. Open a command prompt and navigate to the directory where the `backup_restore.bat` file is located.

5. Run the script by executing the following command:

   ```shell
   backup_restore.bat <database_name>
