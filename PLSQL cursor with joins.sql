select * from bank;
select * from loan;
select * from account_statement;

/*create procedure and declare join function inside the procedure*/
create or replace procedure pro_join1
as
v_pan bank.pan_no%type;
v_loan_per loan.loan_percent%type;
v_loan_name loan.loan_name%type;
begin
select b.pan_no,l.loan_percent,l.loan_name
into v_pan,v_loan_per,v_loan_name
from bank b inner join loan l
on b.loan_id = l.loan_id
and b.account_no = 511345678;
dbms_output.put_line('pan_no:'|| v_pan|| chr(10) ||'     '||'loan_id:'||v_loan_per || chr(10) ||'     '||'loan name:'||v_loan_name);
end;
/
/*execute pro_join1*/
declare
begin
pro_join;
end;
/

/*create procedure and declare cursor query inside the procedure */
create or replace procedure pro_join2 (account_number number,
                                    loan_roll varchar2)
as
cursor c1 is select b.account_no,b.client_name,l.loan_id,l.loan_amount,a.debit
from loan l inner join bank b
on l.loan_id = b.loan_id
and l.loan_id = loan_roll
left outer join account_statement a
on b.account_no = a.account_no
and b.account_no = account_number;
account_no number(15);
client_name varchar2(15);
loan_id varchar2(15);
loan_amount number(10);
debit number(10);
begin
open c1;
fetch c1 into account_no,client_name,loan_id,loan_amount,debit;
dbms_output.put_line('account number:'||account_no|| chr(10)||'     '||'client name:'||client_name|| chr(10)||'     '||
'loan roll no:'||loan_id|| chr(10)||'     '||'total loan amount:'||loan_amount|| chr(10)||'     '||'today transaction:'||debit);
close c1;
end;
/

/*execute pro_join1 and pro_join2 in same query*/
declare
begin
pro_join2(account_number => 511345678,
loan_roll => '22HDFC104');
pro_join1;
end;
/