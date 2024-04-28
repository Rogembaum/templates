BACKUP DATABASE [DBNAME] TO  DISK = N'C:\backup\Full\DBNAME.bak' WITH  RETAINDAYS = 7, NOFORMAT, NOINIT,  NAME = N'DBNAME-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, COMPRESSION,  STATS = 10
GO
declare @backupSetId as int
select @backupSetId = position
from msdb..backupset
where database_name=N'DBNAME' and backup_set_id=(select max(backup_set_id)
    from msdb..backupset
    where database_name=N'DBNAME' )
if @backupSetId is null begin
    raiserror(N'Verify failed. Backup information for database ''DBNAME'' not found.', 16, 1)
end
RESTORE VERIFYONLY FROM  DISK = N'C:\backup\Full\DBNAME.bak' WITH  FILE = @backupSetId,  NOUNLOAD,  NOREWIND
GO