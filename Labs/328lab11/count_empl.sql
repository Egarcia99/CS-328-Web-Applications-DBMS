/*===
    count_empl.sql

    by: Sharon Tuttle
    last modified: 2023-04-06
===*/

/*===
    function: count_empl: varchar2 -> integer

    purpose: expects an employee's last name, and returns the
        number of current employees in the empl table
        with that last name

    examples:
        if empl currently has the 14 rows from set-up-ex-tbls.sql, 
        then the following expressions (in a PL/SQL block) would be true:

        empl_count('Blake') = 1
        empl_count('Mooo') = 0

        ...and if I insert a second employee named Miller, then:

	empl_count('Miller') = 2
===*/

create or replace function count_empl(last_name varchar2) return integer is
    num_empls integer;
begin
    select count(*)
    into num_empls
    from empl
    where empl_last_name = last_name;

    return num_empls;
end;
/ 
show errors

prompt TESTING count_empl

var empl_ct number

exec :empl_ct := count_empl('Blake')

prompt I hope I now see 1:

print empl_ct

exec :empl_ct := count_empl('Moo')

prompt I hope I now see 0:

print empl_ct

commit;

insert into empl(empl_num, empl_last_name, job_title, hiredate,
                 salary, dept_num)
values
('8000', 'Miller', 'VP', sysdate, 4000.00, '500');

exec :empl_ct := count_empl('Miller')

prompt HOPE I see 2

print empl_ct

rollback;
