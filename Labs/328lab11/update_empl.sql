/*===
@update_sal.sql

by: Victor Diaz and Emilyo Garcia
last modified: 2023-04-06
===*/

/*===
function: Update_salary: varchar2

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

create or replace function Update_salary(last_name varchar2, up_num number) return number is
num number;
begin

num := (up_num/100) + 1;

Update empl
set SALARY = SALARY * num
where empl_last_name = last_name;

select salary
into num
from empl
where empl_last_name = last_name;

return num;
end;
/
show errors

prompt TESTING Update_salary

var empl_ct number

exec :empl_ct := Update_salary('Blake', 30)

prompt I hope I now see 3705;

print empl_ct

rollback;
