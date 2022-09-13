use master
go
create database [Mainul Islam Rahat]
go
use [Mainul Islam Rahat]

--department table
create table department
(
dept_name char(15),
building char(10),
budget int,
constraint dn_pk primary key (dept_name)
)
go

--instructor table 
create table instructor
(
ID bigint,
[name] char(50),
dept_name char(15),
salary int,
primary key (ID),
constraint ins_fk foreign key (dept_name) references department (dept_name)
)
go

--student table
create table student
(
ID bigint constraint st_pk_id primary key (ID),
[name] char(50),
dept_name char(15),
tot_cred tinyint,
foreign key (dept_name) references department (dept_name)
)
go

--advisor table
create table advisor
(
s_id bigint primary key constraint st_fk_s foreign key (s_id) references student
(ID),
i_id bigint foreign key references instructor
)
go

--course table
create table course
(
course_id varchar(10) primary key (course_id),
title char(50),
dept_name char(15) foreign key (dept_name) references department (dept_name),
credits tinyint
)
go

--prerequisite course table
create table prereq
(
course_id varchar(10) foreign key references course,
prereq_id varchar(10) foreign key references course (course_id),
constraint pre_pk primary key (course_id, prereq_id)
)
go

--time-slot table
create table time_slot
(
time_slot_id varchar(5),
[day] char(10),
start_time varchar(10),
end_time varchar(10),
constraint t_pk primary key (time_slot_id)
)
go

--classroom table
create table classroom
(
building char(10),
room_number int,
capacity tinyint,
primary key(building, room_number)
)
go

--section table
create table section
(
course_id varchar(10),
sec_id tinyint,
semester char(10),
[year] int,
building char(10),
room_number int,
time_slot_id varchar(5),
primary key (course_id, sec_id, semester, [year]),
foreign key (building, room_number) references classroom,
foreign key (time_slot_id) references time_slot (time_slot_id)
)
go

--teaches table
create table teaches
(
ID bigint foreign key references instructor,
course_id varchar(10),
sec_id tinyint,
semester char(10),
[year] int,
primary key (ID, course_id, sec_id, semester, [year]),
foreign key (course_id, sec_id, semester, [year]) references section
)
go

--takes table
create table takes
(
ID bigint constraint tak_fk foreign key references student (ID),
course_id varchar(10),
sec_id tinyint,
semester char(10),
[year] int,
grade dec(3,2),
constraint ta_pk primary key (ID,course_id, sec_id, semester, [year]),
constraint ta_fk foreign key (course_id, sec_id, semester, [year]) references section
)


/* Insert Values into University Database*/

--insert values into department table
insert into department values
('Biology','Watson',90000),
('Comp. Sci.','Taylor',100000),
('Elec. Eng.','Taylor',85000),
('Finance','Painter',120000),
('History','Painter',50000),
('Music','Packard',80000),
('Physics','Watson',70000)

--insert values into instructor table
insert into instructor values
(22222 ,'Einstein','Physics',95000),
(12121 ,'Wu','Finance',90000),
(32343 ,'El Said','History',60000),
(45565 ,'Katz','Comp. Sci.',75000),
(98345 ,'Kim','Elec. Eng.',80000),
(76766 ,'Crick','Biology',72000),
(10101 ,'Srinivasan','Comp. Sci.',65000),
(58583 ,'Califieri','History',62000),
(83821 ,'Brandt','Comp. Sci.',92000),
(15151 ,'Mozart','Music',40000),
(33456 ,'Gold','Physics',87000),
(76543 ,'Singh','Finance',80000)

