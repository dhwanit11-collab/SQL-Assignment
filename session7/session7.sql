use second_db;
CREATE TABLE Restaurant (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(100) NOT NULL,
    cuisine VARCHAR(50)
);
CREATE TABLE FoodOrder (
    order_id INT PRIMARY KEY,
    restaurant_id INT,
    user_id INT,
    order_total DECIMAL(10,2),
    FOREIGN KEY (restaurant_id)
        REFERENCES Restaurant(id)
);
CREATE TABLE SpotifyUser (
    user_id INT PRIMARY KEY,
    username VARCHAR(100) UNIQUE,
    email VARCHAR(100) NOT NULL,
    subscription_type VARCHAR(50)
);
INSERT INTO SpotifyUser
(user_id, username, email, subscription_type)
VALUES
(1, 'rahul', 'rahul@gmail.com', 'Premium'),
(2, 'priya', 'priya@gmail.com', 'Free'),
(3, 'amit', 'amit@gmail.com', 'Premium'),
(4, 'neha', 'neha@gmail.com', 'Free'),
(5, 'jay', 'jay@gmail.com', 'Family'),
(6, 'riya', 'riya@gmail.com', 'Student');
SELECT SpotifyUser.username, FoodOrder.order_total
FROM SpotifyUser
INNER JOIN FoodOrder
ON SpotifyUser.user_id = FoodOrder.user_id
WHERE FoodOrder.order_total > 1000;
SELECT username, order_total
FROM TopSpendersView
WHERE order_total > 2000
ORDER BY order_total DESC;