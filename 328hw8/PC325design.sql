--Autumn Young & Chad Bellinger
--Modified by Emilyo Garcia
--CS 328 - spring 2023
-- Feb 18 2023

prompt
prompt Creating table Customer
prompt

drop table Customer cascade constraints;

create table Customer
(cust_id char(4),
 cust_name varchar2(30),
 address varchar2(30),
 primary key (cust_id)
);

prompt
prompt Creating table Customer_phone
prompt

drop table Customer_phone cascade constraints;

create table Customer_phone
(cust_id char(4),
 cust_phone char(10),
 primary key (cust_id, cust_phone),
 foreign key (cust_id) references Customer
);

prompt
prompt Creating table Event
prompt

drop table Event cascade constraints;

create table Event
(event_id char(5),
 event_name varchar2(30),
 location varchar2(20),
 event_date date,
 primary key (event_id)
);

prompt
prompt Creating table Event_reg
prompt

drop table Event_reg cascade constraints;

create table Event_reg
(event_id char(5),
 cust_id char(4),
 primary key (event_id, cust_id),
 foreign key (event_id) references Event,
 foreign key (cust_id) references Customer
);

prompt
prompt Creating table Pet
prompt

drop table Pet cascade constraints;

create table Pet
(pet_id char(6),
 pet_name varchar2(20),
 breed varchar2(20),
 food varchar2(20),
 age int,
 cust_id char(4),
 primary key (pet_id),
 foreign key (cust_id) references Customer
);

prompt
prompt Creating table Employee
prompt

drop table Employee cascade constraints;

create table Employee
(empl_id char(4),
 empl_fname varchar2(15),
 empl_lname varchar2(15),
 salary int,
 primary key (empl_id)
);

prompt
prompt Creating table Volunteer
prompt

drop table Volunteer cascade constraints;

create table Volunteer
(vol_id char(4),
 vol_fname varchar2(15),
 vol_lname varchar2(15),
 vol_hrs int,
 primary key (vol_id)
);
