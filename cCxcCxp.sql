DROP VIEW vcxccxp ;

CREATE OR REPLACE VIEW vcxccxp AS
select c.name as company, 
   case when p.company_type='company' then p.name
      else 
         case when rpp.name is null then p.name
         else rpp.name end
   end as partner, 
   case when left(ai.type,2)='in' then 'Proveedores' else 'Clientes' end as in_out, 
   case when right(ai.type,7)='invoice' then 'invoice' else 'refund' end as type, 
   ai.number, ai.date_invoice, ai.date_due, 
   case when ai.collection_date is not null then ai.collection_date 
   else 
      case when left(ai.type,2)='in' then ai.date_due
         else null 
      end 
   end as collection_date, 
   ai.origin, aaa.name as analytic, aat.name as project,
   case when left(ai.type,2)='in' then rp.name else '' end as customer, 
   ai.collection_status, 
   case when left(ai.type,2)='in' then -ai.amount_total_signed else ai.amount_total_signed end as amount_total_signed, 
   case when left(ai.type,2)='in' then -ai.amount_total_company_signed else ai.amount_total_company_signed end as amount_total_company_signed, 
   case when left(ai.type,2)='in' then -ai.residual_signed else ai.residual_signed end as residual_signed, 
   case when left(ai.type,2)='in' then -ai.residual_company_signed else ai.residual_company_signed end as residual_company_signed, 
   ai.residual_company_signed as residual_company_original_signed, 
   concat('http://erp.mtnmx.com/web#id=',ai.id,'&view_type=form&model=account.invoice&action=303&menu_id=189') as InvoiceUrl 
from account_invoice ai 
join res_partner p on p.id=ai.partner_id
join res_company c on c.id=ai.company_id
join account_analytic_account aaa on aaa.id=ai.account_analytic_id
left join account_analytic_tag aat on aat.id=ai.account_analytic_tag_id
left join account_analytic_tag_res_partner_rel aatrpr on aatrpr.account_analytic_tag_id=ai.account_analytic_tag_id
left join res_partner rp on rp.id=aatrpr.res_partner_id
left join res_partner rpp on rpp.id=p.parent_id
where ai.state='open' 
order by p.name asc;

GRANT ALL ON TABLE vcxccxp TO cubos;

