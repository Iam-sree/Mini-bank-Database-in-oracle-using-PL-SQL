select * from loan;

/*retrive overall bank account statement in 3 database table using for loop with pesudo column*/
declare
v_account_no bank.account_no%type;
v_loan_id loan.loan_id%type;
v_loan_name loan.loan_name%type;
v_loan_amount loan.loan_amount%type;
v_debit account_statement.debit%type;
begin
for C in 1 .. 6
loop
select account_no,loan_id,loan_name,loan_amount,debit 
into v_account_no,v_loan_id,v_loan_name,v_loan_amount,v_debit
from (select rownum rownu1,loan_id,loan_name,loan_amount from loan),
(select rownum rownu2,debit from account_statement),
(select rownum rownu3,account_no from bank)
where rownu1 = c
and rownu2= C
and rownu3 = C;
dbms_output.put_line(v_account_no||'     '||v_loan_id||'    '||v_loan_name||'    '||v_loan_amount||'    '||v_debit);
end loop;
end;
/