--insert values into student table
insert into student values
(1712831042, 'Mainul Islam Rahat', 'Comp. Sci.', 1 ),
(1822746483,'Benzir Ahammed Shawon','Comp. Sci.', 39),
(1726482648,'Gazi Shoaib','Biology', 45),
(1837484758,'A.K.M Shamsuddin Rakib','Finance', 70),
(1836596794,'Mohammed','History', 90),
(1937583758,'Abir Md. Fuad Hasan Anan','History', 100), 
(1538564375,'Nabiha Meherin','History', 32),
(1528463858,'Zarin Musharrat','Comp. Sci.', 27),
(1437586946,'Nafisa Yasmin','Music', 67),
(1584738684,'samreen sohail','Physics', 125),
(1947583658,'Nuzhath Tabassum Orpaa','Elec. Eng.', 127 ),
(1947573846,'Sayem Ahmed  Sajil','Physics', 30),
(1437584933,'Nashrah Haque','Physics', 60),
(1947573547,'Rashidul Hassan Borshon','Music', 100),
(1327482547,'Alifa Khan','Elec. Eng.', 125)

--insert values into advisor table
insert into advisor values
(1528463858, 12121),
(1538564375,22222),
(1584738684, 10101),
(1712831042,58583),
(1726482648,83821),
(1822746483,22222),
(1836596794,10101),
(1837484758,76543),
(1937583758, 10101),
(1947573547, 33456),
(1947573846,22222),
(1947583658,76543)

--insert values into course table
insert into course values
('BIO-101','Intro. to Biology','Biology',4),
('BIO-301','Genetics','Biology',4),
('BIO-399','Computational Biology','Biology',3),
('CS-101','Intro. to Computer Science','Comp. Sci.',4),
('CS-190','Game Design','Comp. Sci.',4),
('CS-315','Robotics ','Comp. Sci.',3),
('CS-319','Image Processing','Comp. Sci.',3),
('CS-347','Database System Concepts','Comp. Sci.',3),
('EE-181','Intro. to Digital Systems','Elec. Eng.',3),
('FIN-201','Investment Banking','Finance',3),
('HIS-351','World History','History',3),
('MU-199','Music Video Production','Music',3),
('PHY-101','Physical Principles','Physics',4)

--insert values into prerequisite table
insert into prereq values
('BIO-301','BIO-101'),
('BIO-399','BIO-101'),
('CS-190','CS-101'),
('CS-315','CS-101'),
('CS-319','CS-101'),
('CS-347','CS-101'),
('EE-181','PHY-101')

--insert values into time-slot table
insert into time_slot values
('A1','Saturday','8:00 am','9:30 am'),
('B1','Saturday','9:40 am','11:10 am'),
('C1','Saturday','11:20 am','12:50 pm'),
('D1','Saturday','01:00 pm','02:30 pm'),
('E1','Saturday','02:40 pm','4:10 pm'),
('F1','Saturday','04:20 pm','05:50 pm'),
('A2','Sunday','8:00 am','9:30 am'),
('B2','Sunday','9:40 am','11:10 am'),
('C2','Sunday','11:20 am','12:50 pm'),
('D2','Sunday','01:00 pm','02:30 pm'),
('E2','Sunday','02:40 pm','4:10 pm'),
('F2','Sunday','04:20 pm','05:50 pm'),
('A3','Monday','8:00 am','9:30 am'),
('B3','Monday','9:40 am','11:10 am'),
('C3','Monday','11:20 am','12:50 pm'),
('D3','Monday','01:00 pm','02:30 pm'),
('E3','Monday','02:40 pm','4:10 pm'),
('F3','Monday','04:20 pm','05:50 pm'),
('A4','Tuesday','8:00 am','9:30 am'),
('B4','Tuesday','9:40 am','11:10 am'),
('C4','Tuesday','11:20 am','12:50 pm'),
('D4','Tuesday','01:00 pm','02:30 pm'),
('E4','Tuesday','02:40 pm','4:10 pm'),
('F4','Tuesday','04:20 pm','05:50 pm'),
('A5','Wednesday','8:00 am','9:30 am'),
('B5','Wednesday','9:40 am','11:10 am'),
('C5','Wednesday','11:20 am','12:50 pm'),
('D5','Wednesday','01:00 pm','02:30 pm'),
('E5','Wednesday','02:40 pm','4:10 pm'),
('F5','Wednesday','04:20 pm','05:50 pm'),
('A6','Thursday','8:00 am','9:30 am'),
('B6','Thursday','9:40 am','11:10 am'),
('C6','Thursday','11:20 am','12:50 pm'),
('D6','Thursday','01:00 pm','02:30 pm'),
('E6','Thursday','02:40 pm','4:10 pm'),
('F6','Thursday','04:20 pm','05:50 pm')

