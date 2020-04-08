create database if not exists test;
use test;
DROP table IF exists catalogs;
create table if not exists catalogs (
	id SERIAL PRIMARY KEY,
    name VARCHAR(50)
);
INSERT INTO catalogs (`name`) VALUES ("Vasya"), 
("Kolya"),
("Ana"),
("Jones"),
("Batman"),
("Cassandra"),
("Ipolit"),
( "Sveta");
-- select id, MONTHNAME(birthdate), name from users; Для проверки исходных данных
select * from catalogs where id IN (5, 1, 2) ORDER BY FIELD(id, 5,1,2);