
------------
-- create-bks.sql
--
-- create the tables for a simple bookstore database
--
-- originally from: Ann Burroughs
-- modified by: Sharon Tuttle
-- last modified: 2020-01-25
------------

----------
-- publisher table contains information about
--     publishers of titles potentially carried by this bookstore
--
-- *   pub_min_for_disc is this publisher's minimum order total to
--     receive a discount, given in pub_disc_pct
--     *   if a publisher does not make discounts available,
--         pub_min_for_disc will be NULL, and pub_disc_pct will be 0
----------

drop table publisher cascade constraints;

create table publisher 
(pub_id            number(3),
 pub_name          varchar2(30) not null, 
 pub_city          varchar2(15) not null, 
 pub_state         char(2)      not null, 
 pub_min_for_disc  number(7,2), 
 pub_disc_pct      number(3,2)  not null 
                                check(pub_disc_pct between 0 and .99), 
 constraint publisher_pk primary key (pub_id)
);

----------
-- title table contains information about the different
--     titles carried by this bookstore (one title row represents
--     all of the copies of that title)
--
-- *   ttl_auth_lname is the last name of what is considered to be
--     the primary/first author of this title
-- *   ttl_order_point is the number of copies at which an order
--     is considered to be needed for restocking this title
-- *   ttl_auto_order_qty is the quantity to normally/automatically
--     order when the quantity on hand reaches the order
--     point 
----------

drop table title cascade constraints;

create table title 
(ttl_isbn           char(13),
 ttl_name           varchar2(45) not null, 
 ttl_auth_lname     varchar2(30),
 ttl_cost           number(7,2)  not null, 
 ttl_price          number(7,2)  not null, 
 ttl_qty            number(3)    not null, 
 ttl_order_point    number(3)    not null, 
 ttl_auto_order_qty number(3)    not null, 
 pub_id             number(3)    not null, 
 constraint title_pk primary key (ttl_isbn), 
 constraint title_fk_pub foreign key (pub_id) references publisher
);

----------
-- order_stock represents an order of titles from a
--     publisher; the details of each title being
--     ordered are given in a related row in order_line_item
--
-- fun fact: Oracle DBMS will not let you give a table the name
--     order...
----------

drop table order_stock cascade constraints;

create table order_stock
(ord_num           number(6), 
 pub_id            number(3) not null, 
 ord_date_placed   date      not null, 
 ord_date_complete date,
 constraint order_stock_pk primary key (ord_num), 
 constraint order_stock_fk_pub foreign key (pub_id) references publisher
);

----------
-- order_line_item has the order details for one
--     of the titles in an order
--
-- *   this bookstore likes to number these (line item 1, line item 2,
--     etc.) for the titles within an order; that is the
--     meaning of attribute ord_line_num
-- *   ord_line_qty is the quantity of this title being ordered
--     in this order
----------

drop table order_line_item cascade constraints;

create table order_line_item
(ord_num      number(6), 
 ord_line_num number(2), 
 ttl_isbn     char(13)  not null, 
 ord_line_qty number(3) not null, 
 constraint order_line_item_pk primary key (ord_num, ord_line_num),
 constraint order_line_item_fk_order foreign key (ord_num) 
     references order_stock,
 constraint order_line_item_fk_title foreign key (ttl_isbn) 
     references title
);

----------
-- order_receipt represents a shipment received of
--    one of the titles in an order -- note that
--    it may only be partial, with more copies of
--    that title still to be received later
----------

drop table order_receipt cascade constraints;

create table order_receipt 
(ord_receipt_id number(7), 
 ord_num        number(6) not null, 
 ord_line_num   number(5) not null, 
 qty_rcvd       number(3) not null,  
 ord_rec_date   date      not null, 
 constraint order_receipt_pk primary key (ord_receipt_id),
 constraint order_receipt_fk_ord_line 
     foreign key (ord_num, ord_line_num) references order_line_item
);

----------
-- a row is added to order_needed when it is determined that
--     an order is needed for a title (typically because 
--     its ttl_qty has gone below its ttl_order_point, meaning it 
--     is time to order more, BUT could also be because a bookstore
--     manager is preparing for a special event, anticipating
--     demand, etc.)
--
-- *   foreign key ord_num will be null until an order is actually
--     placed
----------

drop table order_needed cascade constraints;

create table order_needed 
(ord_needed_id   number, 
 ttl_isbn        char(13)     not null, 
 qty_desired     number(3)    not null, 
 date_need_noted date         not null, 
 ord_num         number(6),
 constraint order_needed_pk primary key (ord_needed_id),
 constraint order_needed_fk_order foreign key (ord_num) references order_stock,
 constraint order_needed_fk_title foreign key (ttl_isbn) references title
);

----------
-- sale represents a single sale of titles to someone;
--     the details of each title sold in this sale are given
--     in a related row in sale_line_item
--
-- *   this bookstore is particularly noted for not keeping
--     customer information (to protect customer privacy)
----------

drop table sale cascade constraints;

create table sale
(sale_num    number(8), 
 sale_date   date not null, 
 constraint sale_pk primary key (sale_num)
);

----------
-- sale_line_item has the sale details for one
--     of the titles in a sale
--
-- *   this bookstore likes to number these (line item 1, line item 2,
--     etc.) for the titles within a sale; that is the
--     meaning of attribute sale_line_num
-- *   sale_line_qty is the quantity of this title being sold
--     in this sale
----------

drop table sale_line_item cascade constraints;

create table sale_line_item
(sale_num      number(8),
 sale_line_num number(2),
 sale_line_qty number(3) not null, 
 ttl_isbn      char(13)  not null, 
 constraint sale_line_item_pk primary key (sale_num, sale_line_num),
 constraint sale_line_item_fk_sale foreign key (sale_num) 
     references sale,
 constraint sale_line_item_fk_title foreign key (ttl_isbn) 
     references title
);

commit;
