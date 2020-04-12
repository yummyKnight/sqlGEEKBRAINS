create database if not exists test;
use test;
DROP table IF exists users;
create table if not exists users (
	id SERIAL PRIMARY KEY,
    birthdate DATE,
    name VARCHAR(50)
);
INSERT INTO users(`birthdate`, `name`) VALUES (NOW() + INTERVAL FLOOR(RAND() * 120) DAY, "Vasya"), 
(NOW() + INTERVAL FLOOR(RAND() * 120) DAY, "Kolya"),
(NOW() + INTERVAL FLOOR(RAND() * 120) DAY, "Sveta");
-- select id, MONTHNAME(birthdate), name from users; Для проверки исходных данных
select id, MONTHNAME(birthdate), name from users where MONTHNAME(birthdate) IN ("August", "May");