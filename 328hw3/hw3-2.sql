-- CS 328 - HW 3 - Problem 2

-- Emilyo Garcia

-- 02/18/23

spool hw3-2-out.txt
prompt
prompt Emilyo Garcia 
prompt

prompt
prompt ===== Problem 2-a =====
prompt

select pub_name, PUB_CITY||', '|| PUB_STATE LOCATION
from publisher;

prompt
prompt ===== Problem 2-b =====
prompt

col ttl_price heading Price format $999.99

select ttl_price, ttl_name
from publisher p, title t
where p.pub_id = t.pub_id and 
 pub_name = 'Benjamin/Cummings';

select*
from order_line_item;

prompt
prompt ===== Problem 2-e =====
prompt

select ttl_auth_lname, ord_line_qty
from order_line_item o, title t
where o.ttl_isbn = t.ttl_isbn
order by ord_line_qty desc;

select max(ord_line_qty)
from order_line_item;

spool off