# Changing host permissions for MySQL users

# OLD
UPDATE mysql.user SET Host='%' WHERE Host='localhost' AND User='username';

UPDATE mysql.db SET Host='%' WHERE Host='localhost' AND User='username';

FLUSH PRIVILEGES;



# new
RENAME USER 'username'@'oldhost' TO 'username'@'newhost';