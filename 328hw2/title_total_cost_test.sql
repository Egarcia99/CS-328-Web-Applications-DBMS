
/*=====
  testing script for function title_total_cost

  by: Sharon Tuttle
  last modified: 2023-01-30
=====*/

prompt
prompt *************************
prompt TESTING title_total_cost
prompt *************************
prompt

set serveroutput on

prompt ===================
prompt test passes if it shows that ISBN 9780871507877 has
prompt a total cost of 1137.5:
prompt ===================

var tt_cost number;
exec :tt_cost := title_total_cost('9780871507877') 
print tt_cost

prompt ===================
prompt test passes if it shows that ISBN 9780871502445 has
prompt a total cost of 79.5
prompt ===================

exec :tt_cost := title_total_cost('9780871502445')
print tt_cost

prompt ===================
prompt test passes if it shows that non-existent ISBN
prompt 1313131313131 has a total cost of -1
prompt ===================

exec :tt_cost := title_total_cost('1313131313131')
print tt_cost

prompt

-- end of title_total_cost_test.sql
