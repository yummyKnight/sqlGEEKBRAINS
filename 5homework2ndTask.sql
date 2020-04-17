CREATE database if not exists home_work_w3;
use home_work_w3;
DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT "Название",
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id(catalog_id)
) COMMENT = "Товарные позиции";

DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT "Название раздела"
) COMMENT = "Разделы интернет-магазина";

INSERT INTO catalogs VALUES (DEFAULT, 'CPU');
INSERT INTO catalogs VALUES (DEFAULT, 'Motherboard');
INSERT INTO catalogs VALUES (DEFAULT, 'GPU');

INSERT INTO products (`name`, `catalog_id`) 
VALUES ("Gigabyte-321", 2),
("Gigabyte-123", 2),
("Intal-g123", 1),
("AMUD-kew", 1),
("NVADIA-rgb", 3),
("AMUD-fire", 3);
SELECT p.name, c.name FROM catalogs c join products p on c.id = p.catalog_id
