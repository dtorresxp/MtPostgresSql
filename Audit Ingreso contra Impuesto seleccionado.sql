select c.name, ai.number, ai.date_invoice, aa.code, aa.name, at.name
from account_invoice ai
join account_invoice_line ail on ail.invoice_id=ai.id
left join account_invoice_line_tax ailt on ailt.invoice_line_id=ail.id
left join account_tax at on at.id=ailt.tax_id
join account_account aa on aa.id=ail.account_id
join res_partner p on p.id=ai.partner_id
join res_company c on c.id=ai.company_id
join account_analytic_account aaa on aaa.id=ai.account_analytic_id
left join account_analytic_tag aat on aat.id=ai.account_analytic_tag_id
left join account_analytic_tag_res_partner_rel aatrpr on aatrpr.account_analytic_tag_id=ai.account_analytic_tag_id
left join res_partner rp on rp.id=aatrpr.res_partner_id
left join res_partner rpp on rpp.id=p.parent_id
left join res_currency rc on rc.id=ai.currency_id
where ai.state in ('open','paid') and left(ai.type,3)='out' and ai.date_invoice > '01-oct-2019' and
   cast(replace(substring(aa.name,9,2),'%','') as integer) <> at.amount
order by c.name, ai.number
