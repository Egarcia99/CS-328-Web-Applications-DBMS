set serveroutput on


create or replace function next_ord_needed_id return number is 
    curr_largest_key    number;

begin

    select max(ord_needed_id)
    into curr_largest_key
    from order_needed;

if curr_largest_key is null then  
    curr_largest_key := 0;
end if;

    return curr_largest_key + 1;

end;
/
show errors

start next_ord_needed_id_test.sql