--insert values into classroom table
insert into classroom values
('Watson',100,30),
('Taylor',3128,43),
('Painter',514,43),
('Painter',201,30),
('Watson',110,35),
('Taylor',405,43),
('Packard',101,43),
('Watson',120,35),
('Watson',505,43),
('Taylor',401,43)

--insert values into section table
insert into section values
('BIO-101',1,'Summer',2017,'Painter',514,'B1'),
('BIO-301',1,'Summer',2018,'Painter',514,'C6'),
('CS-101',1,'Fall',2017,'Packard',101,'F6'),
('CS-101',1,'Spring',2018,'Packard',101,'F2'),
('CS-190',1,'Spring',2017,'Taylor',3128,'E3'),
('CS-190',2,'Spring',2017,'Taylor',3128,'A1'),
('CS-315',1,'Spring',2018,'Watson',120,'D4'),
('CS-319',1,'Spring',2018,'Watson',100,'B3'),
('CS-319',2,'Spring',2018,'Taylor',3128,'C5'),
('CS-347',1,'Fall',2017,'Taylor',3128,'A3'),
('EE-181',1,'Spring',2017,'Taylor',3128,'C1'),
('FIN-201',1,'Spring',2018,'Packard',101,'B5'),
('HIS-351',1,'Spring',2018,'Painter',514,'C4'),
('MU-199',1,'Spring',2018,'Packard',101,'D3'),
('PHY-101',1,'Fall',2017,'Watson',100,'A6')

--insert values into teaches table
insert into teaches values
(10101,'CS-101',1,'Fall',2017),
(10101,'CS-315',1,'Spring',2018),
(10101,'CS-347',1,'Fall',2017),
(12121,'FIN-201',1,'Spring',2018),
(15151,'MU-199',1,'Spring',2018),
(22222,'PHY-101',1,'Fall',2017),
(32343,'HIS-351',1,'Spring',2018),
(45565,'CS-101',1,'Spring',2018),
(45565,'CS-319',1,'Spring',2018),
(76766,'BIO-101',1,'Summer',2017),
(76766,'BIO-301',1,'Summer',2018),
(83821,'CS-190',1,'Spring',2017),
(83821,'CS-190',2,'Spring',2017),
(83821,'CS-319',2,'Spring',2018),
(98345,'EE-181',1,'Spring',2017)

--insert values into takes table
insert into  takes values
(1712831042,'BIO-101',1,'Summer',2017,3.9),
(1822746483,'CS-347',1,'Fall',2017,3.5),
(1726482648,'CS-190',1,'Spring',2017,2.76),
(1837484758,'EE-181',1,'Spring',2017,3.17),
(1836596794,'HIS-351',1,'Spring',2018,2.90),
(1937583758,'BIO-301',1,'Summer',2018,2.37),
(1538564375,'FIN-201',1,'Spring',2018,3.94),
(1528463858,'CS-101',1,'Spring',2018,1.69),
(1437586946,'HIS-351',1,'Spring',2018,1.83),
(1947583658,'BIO-101',1,'Summer',2017,2.19),
(1584738684,'BIO-301',1,'Summer',2018,3.78),
(1947573846,'CS-190',1,'Spring',2017,4.00),
(1437584933,'CS-190',2,'Spring',2017,3.78),
(1947573547,'PHY-101',1,'Fall',2017,2.65),
(1327482547,'EE-181',1,'Spring',2017,3.99)