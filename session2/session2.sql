create database assignment;
use assignment;
create table restaurants(id int primary key auto_increment,name varchar(100),location varchar(100),rating decimal(2,1));
alter table restaurants add (average_cost int);
insert into restaurants(name,location,rating)
values("Honest","Memnagar",4.9);
drop table restaurants;
create table playlists(playlist_id int primary key auto_increment,title varchar(50),created_by varchar(50),created_at date);