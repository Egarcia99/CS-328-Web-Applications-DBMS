/*===
	hello.sql

	By: Emilyo Garcia
	Last Modified: 2023-01-20

===*/

/*===

	procedure: hello_world: void -> void
	purpose: expects nothing, returns nothing, and has the		
	    side effects of (IF serveroutput is on) printing to
	    the screen a cheery greeting and the current date

	    examples:
		if it is currently january 20, 2023, and in SQL/PLUS you run:

		exec hello_world()
		
	    and serveroutput is on, you should see printed to the screen:
Whats Popping! on 20-JAN-23

       if you run:

       exec hello_world
Whats Popping! on 20-JAN_23

===*/

create or replace procedure hello_world as 
       /* oddly, you CANNOT put the word DECLARE
       before a procedure's local variable declarations ! */

       curr_date date;

begin
	select sysdate
	into curr_date
	from dual;
	
	dbms_output.put_line('Whats Popping! on ' || curr_date);
end;
/
show errors

/* TESTING! */

set serveroutput on

prompt testing hello_world, should see Whats Popping! on the current date

exec hello_world
