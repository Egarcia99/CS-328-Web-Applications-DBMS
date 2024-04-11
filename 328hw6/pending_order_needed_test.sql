
/*=====
    testing script for function pending_order_needed

    note: calls:
        *   function next_ord_needed_id from CS 328 - Homework 3 - Problem 5 part c
        *   function bool_to_string from CS 328 - Homework 5 - Problem 4 part a

  by: Sharon Tuttle
  last modified: 2023-03-26
=====*/

set serveroutput on

prompt
prompt **********************
prompt TESTING pending_order_needed
prompt **********************

commit;

update title
set ttl_qty = ttl_qty - 5
where ttl_isbn = '9780201122305';

insert into order_needed(ord_needed_id, ttl_isbn, qty_desired, date_need_noted)
values
(next_ord_needed_id(), '9780201122305', 50, '15-Feb-2023');

prompt =============================================================
prompt test passes if returns TRUE (IS a pending order_needed for
prompt     9780201122305)
prompt =============================================================

var status_str varchar2(5);
exec :status_str := bool_to_string(pending_order_needed('9780201122305'))
print status_str

prompt =============================================================
prompt test passes if returns FALSE (order_needed row for
prompt     9780805343021 is NOT pending)
prompt =============================================================

exec :status_str := bool_to_string(pending_order_needed('9780805343021'))
print status_str

prompt =============================================================
prompt test passes if returns FALSE (9780131103627 is a title,
prompt     but is not in order_needed table at all, so cannot
prompt     be pending)
prompt =============================================================

exec :status_str := bool_to_string(pending_order_needed('9780131103627'))
print status_str

prompt =============================================================
prompt test passes if returns FALSE (1111111111111 is NOT a title,
prompt     so cannot be pending)
prompt =============================================================

exec :status_str := bool_to_string(pending_order_needed('111111111111'))
print status_str

prompt ========
prompt does it work for titles that have MULTIPLE previously-filled
prompt orders needed? 
prompt ========

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

prompt ========
prompt 9780805343021 now has 3 prior handled orders-needed,
prompt but none are pending;
prompt pending_order_needed test passes IF returns FALSE:
prompt ========

exec :status_str := bool_to_string(pending_order_needed('9780805343021'))
print status_str

/* now inserting a NOT-yet-ordered order needed for 9780805343021 */

insert into order_needed(ord_needed_id, ttl_isbn,  qty_desired, date_need_noted)
values
(next_ord_needed_id(), '9780805343021', 3, sysdate);

prompt ========
prompt 9780805343021 NOW has a pending order_needed in addition to
prompt its 3 prior handled orders-needed;
prompt pending_order_needed test passes IF now returns TRUE:
prompt ========

exec :status_str := bool_to_string(pending_order_needed('9780805343021'))
print status_str

prompt undoing temporary testing changes

rollback;

-- end of pending_order_needed_test.sql
