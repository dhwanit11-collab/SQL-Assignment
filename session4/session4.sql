use assignment;
create table playlist(id int primary key auto_increment,song_name varchar(100),artist varchar(100),genre varchar(100),playcount int);
insert into playlist(song_name,artist,genre,playcount)
values('Naach Mei Jaan','Pritam','Pop',1000),
('Sweety Tera Drama','Dev Negi','Pop',2000),
('Dhingana','Mika Singh','Pop',3000),
('Krisna Trance','Kaala Bhairava','hip hop',4000),
('Tere Vaaste','Varun Jain','hip hop',5000);
select song_name,artist as singer from playlist;
select * from playlist where genre='pop' and playcount>1000 order by playcount desc;
select count(*) from playlist where genre='hip hop';
select sum(playcount) from playlist group by genre;
drop table playlist;