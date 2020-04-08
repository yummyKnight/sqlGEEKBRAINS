create database if not exists multimedia;
use multimedia;
DROP TABLE IF EXISTS users;
create table if not exists users (
    created_at VARCHAR(50),
    updated_at VARCHAR(50)
);
INSERT INTO users (`created_at`, `updated_at`) VALUES ("20.10.2017 8:10","20.10.2017 8:10"),
("21.11.2019 19:10","21.11.2019 19:10"), ("01.01.1999 01:10","01.01.1999 1:10");
UPDATE users SET created_at = STR_TO_DATE(created_at,"%d.%m.%Y %k:%i"), updated_at = STR_TO_DATE(updated_at,"%d.%m.%Y %k:%i");
ALTER TABLE users MODIFY created_at DATETIME;
ALTER TABLE users MODIFY updated_at DATETIME;
SELECT * FROM users;
