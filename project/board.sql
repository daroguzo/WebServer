set character_set_client=utf8;
set character_set_results=utf8;
set character_set_connection=utf8;
set character_set_server=utf8;
set character_set_database=utf8;
DROP TABLE IF EXISTS `project`;
create table project(id varchar(10) primary key, name varchar(15) not null, content text(50), \
		  cDate  varchar(15), ip varchar(15) not null, pw varchar(15) not null);
