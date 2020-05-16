DROP database if exists my_shop;
CREATE database if not exists my_shop;
use my_shop;
DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT "Название",
  description varchar(255)
);

DROP TRIGGER IF EXISTS check_insert;
DROP TRIGGER IF EXISTS check_update;
delimiter //
CREATE TRIGGER check_insert BEFORE INSERT ON products
FOR EACH ROW
BEGIN
	DECLARE is_name_null, is_desc_null BOOLEAN;
	set is_name_null = isnull(new.name);
	set is_desc_null = isnull(new.description);
	if (is_name_null && is_desc_null) then
		SIGNAL SQLSTATE '14818' SET MESSAGE_TEXT = 'Table cant contain 2 var with NULL';
	end if;
END//

CREATE TRIGGER check_update BEFORE UPDATE ON products
FOR EACH ROW
BEGIN
	DECLARE is_new_name_null, is_new_desc_null, is_old_name_null, is_old_desc_null  BOOLEAN;
	set is_new_name_null =  isnull(new.name);
	set is_new_desc_null = isnull(new.description);
	set is_old_name_null =  isnull(new.name);
	set is_old_desc_null = isnull(new.description);
	if (is_new_name_null && is_new_desc_null || 
		is_old_name_null && is_new_desc_null ||
		is_old_desc_null && is_new_name_null
		) then
		SIGNAL SQLSTATE '14818' SET MESSAGE_TEXT = 'Table cant contain 2 var with NULL';
	end if;
END//

delimiter ;

INSERT into products(`name`, description ) values
("Avakado", NULL),
(NULL, "red berry"),
("Lol", "kek");

# will produce error
/*INSERT into products(`name`, description ) values
(NULL, NULL);*/

# will produce error
-- UPDATE products set name = NULL where id = 1;
# will produce error
-- UPDATE products set description = NULL WHERE id = 2;

# will not produce eror
UPDATE products set name = NULL where id = 3;
SELECT * FROM products;

