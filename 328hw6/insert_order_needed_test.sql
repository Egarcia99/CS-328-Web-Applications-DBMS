
/*=====
    testing script for function insert_order_needed

    note: also calls:
        *   next_ord_needed_id from CS 328 - Homework 3 - Problem 5 part c

    by: Sharon Tuttle
    last modified: 2023-03-26
=====*/

set serveroutput on

prompt
prompt *********************************
prompt TESTING insert_order_needed
prompt *********************************
prompt

commit;

prompt =============================================================
prompt test 1: SUCCESSFUL insert into order_needed
prompt (no existing order_needed for this title)
prompt =============================================================
prompt

update title
set    ttl_qty = ttl_qty - 5
where  ttl_isbn = '9780201122305';

var result_str varchar2(20)
exec :result_str := insert_order_needed('9780201122305', 50)

prompt
prompt =============================================================
prompt test 1 passes if (part 1 of 2):
prompt
prompt     the insert_order_needed call returns 'success'
prompt =============================================================
prompt

print result_str

prompt
prompt =============================================================
prompt test 1 passes if (part 2 of 2):
prompt
prompt     there is now an order_needed row 
prompt     with ord_needed_id of 1011, for 9780201122305, 
prompt     for 50 copies, with date_created of today, 
prompt     and ord_num that is empty/null
prompt =============================================================
prompt

select *
from   order_needed
where  ttl_isbn = '9780201122305';

prompt =============================================================
prompt test 2: SUCCESSFUL insert into order_needed
prompt (existing order_needed rows for this title that are NOT pending)
prompt =============================================================
prompt

/* inserting some more handled-order-needed-related rows */

-- first order set of rows

insert into order_stock
values
(11015, 147, sysdate-180, sysdate-165);

insert into order_line_item
values
(11015, 1, '9780805343021', 10);

insert into order_needed
values
(next_ord_needed_id(), '9780805343021', 10, sysdate-188, 11015);

insert into order_receipt
values
(20020, 11015, 1, 10, sysdate-165);

-- second order set of rows

insert into order_stock
values
(11016, 147, sysdate-280, sysdate-265);

insert into order_line_item
values
(11016, 1, '9780805343021', 5);

insert into order_needed
values
(next_ord_needed_id(), '9780805343021', 5, sysdate-288, 11016);

insert into order_receipt
values
(20021, 11016, 1, 5, sysdate-265);

/* so, should be able to add a NEW order_needed for this title */

exec :result_str := insert_order_needed('9780805343021', 5)

prompt =============================================================
prompt test 2 passes if (part 1 of 2):
prompt
prompt     the insert_order_needed call returns 'success'
prompt =============================================================

print result_str

prompt =============================================================
prompt test 2 passes if (part 2 of 2):
prompt
prompt     there are now FOUR order_needed rows for 9780805343021,
prompt     THREE completed, and the "new" row, with ord_needed_id of 1014, 
prompt     for 5 copies, with date_created of today, 
prompt     and ord_num that is empty/null
prompt =============================================================

select *
from   order_needed
where  ttl_isbn = '9780805343021';

prompt =============================================================
prompt test 3: UNSUCCESSFUL insert into order_needed 
prompt (title already has PENDING order_needed row)
prompt =============================================================

/*===== 
    just successfully added order_needed row for 9780805343021, right?
    ...so should not add another!
=====*/

exec :result_str := insert_order_needed('9780805343021', 10)

prompt =============================================================
prompt test 3 passes if (part 1 of 2):
prompt
prompt     the insert_order_needed call returns 'already known needed'
prompt =============================================================

print result_str

prompt =============================================================
prompt test 3 passes if (part 2 of 2):
prompt
prompt     there is still ONLY FOUR order_needed rows for 9780805343021,
prompt     with last having ord_needed_id of 1014, 
prompt     for 5 copies, with date_created of today, 
prompt     and ord_num that is empty/null
prompt =============================================================

select *
from   order_needed
where  ttl_isbn = '9780805343021';


prompt =============================================================
prompt test 4: UNSUCCESSFUL insert into order_needed 
prompt (no pending order_needed, but title already on order and not yet
prompt received)
prompt =============================================================

/*=====
    so, now insert a new order for pending-order-needed 9780201122305
=====*/

insert into order_stock(ord_num, pub_id, ord_date_placed)
values
(11017, 147, sysdate);

insert into order_line_item
values
(11017, 1, '9780201122305', 50);

update order_needed
set ord_num = 11017
where ttl_isbn = '9780201122305'
      and ord_num is null;

exec :result_str := insert_order_needed('9780201122305', 50)

prompt =============================================================
prompt test 4 passes if (part 1 of 2):
prompt
prompt     the insert_order_needed call returns 'already on order'
prompt =============================================================

print result_str

prompt =============================================================
prompt test 4 passes if (part 2 of 2):
prompt
prompt     there is only one order_needed row 
prompt     with ord_needed_id of 1011, for 9780201122305, 
prompt     for 50 copies, with date_created of today, 
prompt     and ord_num that is 11017
prompt =============================================================

select *
from   order_needed
where  ttl_isbn = '9780201122305';

prompt =============================================================
prompt test 5: UNSUCCESSFUL insert into order_needed 
prompt (for a non-existent title 1111111111111)
prompt =============================================================

exec :result_str := insert_order_needed('1111111111111', 11)

prompt =============================================================
prompt test 5 passes if (part 1 of 2):
prompt
prompt     the insert_order_needed call returns 'insertion failed'
prompt =============================================================

print result_str

prompt =============================================================
prompt test 5 passes if (part 2 of 2):
prompt
prompt     there NO order_needed row for title 1111111111111
prompt =============================================================

select *
from   order_needed
where  ttl_isbn = '1111111111111';

prompt undoing temporary testing changes

rollback;
 
-- end of insert_order_needed_test.sql
