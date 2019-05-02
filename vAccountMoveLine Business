create view public.x_aml_business as
select 20190314 as create_date, 1 as create_uid, aml.name as display_name, aml.id, 20190314 as __last_update, 
   20190314 as write_date, 1 as write_uid, aml.company_id as x_company_id, aml.account_id as x_account_id, 
   aml.analytic_account_id as x_analytic_account_id, aat.id as x_tagid, aat.name as x_tagname, 
   aml.date as x_date, aml.credit as x_credit, aml.debit as x_debit
from account_move_line aml
left join account_analytic_tag_account_move_line_rel aataml on aml.id=aataml.account_move_line_id
join account_analytic_tag aat on aataml.account_analytic_tag_id=aat.id
where left(aat.name,2)='B:'




aml.id, aml.company_id, aml.account_id, aml.analytic_account_id, aat.id as tagid, aat.name as tagname, aml.name, aml.date, aml.credit, aml.debit 
from account_move_line aml
left join account_analytic_tag_account_move_line_rel aataml on aml.id=aataml.account_move_line_id
join account_analytic_tag aat on aataml.account_analytic_tag_id=aat.id
where left(aat.name,2)='B:'

create view public.x_test as
select 20190314 as create_date, 1 as create_uid, aml.name as display_name, aml.id, 20190314 as __last_update, 
   20190314 as write_date, 1 as write_uid, aml.name as x_name
from account_move_line aml
left join account_analytic_tag_account_move_line_rel aataml on aml.id=aataml.account_move_line_id
join account_analytic_tag aat on aataml.account_analytic_tag_id=aat.id
where left(aat.name,2)='B:'
