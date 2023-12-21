CREATE user dev_user with password 'SuP3rS3cr3t_123';
ALTER USER dev_user with superuser;

CREATE DATABASE some_db;
GRANT all privileges ON DATABASE some_db TO dev_user;
