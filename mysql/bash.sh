# Changing host permissions for MySQL users

# OLD
UPDATE mysql.user SET Host='%' WHERE Host='localhost' AND User='username';

UPDATE mysql.db SET Host='%' WHERE Host='localhost' AND User='username';

FLUSH PRIVILEGES;



# new
RENAME USER 'username'@'oldhost' TO 'username'@'newhost';




# ------------------------------------
SELECT spid, loginame, dbid, program_name
FROM sys.sysprocesses
WHERE dbid = DB_ID('YourDatabaseName');

kill 317;

ALTER DATABASE YourDatabaseName
SET SINGLE_USER WITH ROLLBACK IMMEDIATE;


ALTER DATABASE YourDatabaseName
SET MULTI_USER;
