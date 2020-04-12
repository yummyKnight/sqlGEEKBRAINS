-- уточнение задания: в таблице users располагаются дата рождений пользователей;
-- нужно найти средний возраст всех пользователей с на сегодняшний и округлить.   
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
SELECT name, (TO_DAYS(NOW()) - TO_DAYS(birthday))/365.25 from users; -- возраст каждого человека
SELECT ROUND( AVG((TO_DAYS(NOW()) - TO_DAYS(birthday))/365.25) ) from users; -- возраст в среднем