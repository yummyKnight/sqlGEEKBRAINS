CREATE database if not exists home_work_w3;
use home_work_w3;
DROP table if exists flights;
CREATE TABLE flights(
	id SERIAL PRIMARY KEY,
	`from` VARCHAR(255),
	`to` VARCHAR(255)
);
DROP table if exists cities;
CREATE TABLE cities(
	label VARCHAR(255),
	name VARCHAR(255)
);
INSERT into flights(`from`, `to`) values
("moscow", "omsk"),
("novgorod", "kazan"),
("irkutsk", "moscow"),
("omsk", "irkutsk"),
("moskow", "kazan");

INSERT into cities(`label`, `name`) values
("moscow", "Москва"),
("irkutsk", "Иркутск"),
("novgorod", "Новгород"),
("kazan", "Казань"),
("omsk", "Омск");

UPDATE flights as f JOIN cities as c SET f.`from` = c.name WHERE c.label = f.`from`;
UPDATE flights as f JOIN cities as c SET f.`to` = c.name WHERE c.label = f.`to`;

SELECT * FROM flights 
