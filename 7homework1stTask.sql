DROP database if exists my_shop;
CREATE database if not exists my_shop;
use my_shop;
DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT "Название",
  catalog_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY index_of_catalog_id(catalog_id)
) COMMENT = "Товарные позиции";
INSERT INTO products (`name`, `catalog_id`) 
VALUES ("Gigabyte-321", 2),
("Gigabyte-123", 2),
("Intal-g123", 1),
("AMUD-kew", 1),
("NVADIA-rgb", 3),
("AMUD-fire", 3);
GRANT SELECT ON my_shop.* TO 'fuser'@'localhost' IDENTIFIED with sha256_password BY 'pass1';
GRANT ALL ON my_shop.* TO 'suser'@'localhost' IDENTIFIED with sha256_password BY 'pass2';