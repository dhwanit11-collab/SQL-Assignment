SELECT user_id, COUNT(*) AS order_count
FROM orders
GROUP BY user_id;
SELECT restaurant_name, AVG(rating) AS average_rating
FROM restaurants
GROUP BY restaurant_name
HAVING AVG(rating) > 4.0;
SELECT DISTINCT user_id
FROM payments
WHERE user_id IN (
    SELECT user_id
    FROM payments
    WHERE amount > 2000
);
SELECT movie_name
FROM movies
WHERE rating > (
    SELECT AVG(rating)
    FROM movies
);