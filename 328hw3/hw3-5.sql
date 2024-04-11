-- CS 328 - HW 3 - Problem 5

-- Emilyo Garcia

-- 02/18/23

set serveroutput on

spool hw3-5-out.txt

prompt
prompt Emilyo Garcia 
prompt

prompt
prompt ===== Problem 5 =====
prompt

prompt
prompt ===== Problem 5 part a =====
prompt

select count(*)
from order_needed;

prompt
prompt ===== Problem 5 part b =====
prompt

select max(ord_needed_id)
from order_needed;

prompt
prompt ===== Problem 5 part c =====
prompt

create or replace function next_ord_needed_id
    return number
is
   next_id   number;

begin

   select max(ord_needed_id)
     into next_id
     from order_needed; 


   if next_id is NULL then
      return 1; 
   else
      return next_id + 1;
   end if;
end;
/
show errors

spool off