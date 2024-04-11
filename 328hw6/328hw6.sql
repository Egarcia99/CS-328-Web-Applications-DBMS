-- Emilyo Garcia 
-- CS 328 - Homework 6 - Problem 2
-- LMD: 03/24/2023

set serveroutput on

spool 328hw6-out.txt

prompt
prompt Emilyo Garcia 
prompt

prompt 
prompt ===== Problem 6 part a =====
prompt 

create or replace function pending_order_needed( val char) return boolean is
qtn number;

    begin  
        select count(*)
        into qtn
        from order_needed
        where ttl_isbn = val and ord_num is NULL;


    if qtn > 0 then 
        return TRUE;

    else 
        return FALSE;
    end if;
    end;
    /
    show errors

prompt 
prompt ===== Problem 6 part b =====
prompt 

create or replace function insert_order_needed (val char, quant number) return char is 
qtn number;

begin

    if is_on_order(val) then
        return 'already in order';
    elsif pending_order_needed(val) then
        return 'already known needed';
else 
    insert into order_needed(ord_needed_id, ttl_isbn, qty_desired, date_need_noted) values (next_ord_needed_id(), val, quant, sysdate);
    return 'success';
end if;

exception

when OTHERS then
return 'insertion failed';

end;
/
show errors

start insert_order_needed_test.sql
spool off