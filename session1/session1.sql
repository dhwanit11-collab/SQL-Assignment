create database Instaclone;
use Instaclone;
create table Users(user_id int primary key,username varchar(50),email varchar(50),followers_count int);
insert into Users(user_id,username,email,followers_count)
values(1,'Dhwanit','dhwanit98gmail.com',5000),
(2,'Om','om75@gmail.com',2000),
(3,'Keyur sir','keyur85@gmail.com',3000);
create table posts(post_id int primary key,user_id int,captioon varchar(50),post_date date);
alter table posts add foreign key(user_id) references Users(user_id);