@echo off

setlocal

rem Get the argument for the database name
set "databasename=%~1"

rem Set the XAMPP directory path
set "xamppdir=c:\xampp"

rem Set the external source URL for the database dump
set "externalurl=https://localhost"

rem Get the current date in the desired format (dd)
for /f "tokens=1-3 delims=/" %%a in ('echo %date%') do (
  set "day=%%a"
)

rem Form the filename for the database dump
set "dumpname=%day%_%databasename%.sql"

rem Path to the directory where the database dump should be stored
set "dumppath=%xamppdir%\mysql\backup_dump"

rem Create a database dump using mysqldump
echo %xamppdir%\mysql\bin\mysqldump.exe -u root %databasename% > "%dumppath%\%dumpname%"
%xamppdir%\mysql\bin\mysqldump.exe -u root %databasename% > "%dumppath%\%dumpname%"

rem Remove all tables from the database
for /f "skip=1 delims=" %%t in ('c:\xampp\mysql\bin\mysql.exe -u root -e "USE %databasename%; SHOW TABLES;"') do (
    %xamppdir%\mysql\bin\mysql.exe -u root -e "USE %databasename%; DROP TABLE %%t;"
)
rem Download the database backup dump from an external source
certutil -urlcache -split -f "%externalurl%/%databasename%.sql" "%dumppath%\%databasename%.sql"

rem Import the downloaded database dump into the local database
%xamppdir%\mysql\bin\mysql.exe -u root %databasename% < "%dumppath%\%databasename%.sql"

endlocal
