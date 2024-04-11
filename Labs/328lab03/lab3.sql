/*=====
    CS 328 - Week 3 Lab Exercise - Problem 1
    last modified: 2023-02-02
=====*/

/*=====
  Emilyo Garcia
=====*/

set serveroutput on
spool lab3-out.txt

prompt
prompt =========
prompt CS 328 - Week 3 Lab Exercise - Problem 1
prompt Emilyo Garcia
prompt =========

/*=====
   signature: function: get_manager: varchar2 -> varchar2
   purpose: expects an employee's last name, and tries to
       return the last name of that employee's manager.
       IF there is no employee with that name, it returns
           'Not an employee';
       IF there is more than one employee with that last name,
           it returns 'Name not unique'
       IF the employee has no manager, it returns 'No manager'
=====*/

create or replace function get_manager(empl_name varchar2) 
    return varchar2 as

    manager_num  empl.empl_num%type;
    manager_name empl.empl_last_name%type;

begin
    -- try to ask for name of manager of an employee with this name

    select mgr
    into   manager_num
    from   empl
    where  empl_last_name = empl_name;

    -- now determine the name (or desired alternate response)
    --    for this manager

    if (manager_num is null) then
        manager_name := 'No manager';
    else
        select empl_last_name
        into   manager_name
        from   empl
        where  empl_num = manager_num;
    end if;

    return manager_name;

exception
    when no_data_found then
        manager_name := 'Not an employee';
        return manager_name;

    when too_many_rows then
        manager_name := 'Name Not Unique';
        return manager_name;

end;
/
show errors

/*=====
    TESTING get_manager
=====*/

/* save the state of the database BEFORE these tests */

commit; 

/*=====
   inserting another employee who happens to have the
       same name as an existing employee
=====*/

insert into empl
values
('8001', 'Jones', 'Salesman', '7698', sysdate, 1000, 0, '300');

prompt ==========
prompt calling show_manager: Ward should have Blake as a manager:
prompt ==========

var manager_string varchar2(20)
exec :manager_string := get_manager('Ward')
print manager_string

prompt ==========
prompt calling show_manager: Raimi should have King as a manager:
prompt ==========

exec :manager_string := get_manager('Raimi')
print manager_string

prompt ==========
prompt calling show_manager: King should have No manager
prompt ==========

exec :manager_string := get_manager('King')
print manager_string

prompt ==========
prompt calling show_manager: Wilbon should be Not an employee
prompt ==========

exec :manager_string := get_manager('Wilbon')
print manager_string

prompt ==========
prompt calling show_manager: Jones has Name not unique
prompt ==========

exec :manager_string := get_manager('Jones')
print manager_string

/* restore the database state after these tests */

rollback; 

spool off
  
-- end of lab3.sql
