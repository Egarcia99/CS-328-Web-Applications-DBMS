----------
-- this file sets up example tables for query practice.
--
-- adapted from Oracle example tables used for SQL instruction
--
-- last modified: 2019-09-20
-- by: Sharon Tuttle
----------

----------
-- create and populate table dept

drop table dept cascade constraints;

create table dept
(dept_num    char(3),
 dept_name   varchar2(15) not null,
 dept_loc    varchar2(15) not null,
 primary key (dept_num)
);

insert into dept
values
('100', 'Accounting', 'New York');

insert into dept
values
('200', 'Research', 'Dallas');

insert into dept
values
('300', 'Sales', 'Chicago');

insert into dept
values
('400', 'Operations', 'Boston');

insert into dept
values
('500', 'Management', 'New York');

----------
-- create and populate table empl

drop table empl cascade constraints;

create table empl
(empl_num        char(4),
 empl_last_name	 varchar2(15) not null,
 job_title       varchar2(10),
 mgr             char(4),
 hiredate        date         not null,
 salary          number(6,2), 
 commission      number(6,2),
 dept_num        char(3),
 primary key     (empl_num),
 foreign key     (dept_num) references dept,
 foreign key     (mgr)      references empl(empl_num));

insert into empl(empl_num, empl_last_name, job_title, hiredate,
                 salary, dept_num)
values
('7839', 'King', 'President', '17-Nov-2011', 5000.00,  '500');

insert into empl(empl_num, empl_last_name, job_title, mgr, hiredate,
                 salary, dept_num)
values
('7566', 'Jones', 'Manager', '7839', '02-Apr-2012', 2975.00, '200');

insert into empl(empl_num, empl_last_name, job_title, mgr, hiredate,
                 salary, dept_num)
values
('7698', 'Blake', 'Manager', '7839', '01-May-2013', 2850.00, '300');

insert into empl(empl_num, empl_last_name, job_title, mgr, hiredate,
                 salary, dept_num)
values
('7782', 'Raimi', 'Manager', '7839', '09-Jun-2012', 2450.00, '100');

insert into empl(empl_num, empl_last_name, job_title, mgr, hiredate,
                 salary, dept_num)
values
('7902', 'Ford', 'Analyst', '7566', '03-Dec-2012', 3000.00, '200');

insert into empl(empl_num, empl_last_name, job_title, mgr, hiredate,
                 salary, dept_num)
values
('7369', 'Smith', 'Clerk', '7902', '17-Dec-2012', 800.00, '200');

insert into empl
values
('7499', 'Michaels', 'Sales', '7698', '20-Feb-2018', 1600.00, 300.00, 
 '300');

insert into empl
values
('7521', 'Ward', 'Sales', '7698', '22-Feb-2019', 1250.00, 500.00, 
 '300');

insert into empl
values
('7654', 'Martin', 'Sales', '7698', '28-Sep-2018', 1250.00, 1400.00, 
 '300');

insert into empl(empl_num, empl_last_name, job_title, mgr, hiredate,
                 salary, dept_num)
values
('7788', 'Scott', 'Analyst', '7566', '09-Nov-2018', 3000.00, '200');

insert into empl
values
('7844', 'Turner', 'Sales', '7698', '08-Sep-2019', 1500.00, 0.00, 
 '300');

insert into empl(empl_num, empl_last_name, job_title, mgr, hiredate,
                 salary, dept_num)
values
('7876', 'Adams', 'Clerk', '7788', '23-Sep-2018', 1100.00, '400');

insert into empl(empl_num, empl_last_name, job_title, mgr, hiredate,
                 salary, dept_num)
values
('7900', 'James', 'Clerk', '7698', '03-Dec-2017', 950.00, '300');

insert into empl(empl_num, empl_last_name, job_title, mgr, hiredate,
                 salary, dept_num)
values
('7934', 'Miller', 'Clerk', '7782', '23-Jan-2016', 1300.00, '100');

----------
-- create and populate table customer

drop table customer cascade constraints;

create table customer
(cust_id      char(6),
 cust_lname   varchar2(20)   not null,
 cust_fname   varchar2(15),
 empl_rep     char(4),
 cust_street  varchar2(30),
 cust_city    varchar2(15),
 cust_state   char(2),
 cust_zip     varchar2(10),
 cust_balance number(7,2)    default 0.0,
 primary key  (cust_id),
 foreign key  (empl_rep) references empl(empl_num));

insert into customer
values
('100001', 'Firstly', 'First', '7499', '1111 First Street', 'Fortuna', 'CA',
 '95520', 1111.11);

insert into customer
values
('100002', 'Secondly', 'Second', '7654', '2222 Second Street', 
 'McKinleyville', 'CA', '95523', 222.20);

insert into customer(cust_id, cust_lname, cust_fname, empl_rep,
                     cust_street, cust_city, cust_state, cust_zip) 
values
('100003', 'Thirdly', 'Third', '7499', '333 Third Street', 'Arcata', 
 'CA', '95519-1234');

-- end of set-up-ex-tbls.sql   
