CREATE database if not exists fweek;
use fweek;
DROP table if exists numb;
CREATE table numb(
	id SERIAL primary key,
	num FLOAT
);
INSERT into numb(`num`) values
(RAND() * 10),
(RAND() * 10),
(RAND() * 10),
(RAND() * 10);
select * from numb;
-- не работает на отрицательных числах
select EXP(sum(ln(num))) as multiplicity from numb;