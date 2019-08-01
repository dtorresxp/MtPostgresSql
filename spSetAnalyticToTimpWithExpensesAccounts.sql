select aml.ref, aa.code, aa.name, ampb.business, ampb.business_id
from account_move_line aml
join account_account aa on aa.id=aml.account_id
join public."vAccountMove_ProjBuss" ampb on ampb.am_name=aml.ref
where aml.company_id=1 and aml.journal_id=77 and aml.date between '2019-07-01' and '2019-07-31' and
   left(aa.code,6)='601.83' and aml.analytic_account_id is null

   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx




