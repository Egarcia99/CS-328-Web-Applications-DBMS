
------------
-- pop-bks.sql
--
-- initially-populate the bookstore database created by create-bks.sql
--
-- originally from: Ann Burroughs
-- modified by: Sharon Tuttle
-- last modified: 2020-01-25
------------

delete from sale_line_item;
delete from sale;
delete from order_needed;
delete from order_receipt;
delete from order_line_item;
delete from order_stock;
delete from title;
delete from publisher;

-----
-- initial publisher rows
-----

insert into publisher 
values 
(111, 'Addison-Wesley', 'Reading', 'MA', 250, .05);

insert into publisher
values 
(134, 'Irwin', 'Homewood', 'IL', 150, .03);

insert into publisher
values 
(147, 'Benjamin/Cummings', 'Menlo Park', 'CA', 300, .04);

insert into publisher
values 
(150, 'MacMillan', 'Riverside', 'NJ', 100, .07);

insert into publisher
values 
(189, 'PWS', 'Boston', 'MA', 500, .01);

insert into publisher
values 
(201, 'Prentice Hall', 'Eaglewood Clfs', 'NJ', 100, .04);

insert into publisher
values 
(225, 'Merrill', 'Columbus', 'OH', 200, .01);

insert into publisher
values 
(234, 'McGraw-Hill', 'New York', 'NY', 50, .03);

insert into publisher
values 
(247, 'Science Research Associates', 'Menlo Park', 'CA', 1000, .01);

insert into publisher
values
(275, 'The MIT Press', 'Cambridge', 'MA', 25, .10);

-----
-- initial title rows
-----

insert into title 
values
('9780201122305', 'Computers and Data Processing', 'Capron', 
 30.75, 34.95, 15, 12, 20, 147);

insert into title 
values
('9780805343021', 'BASIC: A Structured Approach', 'Kittner', 
 26.50, 29.95, 5, 10, 10, 147);

insert into title 
values
('9780805360400', 'Data Base Management', 'McFadden', 
 32.50, 37.95, 20, 5, 20, 147);

insert into title 
values
('9780805367829', 'Case Book for Data Base Management', 'McFadden', 
 9.95, 14.95, 50, 40, 10, 147);

insert into title 
values
('9780201106862', 'Building Expert Systems', 'Hayes-Roth', 
 32.50, 41.95, 3, 1, 2, 111);

insert into title 
values
('9780201612578', 'Operating Systems: A Systematic View', 'Davis', 
 29.95, 35.95, 5, 4, 2, 111);

insert into title 
values
('9780201144710', 'An Introduction to Database Systems', 'Date', 
 29.95, 37.95, 10, 15, 12, 111);

insert into title 
values
('9780201078282', 'Problem Solving and Structured Programming', 'Koffman',
 24.95, 37.95, 12, 12, 15, 111);

insert into title 
values
('9780871502445', 'Calculus with Analytic Geometry', 'Campbell', 
 26.50, 46.50, 3, 2, 5, 189);

insert into title 
values 
('9780871507877', 'Intro to Biology: A Human Perspective', 'Farish', 
 32.50, 41.95, 35, 30, 50, 189);

insert into title 
values
('9780256033205', 'Financial Accounting', 'Pyle', 
 26.95, 31.50, 10, 30, 15, 134);

insert into title 
values
('9780138232795', 'Software Engineering', 'Lamb',
 30.00, 40.00, 10, 5, 5, 201);

insert into title 
values
('9780131892422', 'Creating Effective Software', 'King',
 45.00, 55.00, 2, 3, 3, 201);

insert into title 
values
('9780130094285', 'Business Data Communications', 'Stamper',
 39.50, 55.00, 3, 10, 15, 150);

insert into title 
values
('9780133760064', 'Computer Science, An Overview', 'Brookshear',
 41.50, 49.50, 2,  5, 10, 147);

insert into title 
values
('9780073401324', 'Simulation Modeling and Analysis', 'Law',
 60.00, 75.00, 10, 20, 100, 234);

insert into title 
values
('9780070465329', 'SPSS', 'Nie', 
 23.95, 28.95, 75, 70, 10, 234);

insert into title 
values
('9780131889187', 'Management Information Sytems', 'McLeod', 
 25.50, 28.95, 30, 25, 12, 247);

insert into title 
values
('9780131103627', 'The C Programming Language', 'Kernighan',
 25.00, 39.95, 10, 25, 100, 201);

insert into title
values
('9780262534802', 'How to Design Programs', 'Felleisen',
 45.00, 60.00, 15, 10, 10, 275);

-----
-- initial order_stock and order_line_item rows
-- (order_stock rows each followed by their related order_line_item
--     rows)
-----

insert into order_stock
values 
(11009, 147, sysdate-85, sysdate-66);

insert into order_line_item
values 
(11009, 1, '9780805343021', 10);

insert into order_line_item
values 
(11009, 2, '9780133760064', 10);

-- next order:

insert into order_stock
values 
(11010, 111, sysdate-85, sysdate-66);

insert into order_line_item
values 
(11010, 1, '9780201144710', 12);

insert into order_line_item
values 
(11010, 2, '9780201078282', 15);

-- next order:

insert into order_stock
values 
(11011, 134, sysdate-85, sysdate-66);

insert into order_line_item
values 
(11011, 1, '9780256033205', 15);

-- next order:

insert into order_stock
values 
(11012, 201, sysdate-85, sysdate-63);

insert into order_line_item
values 
(11012, 1, '9780131892422', 3);

insert into order_line_item
values 
(11012, 2, '9780131103627', 100);

-- next order:

insert into order_stock
values 
(11013, 150, sysdate-85, sysdate-63);

insert into order_line_item
values 
(11013, 1, '9780130094285', 15);

-- next order:

insert into order_stock
values 
(11014, 234, sysdate-25, sysdate-1);

insert into order_line_item
values 
(11014, 1, '9780073401324', 100);

-----
-- initial order_receipt rows
-----

insert into order_receipt 
values
(20010, 11009, 2, 4, sysdate-5);

insert into order_receipt 
values
(20011, 11014, 1, 25, sysdate-20);

insert into order_receipt
values
(20012, 11013, 1, 13, sysdate-5);

insert into order_receipt
values
(20013, 11010, 1, 5, sysdate-5);

insert into order_receipt
values
(20014, 11014, 1, 25, sysdate-4);

insert into order_receipt
values
(20015, 11014, 1, 50,  sysdate-3);

insert into order_receipt
values
(20016, 11010, 1, 10, sysdate-5);

insert into order_receipt
values
(20017, 11009, 1, 10, sysdate-5);

insert into order_receipt
values
(20018, 11010, 1, 5, sysdate-5);

insert into order_receipt
values
(20019, 11012, 1, 3, sysdate-5);

-----
-- initial order_needed rows
-----

insert into order_needed
values 
(1003, '9780805343021', 10, sysdate-88, 11009);

insert into order_needed
values 
(1004, '9780201144710', 15, sysdate-88, 11010);

insert into order_needed
values 
(1005, '9780201078282', 12, sysdate-88, 11010);

insert into order_needed
values 
(1006, '9780256033205', 15, sysdate-88, 11011);

insert into order_needed
values 
(1007, '9780131892422', 3, sysdate-88, 11012);

insert into order_needed
values 
(1008, '9780130094285', 15, sysdate-88, 11013);

insert into order_needed
values 
(1009, '9780133760064', 10, sysdate-88, 11009);

insert into order_needed
values 
(1010, '9780073401324', 100, sysdate-68, 11014);

-----
-- decided NOT to include any initial sale or sale_line_item
--     rows...
-----

commit;

