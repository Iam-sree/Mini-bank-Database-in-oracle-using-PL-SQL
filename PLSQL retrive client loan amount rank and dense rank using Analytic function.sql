select * from loan;

/*retrive client loan amount rank and dense rank using Analytic function*/
declare
v_loan_id loan.loan_id%type;
v_loan_amount loan.loan_amount%type;
begin
select loan_id,rank(2000000) within group (order by loan_amount asc) a into v_loan_id,v_loan_amount
from loan
group by loan_id,loan_amount
having  loan_id ='22HDFC104';
dbms_output.put_line(v_loan_id||'       '||v_loan_amount);
select loan_id,dense_rank(160000) within group (order by loan_amount asc) a into v_loan_id,v_loan_amount
from loan
group by loan_id,loan_amount
having  loan_id ='22HDFC106';
dbms_output.put_line(v_loan_id||'       '||v_loan_amount);
end;
/
