
/*=====
    drop and create a view titles_on_order,
 
    with a row for each title currently on order (ordered within a 
    not-yet-complete order_stock instance),

    with three attributes:
    *   ttl_isbn, the title's ISBN
    *   pending_ord_num, the order_stock instance's ord_num for 
        this title's pending order
    *   qty_awaiting, the quantity of this title ordered but not 
        yet received

    by: Sharon Tuttle
    last modified: 2020-02-09
=====*/

drop view titles_on_order;

create view titles_on_order as
    (select t.ttl_isbn, o.ord_num pending_ord_num, 
           (ord_line_qty - sum(qty_rcvd)) qty_awaiting 
     from title t, order_stock o, order_line_item ol, order_receipt orcpt
     where t.ttl_isbn = ol.ttl_isbn
           and ol.ord_num = o.ord_num
           and ord_date_complete is NULL
           and orcpt.ord_num = ol.ord_num
           and orcpt.ord_line_num = ol.ord_line_num
     group by t.ttl_isbn, o.ord_num, ord_line_qty
     having   (ord_line_qty - sum(qty_rcvd)) > 0)
     union
     (select t.ttl_isbn, o.ord_num pending_ord_num,
             ord_line_qty qty_awaiting
      from   title t, order_stock o, order_line_item ol
      where  t.ttl_isbn = ol.ttl_isbn
             and ol.ord_num = o.ord_num
             and ord_date_complete is NULL
             and NOT EXISTS
                 (select 'a'
                  from   order_receipt orcpt
                  where  orcpt.ord_num = ol.ord_num
                         and orcpt.ord_line_num = ol.ord_line_num));

