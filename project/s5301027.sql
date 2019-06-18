set character_set_client=utf8;
set character_set_results=utf8;
set character_set_connection=utf8;
set character_set_server=utf8;
set character_set_database=utf8;
DROP TABLE IF EXISTS `park`;
create table park(pno int(8) primary key, pname varchar(15), psum varchar(30), area varchar(15),  
sdate varchar(15), facil  varchar(15), plant varchar(15), info varchar(15), road varchar(15), 
refer varchar(15), image varchar(30), region varchar(10), paddr varchar(30), 
depa varchar(15), tel varchar(15), xlocag int(15), ylocag int(15), 
xlocaw float(15), yloacw float(15), short varchar(20) );
load data local infile "s5301027.csv" into table park fields terminated by ',' 
 enclosed by '"' lines terminated by '\n' ignore 1 rows;
