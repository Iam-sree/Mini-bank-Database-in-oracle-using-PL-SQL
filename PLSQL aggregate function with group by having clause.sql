select * from bank;
select * from loan;
select * from account_statement;

/*retrive loan details using aggregate function with group by having clause*/
create or replace procedure pro_aggregate (loanName varchar2)
as
v_loan_percent loan.loan_percent%type;
v_loan_name loan.loan_name%type;
v_loan_amount loan.loan_amount%type;
begin
select loan_name,loan_percent,max(loan_amount)
into v_loan_name,v_loan_percent,v_loan_amount
from loan
group by loan_name,loan_percent
having loan_name =loanName
and loan_percent in (9.15,8.50,15.50);
dbms_output.put_line(v_loan_name||'     '||v_loan_amount||'     '||v_loan_percent);
end;
/

declare
begin
pro_aggregate('Home loan'); /*also other loan*/
end;
/