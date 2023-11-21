SHOW DATABASES;
CREATE DATABASE `SQL_TEST`;

USE `sql_test`;
CREATE TABLE `student`(
		`student_id` INT,
        `name` VARCHAR(20),
        `major` VARCHAR(20),
        PRIMARY KEY(`student_id`)
);

describe `student`;
select* from `student`;
insert into `student` values (3, '小綠', NULL);
insert into `student`(`name`,`major`,`student_id`) values ('小藍', '英語', 4);

set character_set_results=utf8;
show create table `student`;
alter table `student` change major major varchar(20) character set utf8;