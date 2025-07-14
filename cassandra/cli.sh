# Create user and grant permission on keyspace
CREATE ROLE username WITH PASSWORD = 'pass' AND LOGIN = true;
GRANT ALL PERMISSIONS ON KEYSPACE keyspace_name TO username;
# or specific
GRANT SELECT ON KEYSPACE keyspace_name TO username;
LIST ALL PERMISSIONS ON KEYSPACE keyspace_name OF username;
# testing
cqlsh localhost -u username -p strong_password


REVOKE ALL PERMISSIONS ON KEYSPACE keyspace_name FROM username;
