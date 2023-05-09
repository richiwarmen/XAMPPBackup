# XAMPPBackup
# MySQL Database Backup to local Script

This script allows you to create a backup of an external MySQL database and restore it to a local MySQL database using XAMPP.

## Prerequisites.

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

  cmd
  backup_restore.bat <database_name>
Replace <database_name> with the name of the database you want to backup and restore.

6. The script will create a backup of the external database, remove all tables from the local database, download the database dump from the external source, and import it into the local database.

## If everything is running ad task to windows Task Scheduler: 
1. Open Task Scheduler.
2. Click on "Create Task" in the right panel.
3. Provide a name and an optional description for the task.
4. Go to the "Triggers" tab and click on "New".
5. Set the trigger based on your requirements.
6. Go to the "Actions" tab and click on "New".
7. In the "Program/script" field, browse to the path of the "backup_restore.bat" file.
8. Add the database input argument to the "Add arguments" field. For example: %databasename%.
9. In the "Start in" field, specify the path to the folder where the batch file is located.
10. Click "OK" to add the action.
11. Click "OK" to create the task.

## Important Notes
This script assumes that you have XAMPP installed in the default location (C:\xampp). If your XAMPP installation is in a different location, make sure to update the xamppdir variable accordingly.
The external URL (externalurl) should point to the location where the external database dump is accessible. Update it with the correct URL before running the script.
Take caution when using the "DROP TABLE" command, as it permanently deletes all tables from the local database. Make sure you have a proper backup before executing this script.
