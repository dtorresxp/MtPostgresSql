select sum(amount)-sum(round(amount,2)) as difference from account_move where amount<>round(amount,2);
select sum(credit-debit) from account_move_line;
select left(aa.code,3), sum(aml.balance) from account_move_line aml 
   join account_account aa on aa.id=aml.account_id
   where aml.company_id=1 and date between '2021-01-01' and '2021-03-31'
   group by left(aa.code,3)
   order by left(aa.code,3);
select sum(aml.balance) from account_move_line aml 
   join account_account aa on aa.id=aml.account_id
   where aml.company_id=1;
select sum(aml.credit) as credit, sum(aml.debit) as debit, sum(aml.balance) as balance from account_move_line aml 
   join account_account aa on aa.id=aml.account_id 
   where aml.company_id=1 and date between '2021-03-01' and '2021-03-31';
select am.name, am.date, aml.credit, aml.debit, aml.balance 
   from account_move_line aml 
   join account_account aa on aa.id=aml.account_id 
   join account_move am    on am.id=aml.move_id
   where aml.company_id=1 and aml.date between '2020-01-01' and '2020-12-31' and aml.balance<>round(aml.balance,2)
   order by aml.date;
; moves to review:   
select am.name, am.date, sum(aml.credit) as credit, sum(aml.debit) as debit, sum(aml.balance) as balance, sum(aml.credit-aml.debit) as balancecalculated
   from account_move_line aml 
   join account_account aa on aa.id=aml.account_id 
   join account_move am    on am.id=aml.move_id
   where aml.company_id=1 
   group by am.name, am.date
   having sum(aml.credit-aml.debit)<>0 
   order by am.date;
select am.name, am.date, aa.code, aa.name, aml.credit, aml.debit, aml.balance, aml.credit-aml.debit as balancecalculated
   from account_move_line aml 
   join account_account aa on aa.id=aml.account_id 
   join account_move am    on am.id=aml.move_id
   where aml.company_id=1 and am.name='A02333' ;
select am.name, am.date, aa.code, aa.name, aml.credit, aml.debit, aml.balance, aml.credit-aml.debit as balancecalculated
   from account_move_line aml 
   join account_account aa on aa.id=aml.account_id 
   join account_move am    on am.id=aml.move_id
   where aml.company_id=1 and aa.code='105.02.01' ;


update account_move_line set balance=round(balance,2) where balance<>round(balance,2);
update account_move_line set credit=round(credit,2)   where credit <>round(credit,2);
update account_move_line set debit=round(debit,2)     where debit  <>round(debit,2);
commit;
; update account_move_line set debit=28.28 where id=986753;


select * from account_move_line where id=9887
select * from account_account where id=100;
