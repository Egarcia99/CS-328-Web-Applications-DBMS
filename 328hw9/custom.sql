/*==
    By: Emilyo Garcia
    last modifed date: 04/28/2023 
==*/

create or replace procedure employee_raise(desired_name varchar2, raise_percent decimal) as

  raise_amt decimal;
   
begin  
    raise_amt := 1 + (raise_percent/100);
    if raise_amt > 1.05 then
        raise_amt := 1.05;
    
    else  
        
        update Employee
        set salary = salary * raise_amt
        where empl_fname = desired_name;

    end if;
end;
/
show errors