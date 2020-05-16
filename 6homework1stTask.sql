DROP database if exists shop;
CREATE database shop;
use shop;
DROP table if exists users;
CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255)
);
INSERT into users(name) values
("Vasya"),
("Petya"),
("Marina"),
("Rita"),
("Kostya");
DROP database if exists sample;
CREATE database sample;
use sample;
DROP table if exists users;
CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	name VARCHAR(255)
);
INSERT into users(name) values
("Arina"),
("Polina"),
("Mishail"),
("Fantomas"),
("Nikita");

SELECT * FROM users;
SELECT * FROM shop.users;
Start transaction;
INSERT into users(name) values((select name from shop.users where id = 1));
use shop;
DELETE FROM users where id = 1;
use sample;
commit;
SELECT * FROM users;
