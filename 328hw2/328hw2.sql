-- CS 328 

-- Homework 2

-- Problems 1-3

-- 02/06/2023

set serveroutput on

spool 328hw2-out.txt

prompt ===== Emilyo Garcia ======
prompt
prompt ===== Problem 1 =====

create or replace procedure silly_shout(shout_message varchar2, shout_times number) as

        counter integer;

 begin
        counter := 0;

        while counter < shout_times
        loop
        dbms_output.put_line(upper(shout_message) || '!! ');
        counter := counter +1;
        end loop;
end;
/
show errors


prompt ===== Testing Problem 1a =====

exec silly_shout('heyy',9)

prompt ===== expecting 9 =====

prompt ===== Testing Problem 1b =====

exec silly_shout('yo', 5)

prompt ===== expecting 5 =====
prompt
prompt
prompt ===== Problem 2 =====

create or replace function title_total_cost(title_isbn char)
        return number as 

        book_cost number (7,2);
        book_qty  integer;

begin
        select count(*)
        into book_qty
        from title
        where ttl_isbn = title_isbn;

        if book_qty = 0 then
        return -1;

        else
                select ttl_cost * ttl_qty
                into book_cost
                from title
                where ttl_isbn = title_isbn;
        end if;
        return book_cost;
end;
/
show errors

prompt ===== Testing Problem 2a =====

var totalbook_cost number;
exec :totalbook_cost := title_total_cost('9780871507877')
print totalbook_cost

prompt Test passes if it shows ISBN 9780871507877 has
prompt
prompt ===== a total cost of 1137.5 =====

prompt
prompt ===== Testing Problem 2b =====

var totalbook_cost number;
exec :totalbook_cost := title_total_cost('9780871502445')
print totalbook_cost

prompt Test passes if it shows ISBN 9780871502445 has
prompt
prompt ===== a total cost of 79.5 =====

prompt
prompt ===== Testing Problem 2c =====

var totalbook_cost number;
exec :totalbook_cost := title_total_cost('1313131313131')
print totalbook_cost

prompt Test passes if it shows ISBN 1313131313131 has
prompt
prompt ===== returns -1 =====


prompt
prompt ===== Problem 3 =====
prompt

drop table salary_history;

create table salary_history
(empl_num       char(4),
 prev_salary    number(6,2),
 next_salary    number(6,2),
 change_date    date,
 primary key (empl_num, change_date),
 foreign key (empl_num) references empl
);

create or replace trigger log_salary_updates
        after update
        on empl
        for each row

declare

        old_salary      number(6,2);
        new_salary      number(6,2);
        new_empl_num    char(4);

begin

        old_salary   := :old.salary;
        new_salary   := :new.salary;
        new_empl_num := :new.empl_num;

        if (old_salary != new_salary) then
        insert into salary_history
        values
        (new_empl_num, old_salary, new_salary, sysdate);
        end if;
end;
/
show errors

prompt
prompt Testing Trigger log_salary_updates
prompt

commit;
select * from empl;
select * from salary_history;

update empl
set salary = '7500.00'
where empl_last_name = 'King';

update empl
set salary = '5975.00'
where empl_last_name = 'Jones';

update empl
set job_title = 'Clerk'
where empl_last_name = 'King';

select * from empl;
select * from salary_history;

rollback;

spool off