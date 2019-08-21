select name, state, invoice_status state from sale_order where id in (146)
% state = sale, done, sent, draft, cancel
% update sale_order set invoice_status='invoiced', state='done' where id in (146)

select name, project_id, account_analytic_tag_id from sale_order where id in (4835)
% update sale_order set project_id=4 where id in (4831, 4829, 4822, 4821, 4820, 4819, 4818, 4817, 4812)      sets cuu=4   so05412
% update sale_order set project_id=5 where id in (4838,4839,4840)      sets cjs=5 
% update sale_order set project_id=9 where id in (4790)      sets gdl=9 

