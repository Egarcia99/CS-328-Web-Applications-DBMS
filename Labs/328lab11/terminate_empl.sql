
/*===
    terminate_empl.sql

    by: Sharon Tuttle
    last modified: 2023-04-06
===*/

/*===
    procedure: terminate_empl: varchar2 -> void

    purpose: expects an employee's last name, and
        tries to have the side-effect of:
        *   setting to NULL the mgr field of any empl
            managed by the employee to be terminated
        *   setting to NULL the empl_rep field of
            any customer whose empl rep is the employee
            to be terminated
        *   then deleting that employee's row from empl

        It does first verify that there is only 1 employee
        with that name, and does nothing if there are none
        or more than 1

    examples:
        terminate_empl('King');

        ...deletes the empl row for King and makes all those with King as their
        manager have mgr of NULL instead of mgr of King's 7839

        terminate_empl('Moo');

        ...has no effects, since there is no empl with last name of Moo.

        terminate_empl('Blake');

        ...deletes the empl row for Blake and makes all those with Blake as their
        manager have mgr of NULL instead of mgr of Blake's 7698

        terminate_empl('Martin');

        ...deletes the empl row for Martin and makes that customer with empl_rep
        of Martin have empl_rep of NULL instead of Martin's 7654

        if insert another empl named Miller, then:

	terminate_empl('Miller');

        ...should have no effect, since will not make any changes if
        there are two empls with the given name
===*/

create or replace procedure terminate_empl(ex_empl_last_name varchar2) as
    ex_empl_num char(4);
    quant_w_name integer;
begin
    -- how many employee have this name?

    select count(*)
    into quant_w_name
    from empl
    where empl_last_name = ex_empl_last_name;

    -- only proceed if exactly one such employee

    if quant_w_name = 1 then

        -- get employee number of specified empl

        select empl_num
        into ex_empl_num
        from empl
        where empl_last_name = ex_empl_last_name;

        -- for any empl they manage, set mgr field of that empl to NULL

        update empl
        set mgr = NULL
        where mgr = ex_empl_num;

        -- for any customer they rep, set customer empl_rep field to NULL

        update customer
        set empl_rep = NULL
        where empl_rep = ex_empl_num;

        -- NOW should be safe to delete this employee

        delete from empl
        where empl_num = ex_empl_num;

    end if;
end;
/
show errors

prompt =====
prompt TESTING terminate_empl
prompt =====
prompt

commit;

prompt =====
prompt empl rows BEFORE TESTS
prompt =====

select *
from   empl
order by empl_last_name;

/*---
    deleting empl King, which should work, and who manages others
---*/

exec terminate_empl('King');

prompt =====
prompt NO MORE row for King (and no empl with mgr 7839)
prompt =====

select *
from   empl
order by empl_last_name;

/*---
    deleting empl Moo, which should have no effect, as there is no such empl
---*/

exec terminate_empl('Moo');

prompt =====
prompt NO change
prompt =====

select *
from   empl
order by empl_last_name;

/*---
    deleting empl Blake, which should work, and who manages others
---*/

exec terminate_empl('Blake');

prompt =====
prompt NO more Blake (and no empl with mgr 7698)
prompt =====

select *
from   empl
order by empl_last_name;

/*---
    deleting empl Martin, which should work, and who is an empl rep for
    a customer
---*/

exec terminate_empl('Martin')

prompt =====
prompt NO more Martin (and a customer without a rep, no longer 7654)
prompt =====

select *
from   empl
order by empl_last_name;

select *
from customer;

/*---
    adding a second empl with name Miller, the same last name
    as an existing empl, and trying to terminate empl with last
    name Miller -- should have no effect, because don't allow
    the deletion in that case
---*/

insert into empl(empl_num, empl_last_name, job_title, hiredate,
                 salary, dept_num)
values
('8000', 'Miller', 'VP', sysdate, 4000.00, '500');

exec terminate_empl('Miller')

prompt =====
prompt should see TWO rows for empls named Miller, and no other change
prompt (second Miller is a VP hired today)
prompt =====

select *
from   empl
order by empl_last_name;

rollback;

