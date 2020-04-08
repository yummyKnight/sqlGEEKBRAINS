create database if not exists multimedia;
use multimedia;
DROP table if exists users;
create table if not exists users (
    created_at DATE,
    updated_at DATE
);
INSERT INTO users VALUES(NULL, NULL);
SELECT * FROM users;
UPDATE users SET created_at = NOW(), updated_at = NOW();
select * FROM users;
