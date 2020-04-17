CREATE database if not exists home_work_w3;
use home_work_w3;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя'
) COMMENT = 'Покупатели';

DROP TABLE IF EXISTS orders;
CREATE TABLE orders (
  order_num INT UNSIGNED,
  user_id INT UNSIGNED
) COMMENT = 'Заказы';
INSERT INTO users(`name`) VALUES ("Vasya"), ("Pete"), ("Grisha"), ("Roma");
INSERT INTO orders(`order_num`,`user_id`) VALUES (2,1), (3,2), (0, 3), (0,2);
SELECT name FROM users where id in (SELECT user_id from orders where order_num > 0)