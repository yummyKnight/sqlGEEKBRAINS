CREATE database if not exists fweek;
use fweek;
DROP table if exists users;
CREATE table users(
	id SERIAL primary key,
	name varchar(255),
	birthday DATE
);
insert into users(`name`, `birthday`) values 
("Vasya", "1970-01-01" + INTERVAL FLOOR(RAND() * 365 * 30) DAY),
("Petya", "1970-01-01" + INTERVAL FLOOR(RAND() * 365 * 30) DAY),
("Slava", "1970-01-01" + INTERVAL FLOOR(RAND() * 365 * 30) DAY),
("Kolya", "1970-01-01" + INTERVAL FLOOR(RAND() * 365 * 30) DAY),
("Veronica", "1970-01-01" + INTERVAL FLOOR(RAND() * 365 * 30) DAY),
("Kostya", "1970-01-01" + INTERVAL FLOOR(RAND() * 365 * 30) DAY),
("Rita", "1970-01-01" + INTERVAL FLOOR(RAND() * 365 * 30) DAY),
("Nastya", "1970-01-01" + INTERVAL FLOOR(RAND() * 365 * 30) DAY),
("Vova", "1970-01-01" + INTERVAL FLOOR(RAND() * 365 * 30) DAY);
-- вывод исходной таблицы + столбец с № дня недели когда было др в год рождения  
SELECT name,birthday ,DAYOFWEEK(birthday) FROM users; 
-- вывод таблицы + столбец с № дня недели когда было др в этот год.
SELECT name, DAYOFWEEK(REPLACE(birthday, YEAR(birthday), YEAR(NOW()))) FROM users;
-- количество дней рождения, которые приходятся на каждый из дней недели в этом году
SELECT COUNT(*), DAYOFWEEK(REPLACE(birthday, YEAR(birthday), YEAR(NOW()))) as day_of_week FROM users group by day_of_week;