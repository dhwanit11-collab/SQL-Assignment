use second_db;
START TRANSACTION;
INSERT INTO Orders (order_id, user_id, order_total)
VALUES (101, 1, 1500);
COMMIT;
SELECT * FROM Orders
WHERE order_id = 101;
SELECT * FROM Orders
WHERE order_id = 101;
START TRANSACTION;
INSERT INTO OrderItems (item_id, order_id, item_name, quantity)
VALUES (1, 101, 'Pizza', 1);
INSERT INTO OrderItems (item_id, order_id, item_name, quantity)
VALUES (2, 101, 'Burger', 2);
ROLLBACK;
SELECT * FROM OrderItems
WHERE order_id = 101;
START TRANSACTION;
INSERT INTO Cart (cart_id, user_id, product_name, quantity)
VALUES (1, 1, 'Laptop', 1);
SAVEPOINT product_added;
INSERT INTO Cart (cart_id, user_id, product_name, quantity)
VALUES (2, 1, 'Mouse', 1);
ROLLBACK TO SAVEPOINT product_added;
COMMIT;
SELECT * FROM Cart
WHERE user_id = 1;
CREATE TABLE Wallet (
    user_id INT PRIMARY KEY,
    balance DECIMAL(10,2)
);
CREATE TABLE WalletTransactions (
    transaction_id INT PRIMARY KEY,
    user_id INT,
    amount DECIMAL(10,2)
);
DELIMITER //
CREATE TRIGGER deduct_wallet_balance
AFTER INSERT ON WalletTransactions
FOR EACH ROW
BEGIN
    UPDATE Wallet
    SET balance = balance - NEW.amount
    WHERE user_id = NEW.user_id;
END //
DELIMITER ;
INSERT INTO Wallet VALUES (1, 5000.00);
INSERT INTO WalletTransactions
VALUES (101, 1, 1000.00);
SELECT * FROM Wallet;
DELIMITER //
CREATE TRIGGER buggy_wallet_trigger
AFTER INSERT ON WalletTransactions
FOR EACH ROW
BEGIN
    UPDATE Wallet
    SET balance = balance + NEW.amount
    WHERE user_id = NEW.user_id;
END //
DELIMITER ;
DELIMITER //
CREATE TRIGGER correct_wallet_trigger
AFTER INSERT ON WalletTransactions
FOR EACH ROW
BEGIN
    UPDATE Wallet
    SET balance = balance - NEW.amount
    WHERE user_id = NEW.user_id;
END //
DELIMITER ;