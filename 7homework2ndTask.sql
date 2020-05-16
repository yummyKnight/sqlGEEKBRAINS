CREATE database if not exists home_work_w7;
use home_work_w7;
DROP TABLE IF EXISTS accounts;
CREATE TABLE accounts (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT "Имя",
  `password` VARCHAR(60) COMMENT "Пароль в открытом виде"
);
INSERT into accounts(`name`, `password`) values
("Vasya","123456"),
("Petya","654231"),
("Tanya","qwerty");
DROP view if exists reader; 
CREATE view reader as select id, name FROM accounts;
SELECT * FROM reader;

grant SELECT on home_work_w7.reader to 'user_read'@'localhost' IDENTIFIED with sha256_password BY 'pass1';   