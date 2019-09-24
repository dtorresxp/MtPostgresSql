1-
select ai.origin, aat.name, aaa.name, ai.move_name, ai.amount_total_company_signed
from account_invoice ai
left join account_analytic_account aaa on aaa.id=ai.account_analytic_id
left join account_analytic_tag aat on aat.id=ai.account_analytic_tag_id
where  ai.company_id=1 and
   ai.date > '2019-01-01' and ai.account_analytic_id <> 4 and 
   ai.account_analytic_tag_id in (
      select distinct account_analytic_tag_id from sale_order where project_id=4 and account_analytic_tag_id<>29)
 order by ai.amount_total_company_signed, ai.origin, aat.name, aaa.name, ai.move_name 

analytic_tag_id=29= NoDefinido
account_analytic_tag_id=4= CUU

2-
select ai.origin, aat.name, aaa.name, ai.move_name, ai.amount_total_company_signed
from account_invoice ai
left join account_analytic_account aaa on aaa.id=ai.account_analytic_id
left join account_analytic_tag aat on aat.id=ai.account_analytic_tag_id
where  ai.company_id=1 and
   ai.date > '2019-01-01' and ai.account_analytic_id <> 4 and ai.account_analytic_tag_id=29
 order by ai.amount_total_company_signed, ai.origin, aat.name, aaa.name, ai.move_name 

2a-
select ai.origin, aat.name, aaa.name as invanalytic, ai.move_name, ai.amount_total_company_signed, aaa2.name as soanalytic
from account_invoice ai
left join account_analytic_account aaa on aaa.id=ai.account_analytic_id
left join account_analytic_tag aat on aat.id=ai.account_analytic_tag_id
left join sale_order so on so.name=ai.origin
left join account_analytic_account aaa2 on aaa2.id=so.project_id
where ai.company_id=1 and
   ai.date > '2019-01-01' and ai.account_analytic_id <> 4 and ai.account_analytic_tag_id=29 and 
   left(ai.origin,2)='SO'
 order by ai.amount_total_company_signed, ai.origin, aat.name, aaa.name, ai.move_name 
 
2b-
select ai.origin, aat.name, aaa.name as invanalytic, ai.move_name, ai.amount_total_company_signed, aaa2.name as poanalytic
from account_invoice ai
left join account_analytic_account aaa on aaa.id=ai.account_analytic_id
left join account_analytic_tag aat on aat.id=ai.account_analytic_tag_id
left join purchase_order po on po.name=ai.origin
left join account_analytic_account aaa2 on aaa2.id=po.account_analytic_id
where ai.company_id=1 and
   ai.date > '2019-01-01' and ai.account_analytic_id <> 4 and ai.account_analytic_tag_id=29 and 
   left(ai.origin,2)='PO'
 order by ai.amount_total_company_signed, ai.origin, aat.name, aaa.name, ai.move_name 

2c-
select ai.origin, aat.name, aaa.name as invanalytic, ai.move_name, ai.amount_total_company_signed , ai2.move_name, aaa2.name
from account_invoice ai
left join account_analytic_account aaa on aaa.id=ai.account_analytic_id
left join account_analytic_tag aat on aat.id=ai.account_analytic_tag_id
left join account_invoice ai2 on ai2.move_name=ai.origin
left join account_analytic_account aaa2 on aaa2.id=ai2.account_analytic_id
where ai.company_id=1 and
   ai.date > '2019-01-01' and ai.account_analytic_id <> 4 and 
   left(ai.origin,2) not in ('PO','SO')
 order by ai.amount_total_company_signed, ai.origin, aat.name, aaa.name, ai.move_name 

 