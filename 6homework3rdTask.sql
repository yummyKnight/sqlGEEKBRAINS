CREATE database if not exists home_work_w4;
use home_work_w4;
DROP TABLE IF EXISTS dates;
CREATE TABLE dates (
  id SERIAL PRIMARY KEY,
  `date` DATETIME
);
insert into dates(`date`) values
('2018-08-01'),
('2018-08-04'),
('2018-08-16'),
('2018-08-17');
DROP TABLE if exists temp;
CREATE TEMPORARY TABLE temp (id SERIAL PRIMARY KEY, `date` DATETIME, t INT);
DECLARE dt DATETIME DEFAULT "2018-08-01";

WHILE dt < '2018-09-01' DO
	INSERT INTO temp(`date`, `t`) 
	VALUES (dt, IF(dt in (select `date` from dates d2 ), 1, 0));
	SET dt = DATEADD(DAY,1,dt);
END while;