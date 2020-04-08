create database if not exists test;
use test;
DROP table IF EXISTS storehouses_products;
create table if not exists storehouses_products (
    value INT
);
INSERT into storehouses_products values (454584),(4514584),(123),(1),(412),(0),(0),(0);
select value FROM storehouses_products ORDER BY value = 0, value;
