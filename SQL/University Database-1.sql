use master
go
create database [Mainul Islam Rahat]
go
use [Mainul Islam Rahat]
create table department
(
dept_name varchar(10),
building char(5),
budget bigint,
constraint dn_pk primary key (dept_name)
)
go
create table instructor
(
ID tinyint,
name char(20),
dept_name varchar(10),
salary int,
primary key (ID),
constraint dn_fk foreign key (dept_name) references department (dept_name)
)
go
create table student
(
ID tinyint constraint dn_pk_id primary key (ID),
name char(20),
dept_name varchar(10),
tot_cred tinyint,
foreign key (dept_name) references department (dept_name)
)
go
create table advisor
(
s_id tinyint primary key constraint dn_fk_s foreign key (s_id) references student
(ID),
i_id tinyint foreign key references instructor,
)
go
create table course
(
course_id varchar(10) primary key (course_id),
title char(50),
dept_name varchar(10) foreign key (dept_name) references department (dept_name),
credits tinyint
)
go
create table prereq
(
course_id varchar(10) foreign key references course,
prereq_id varchar(10) foreign key references course,
constraint c_pk primary key (course_id, prereq_id)
)
go
create table time_slot
(
time_slot_id smallint,
day char(10),
start_time varchar(10),
end_time varchar(10),
constraint t_pk primary key (time_slot_id, day, start_time)
)
go
create table classroom
(
building char(5),
room_number tinyint,
capacity tinyint,
primary key(building, room_number)
)
go
create table section
(
course_id varchar(10),
sec_id varchar(10),
semester varchar(15),
year tinyint,
building char(5),
room_number tinyint,
time_slot_id smallint,
day char(10),
start_time varchar(10),
primary key (course_id, sec_id, semester, year),
foreign key (building, room_number) references classroom,
foreign key (time_slot_id, day, start_time) references time_slot(time_slot_id,
day, start_time)
)
go
create table teaches
(
ID tinyint foreign key references Instructor,
course_id varchar(10),
sec_id varchar(10),
semester varchar(15),
year tinyint,
primary key (course_id, sec_id, semester, year),
foreign key (course_id, sec_id, semester, year) references section
)
go
create table takes
(
ID tinyint foreign key references student,
course_id varchar(10),
sec_id varchar(10),
semester varchar(15),
year tinyint,
grade varchar(12),
constraint ta_pk primary key (ID,course_id, sec_id, semester, year),
constraint ta_fk foreign key (course_id, sec_id, semester, year) references
section
)