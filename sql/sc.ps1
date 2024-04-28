-- Backup FULL
$curdate = get-date
((get-date).addDays
(-1)) -uformat "%Y%m%d"

set-alias
7zip "$env:ProgramFiles\7-Zip\7z.exe"

sqlcmd
-i
C:
\
backup\DB_diff_backup.sql  -o
c:
\
backup\log-diff-
backup-DB-"$curdate".txt

sqlcmd -i
C:
\
backup\DB_full_backup.sql  -o
c:
\
backup\log-full-
backup-DB-"$curdate".txt
sqlcmd -i
C:
\
backup\system_db.sql  -o
c:
\
backup\log-system-db-"$curdate".txt

7zip a -t7z -mmt=8 -mx0 -mhe=on -pPASSWORD -sdel
C:
\
backup\Full\DB-full-
backup-"$curdate".7z
C:
\
backup\Full\*.bak

7zip a -t7z -mmt=8 -mx0 -mhe=on -pPASSWORD -sdel
c:
\
backup\System\system_db-"$curdate".7z
C:
\
backup\System\*.bak