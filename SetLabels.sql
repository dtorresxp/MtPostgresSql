************ updates Revaluation records with Analytic label *************
select am.name, am.ref, am.date, aml.name, 
from account_move_line aml 
join account_move am on am.id=aml.move_id
join account_journal aj on aj.id=aml.journal_id
join account_invoice ai on ai.number=aml.name
where 
	aj.name='Revaluacion de Saldos' and aml.company_id=1 and
	aml.date between '02-oct-2018' and '01-nov-2018' and
	aml.account_id in (536,543) 
group by am.name, am.ref, am.date, aml.name
order by am.name, am.ref, am.date, aml.name
	
aml.account_id= 536 Perdida en Cambios, 543 Utilidad en Cambios

select pp.name, right(am.ref,8) as ref, aml.journal_id, amlat.account_tax_id, ai.date, aml.id,
   sum(case when amlat.account_tax_id=43 then 
	      case when aml.journal_id=4 then (debit-credit)/1.16 else debit-credit end 
	   else 0 end)
       as Base16,
   sum(case when amlat.account_tax_id=51 then debit-credit else 0 end) as Base0,
   sum(case when amlat.account_tax_id=49 then debit-credit else 0 end) as BaseExento,	   
   sum(case when amlat.account_tax_id=53 then debit-credit else 0 end) as Base16NoDeducible,	   
   sum(case when amlat.account_tax_id in (47,41,46,45) then 
		   case when amlat.account_tax_id in (41) then (debit-credit)*.1 
				when amlat.account_tax_id in (45,46) then (debit-credit)*.1067 
			   	when amlat.account_tax_id=47 then (debit-credit)*.04 
	   			else 0
	   		end
	   else 0 end) as Retencion,
   sum(case when aml.account_id=349 then debit-credit else 0 end) as IVA16
from account_move_line aml
left join account_move_line_account_tax_rel amlat on aml.id=amlat.account_move_line_id
join account_move am on am.id=aml.move_id
join account_invoice ai on ai.number=right(am.ref,8)
join account_account aa on aa.id=aml.account_id
left join res_partner p on aml.partner_id=p.id
left join res_partner pp on pp.id=p.commercial_partner_id
where aml.company_id=1 and aml.journal_id in (4,77) and aml.date between '01-sep-2018' and '30-sep-2018' and 
   (left(am.ref,2) in ('FP','NP')) and
   (aml.account_id in (349
					   
**************************************TEMPORAL SOLO SACA LISTADO DE FAC C/P CON ETIQ ANALITICA DE SU LINEA
select ai.number, aat.name
from account_invoice_line ail 
join account_invoice ai on ai.id=ail.invoice_id
left join account_analytic_tag_account_invoice_line_rel aatail on aatail.account_invoice_line_id=ail.id
left join account_analytic_tag aat on aat.id=aatail.account_analytic_tag_id
group by ai.number, aat.name
					   