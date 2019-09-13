select ai.origin, aat.name, aaa.name, ai.move_name 
from account_invoice ai
left join account_analytic_account aaa on aaa.id=ai.account_analytic_id
left join account_analytic_tag aat on aat.id=ai.account_analytic_tag_id
where 
   ai.date > '2019-01-01' and ai.account_analytic_id <> 4 and 
   ai.account_analytic_tag_id in (
      select distinct account_analytic_tag_id from sale_order where project_id=4 )
 order by ai.origin, aat.name, aaa.name, ai.move_name 
