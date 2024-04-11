-- Emilyo Garcia 
-- CS 328 - Homework 5 - Problem 4
-- LMD: 03/24/2023

set serveroutput on

spool 328hw5-out.txt

prompt
prompt Emilyo Garcia 
prompt

prompt 
prompt ===== Problem 4 part a =====
prompt 

create or replace function bool_to_string(value boolean)
    return varchar2 as

begin

    if (value = true) then
        return 'TRUE';
    else
        return 'FALSE';
    end if;

end;

/
show errors 
start bool_to_string_test.sql

prompt 
prompt ===== Problem 4 part b =====
prompt

insert into order_stock values (999959, 147, '22-DEC-23', NULL);
insert into order_line_item values(999959, 2, 9780133760064, 50);
insert into order_line_item values(999959, 1, 9780805343021, 113);

prompt
prompt You should now see two titles on order in titles_on_order
prompt

select * from titles_on_order;


prompt 
prompt ===== Problem 5 part c =====
prompt

create or replace function is_on_order(ISBN_input CHAR)
    return boolean as
    is_on_order number;

begin
    select count(ttl_isbn)
        into is_on_order
        from titles_on_order
        where ttl_isbn = ISBN_input;
    
    if is_on_order > 0 then
        return true;
    else
        return false;
    end if;

    end;
    /
    show errors

    prompt 
    prompt ===== Testing bool_to_string(is_on_order for ISBN('9780805343021')) should return True
    prompt 

    var on_order_status varchar2(5)
    exec :on_order_status := bool_to_string(is_on_order('9780805343021'))
    print on_order_status

    prompt 
    prompt ===== Testing bool_to_string(is_on_order for ISBN('9780070464555')) should return false
    prompt 

    var on_order_status varchar2(5)
    exec :on_order_status := bool_to_string(is_on_order('9780070464555'))
    print on_order_status

    prompt 
    prompt ===== Testing bool_to_string(is_on_order for ISBN('9780201144710')) should return false
    prompt 

    var on_order_status varchar2(5)
    exec :on_order_status := bool_to_string(is_on_order('9780201144710'))
    print on_order_status

    rollback;

spool off