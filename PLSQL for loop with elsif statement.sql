select * from employee;

/*retrive employee name employee_id using for loop with elsif statement*/
declare
v1_ employee.employee_id%type;
v2_ employee.employee_name%type;
begin
for D in 1 .. 5
loop
select employee_id into v1_ from
employee where employee_id =D;
if v1_ in(1) then
select employee_name into v2_ from
employee where employee_name ='sree';
dbms_output.put_line(D||'  '||v2_);
elsif v1_ in(2) then
select employee_name into v2_ from
employee where employee_name ='rrr';
dbms_output.put_line(D||'  '||v2_);
elsif v1_ in(3) then
select employee_name into v2_ from
employee where employee_name ='sri';
dbms_output.put_line(D||'  '||v2_);
else
dbms_output.put_line('4 number have not name');
end if;
end loop;
end;
/

