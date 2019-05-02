select * from account_invoice where id in (18209)
select * from account_invoice_line where invoice_id in (32272,32276)
select * from account_move where id=124623
select * from account_move_line where move_id=124623

% update origin at the invoice:
update account_invoice set origin='SO04226' where id = 29183
update account_invoice_line set origin='SO04226' where invoice_id=29183
% update origin at the PO:
select * from purchase_order where id=9033
select * from purchase_order_line where order_id=9033
update purchase_order set origin='SO04300:WH: Stock -> Customers MTO' where id=9062 

% update account_analytic at the invoice header:
% Services:  CUU-4, GDL-9, CJS-5
select * from account_invoice where id=18209
update account_invoice set account_analytic_id=5 where id=18209

% update account_analytic at the invoice_line:
% Services:  CUU-4, GDL-9, CJS-5
select * from account_invoice_line where invoice_id=31560
update account_invoice_line set account_analytic_id=4 where invoice_id=31560

% update origin at the purchase order:
select * from purchase_order where id in (9809,9808)
update purchase_order set origin='SO04510' where id in (9809,9808)

% add account tag to all invoice and move lines:  
% account_tag 3=B:IDN, 4=B:IFI
insert into account_analytic_tag_account_invoice_line_rel (account_invoice_line_id, account_analytic_tag_id)
   select id, 4 from account_invoice_line where invoice_id in (32272,32276)
% add account tag to all move lines:  
insert into account_analytic_tag_account_move_line_rel (account_move_line_id, account_analytic_tag_id)
   select id, 4 from account_move_line where move_id in (134923,134924)
   
% change analytic_account to an invoice and all docs
% account_analytic_id 4=CUU; 5=CJS
select name, number, partner_id from account_invoice where  id in (31871,31869,28350,28055,27833,23839)
select id from account_invoice_line where invoice_id in (31871,31869,28350,28055,27833,23839)
update account_invoice set account_analytic_id=4 where id in (28054);
update account_invoice_line set account_analytic_id=4 where invoice_id in (28054)



%References
BEGIN;
UPDATE accounts SET balance = balance - 100.00
    WHERE name = 'Alice';
SAVEPOINT my_savepoint;
UPDATE accounts SET balance = balance + 100.00
    WHERE name = 'Bob';
-- oops ... forget that and use Wally's account
ROLLBACK TO my_savepoint;
UPDATE accounts SET balance = balance + 100.00
    WHERE name = 'Wally';
COMMIT;