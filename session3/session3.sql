use assigment;
set sql_safe_updates=0;
create table restaurants(id int primary key auto_increment,name varchar(100),cusine varchar(100),rating decimal(2,1),city varchar(100));
insert into restaurants(name,cusine,rating,city) 
values('Honest','Pasta',2.9,'Ahmedabad'),
('Spice Villa','Noodles',2.9,'Vadodra'),
('Taco Bell','Burrito',4.9,'Ahmedabad'),
('La Pinoz','Pizza',5.0,'Ahmedabad'),
('Anand','Bhaji pav',2.6,'Ahmedabad');
update restaurants set rating=4.0 where name='Spice villa';
delete from restaurants where rating<3.5;
select * from restaurants where rating>4;
drop table restaurants;