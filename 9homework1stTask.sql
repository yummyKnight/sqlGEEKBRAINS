DROP database if exists homework_10;
CREATE database homework_10;
use homework_10;
DROP TABLE IF EXISTS logs_;
CREATE TABLE logs_ (
  table_name VARCHAR(255),
  key_ BIGINT UNSIGNED NOT NULL COMMENT 'Идентификатор первичного ключа',
  name VARCHAR(255) COMMENT 'Поле name',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
) COMMENT = 'Разделы интернет-магазина' ENGINE=Archive;
DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
id SERIAL PRIMARY KEY,
name VARCHAR(255) COMMENT 'Название раздела'
) COMMENT = 'Разделы интернет-магазина';

DROP TABLE IF EXISTS users;
CREATE TABLE users (
id SERIAL PRIMARY KEY,
name VARCHAR(255) COMMENT 'Имя покупателя'
) COMMENT = 'Покупатели';

DROP TABLE IF EXISTS products;
CREATE TABLE products (
id SERIAL PRIMARY KEY,
name VARCHAR(255) COMMENT 'Название',
desription TEXT COMMENT 'Описание',
price DECIMAL (11,2) COMMENT 'Цена',
catalog_id INT UNSIGNED
) COMMENT = 'Товарные позиции';

delimiter //
DROP trigger if exists check_insert_users//
CREATE TRIGGER check_insert_users AFTER INSERT ON users
FOR EACH ROW
BEGIN
	INSERT INTO logs_ (`table_name`, `key_`, `name`) values ("users", new.id, new.name);
END//

DROP trigger if exists check_insert_catalogs//
CREATE TRIGGER check_insert_catalogs AFTER INSERT ON catalogs
FOR EACH ROW
BEGIN
	INSERT INTO logs_(`table_name`, `key_`, `name`) values ("catalogs", new.id, new.name);
END//

DROP trigger if exists check_insert_products//
CREATE TRIGGER check_insert_products AFTER INSERT ON products
FOR EACH ROW
BEGIN
	INSERT INTO logs_ (`table_name`, `key_`, `name`) values ("products", new.id, new.name);
END//
delimiter ;
INSERT INTO products (`name`,`desription`, `price` ,`catalog_id`) 
VALUES ("Gigabyte-321","desription", 123, 2),
("Gigabyte-123", "desription", 123 , 2),
("Intal-g123","desription", 123, 1),
("AMUD-kew", "desription", 123 ,1),
("NVADIA-rgb", "desription", 123 ,3),
("AMUD-fire", "desription", 123 ,3);

INSERT into users(`name`) values
("Vasya"),
("Petya"),
("Dima");
INSERT into catalogs(`name`) values
("CPU"),
("GPU"),
("Motherboards");
INSERT INTO products (`name`,`desription`, `price` ,`catalog_id`) 
VALUES ("Gigabyte-321","desription", 123, 2),
("Gigabyte-123", "desription", 123 , 2),
("Intal-g123","desription", 123, 1),
("AMUD-kew", "desription", 123 ,1),
("NVADIA-rgb", "desription", 123 ,3),
("AMUD-fire", "desription", 123 ,3);
SELECT * from logs_ 