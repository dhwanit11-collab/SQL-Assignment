DELIMITER //
CREATE PROCEDURE UserDetails()
BEGIN
    DECLARE user_name VARCHAR(50);
    DECLARE user_age INT;
    SELECT user_name, user_age;
END //
DELIMITER ;
CALL UserDetails();
DELIMITER //
CREATE PROCEDURE CheckDelivery()
BEGIN
    DECLARE order_amount DECIMAL(10,2);
    IF order_amount > 500 THEN
        SELECT 'Eligible for free delivery';
    ELSE
        SELECT 'Delivery charges apply';
    END IF;
END //
DELIMITER ;
CALL CheckDelivery();
DELIMITER //

CREATE PROCEDURE PrintNumbers()
BEGIN
    DECLARE i INT;
    number_loop: LOOP
        SELECT i;
        SET i = i + 1;
        IF i > 5 THEN
            LEAVE number_loop;
        END IF;
    END LOOP;
END //
DELIMITER ;
CALL PrintNumbers();
DELIMITER //
CREATE PROCEDURE ShowProducts()
BEGIN
    DECLARE finished;
    DECLARE p_name VARCHAR(100);
    DECLARE product_cursor CURSOR FOR
        SELECT PRODUCT_NAME FROM PRODUCTS;
    DECLARE CONTINUE HANDLER FOR NOT FOUND
        SET finished = 1;
    OPEN product_cursor;
    product_loop: LOOP
        FETCH product_cursor INTO p_name;
        IF finished = 1 THEN
            LEAVE product_loop;
        END IF;
        SELECT p_name;
    END LOOP;
    CLOSE product_cursor;
END //
DELIMITER 
CALL ShowProducts();
DELIMITER //
CREATE PROCEDURE DivideNumbers()
BEGIN
    DECLARE a DECIMAL(10,2);
    DECLARE b DECIMAL(10,2);
    DECLARE result DECIMAL(10,2);
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
        SELECT 'Cannot divide by zero';

    SET result = a / b;
    SELECT result;
END //
DELIMITER ;
CALL DivideNumbers();