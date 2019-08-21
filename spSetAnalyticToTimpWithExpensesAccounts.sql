select aml.ref, aa.code, aa.name, aml.analytic_account_id
from account_move_line aml
join account_account aa on aa.id=aml.account_id
join account_move am on am.id=aml.move_id
join account_invoice ai on ai.move_id=am.id
where aml.company_id=1 and aml.journal_id=77 and aml.date between '2019-07-01' and '2019-07-31' and
   left(aa.code,6)='601.83' and aml.analytic_account_id is null

   xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
   aml.journal_id=77 = TIMP

   from account_move_line aml
left join account_move_line_account_tax_rel amlat on aml.id=amlat.account_move_line_id
join account_move am on am.id=aml.move_id
join account_invoice ai on ai.number=am.name
join account_account aa on aa.id=aml.account_id
left join res_partner p on aml.partner_id=p.id
left join res_partner pp on pp.id=p.commercial_partner_id
left join account_tax atl on atl.id=aml.tax_line_id
left join account_tax ati on ati.id=amlat.account_tax_id




