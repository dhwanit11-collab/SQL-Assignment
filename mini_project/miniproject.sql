use second_db;
CREATE TABLE playlists (
    playlist_id INT PRIMARY KEY,
    user_id INT,
    name VARCHAR(100),
    created_at DATETIME,
    FOREIGN KEY (user_id) REFERENCES SpotifyUser(user_id)
);
INSERT INTO playlists (playlist_id, user_id, name, created_at)
VALUES
(1, 1, 'Workout Mix', '2026-10-01 08:30:00'),
(2, 2, 'Chill Vibes', '2026-10-05 19:15:00'),
(3, 1, 'Top Hits', '2026-10-07 14:00:00');
UPDATE playlists
SET name = 'Evening Chill'
WHERE name = 'Chill Vibes'
AND user_id = 2;
DELETE FROM playlists
WHERE name = 'Workout Mix'
AND user_id = 1;
DELIMITER //
CREATE PROCEDURE GetMonthlyPlaylistCount(
    IN p_user_id INT,
    IN p_month INT
)
BEGIN
    SELECT COUNT(*) AS total_playlists
    FROM playlists
    WHERE user_id = p_user_id
    AND MONTH(created_at) = p_month;
END //
DELIMITER ;