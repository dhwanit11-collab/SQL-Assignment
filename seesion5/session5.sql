USE second_db;
CREATE TABLE influencers (
    influencer_id INT PRIMARY KEY,
    name VARCHAR(100)
);
CREATE TABLE posts (
    post_id INT PRIMARY KEY,
    influencer_id INT,
    caption VARCHAR(255),
    FOREIGN KEY (influencer_id)
        REFERENCES influencers(influencer_id)
);
INSERT INTO influencers (influencer_id, name)
VALUES
(1, 'Rahul'),
(2, 'Priya'),
(3, 'Amit');
INSERT INTO posts (post_id, influencer_id, caption)
VALUES
(101, 1, 'Travel Vlog'),
(102, 1, 'Food Review'),
(103, 2, 'Fashion Tips'),
(104, 2, 'Beauty Tutorial'),
(105, 3, 'Gaming Video'),
(106, 3, 'Tech Review');