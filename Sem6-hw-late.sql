/*
1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

DROP FUNCTION SecToDays;

DELIMITER $$ -- //
CREATE FUNCTION SecToDays(seconds BIGINT UNSIGNED)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	RETURN CONCAT(
            FLOOR(seconds / 86400), ' days ',
            FLOOR(MOD(seconds, 86400)/3600), ' hours ',
            FLOOR(MOD(seconds,3600)/60), ' minutes ',
            MOD(seconds,60), ' seconds '
        );
END $$ -- //
DELIMITER ;

SELECT SecToDays(1234566666);



/*
2. Выведите только чётные числа от 1 до 10.
Пример: 2,4,6,8,10
*/


DROP PROCEDURE even_proc;

DELIMITER $$ -- //
CREATE PROCEDURE even_proc(n INT)
BEGIN
	DECLARE res VARCHAR(200) DEFAULT ' ';
    DECLARE x INT;
    SET x = 1;
    
    REPEAT
		SET x = x + 1;
	IF MOD(x,2)=0 THEN
        IF x=2 THEN
          SET res = x;
        ELSE
          SET res = CONCAT(res, ',', x);
        END IF;
	END IF;
		UNTIL x >= n
	END REPEAT;
    
    SELECT res;
END $$ -- //
DELIMITER ;

CALL even_proc(127);
