-- Emilyo Garcia and Victor Diaz

-- CS 328

-- 02/06/23

-- Resubmitted because other file was deleted in nrsprojects meltdown

set serveroutput on

spool lab2-out.txt

prompt Emilyo Garcia and Victor Diaz
prompt
prompt ===== Problem 1 =====
prompt

create or replace procedure total_salary(title varchar2) as

	salary_sum number;


begin
	select sum(salary)
	into salary_sum
	from empl
	where job_title = title;
	
	dbms_output.put_line('Total salary for ' || title || ' is '|| salary_sum  );

end;
/
show errors

prompt
prompt ===== Testing total_salary ======
prompt

exec total_salary('Sales')

prompt
prompt ===== Problem 2 =====
prompt

create or replace function num_pd_more(lower_s number) return number as
	total number;

begin
	select count(*)
	into total
	from empl
	where salary > lower_s;

	return total;

end;
/
show errors

prompt
prompt ===== Testing Lower_s =====
prompt

var my_quant number

exec :my_quant := num_pd_more(4000)

prompt
prompt ===== expecting 1 =====
prompt

print my_quant

prompt
prompt ===== Testing Lower_s 2 =====
prompt

var my_quant number

exec :my_quant := num_pd_more(1250)

prompt
prompt ===== expecting 9 =====
prompt

print my_quant

prompt
prompt ===== Problem 3 =====
prompt

drop table dept_changes;
create table dept_changes
(change_date date, 
 prev_dept_name varchar2(15),
 next_dept_name varchar2(15),
 primary key (change_date, prev_dept_name, next_dept_name)
);

create or replace trigger log_dept_updates
	before update
	on dept
	for each row

begin
	insert into dept_changes values(sysdate, :old.dept_name, :new.dept_name);
end;
/
show errors

prompt ===== testing trigger log_dept_updates =====
prompt
prompt ===== hoping to see 1 =====

commit;

update dept
set dept_name = 'depts';

select *
from dept;

select *
from dept_changes;

rollback;

prompt ===== testing trigger log_dept_updates2 =====
prompt
prompt ===== hoping to see depts as new title =====

commit;

update dept 
set dept_name = 'depts2';

select *
from dept;

select *
from dept_changes;

rollback;

spool off