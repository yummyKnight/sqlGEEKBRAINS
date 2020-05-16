DROP function if exists hello;
delimiter //
CREATE function hello ()
	RETURNS VARCHAR(20)
	
BEGIN
	DECLARE phrase VARCHAR(20);
	DECLARE time_ TIME;
	SELECT CURRENT_TIME() into time_;
	IF (time_ >= '6:00:00' && time_ < '12:00:00') THEN 
		SET phrase = 'Доброе утро';
	ELSEIF (time_ >= '12:00:00' && time_ < '18:00:00') THEN
		SET phrase = 'Добрый день';
	ELSEIF (time_ >= '18:00:00' && time_ < '00:00:00') THEN
		SET phrase = 'Добрый вечер';
	ELSEIF (time_ >= '00:00:00' && time_ < '06:00:00') THEN
		SET phrase = 'Доброй ночи';
	END IF;
	return phrase;
END//
delimiter ;


SELECT hello();