DROP VIEW "dC"."vCxcCxp" ;

CREATE OR REPLACE VIEW "dC"."vCxcCxp" AS
select c.name as company, p.name as partner, 
   case when left(ai.type,2)='in' then 'Proveedores' else 'Clientes' end as in_out, 
   case when right(ai.type,7)='invoice' then 'invoice' else 'refund' end as type, 
   ai.number, ai.date_invoice, ai.date_due, ai.origin, aaa.name as analytic, aat.name as project, rp.name customer, 
   ai.collection_status, 
   case when left(ai.type,2)='in' then -ai.amount_total_signed else ai.amount_total_signed end as amount_total_signed, 
   case when left(ai.type,2)='in' then -ai.amount_total_company_signed else ai.amount_total_company_signed end as amount_total_company_signed, 
   case when left(ai.type,2)='in' then -ai.residual_signed else ai.residual_signed end as residual_signed, 
   case when left(ai.type,2)='in' then -ai.residual_company_signed else ai.residual_company_signed end as residual_company_signed, 
   ai.residual_company_signed as residual_company_original_signed
from account_invoice ai 
join res_partner p on p.id=ai.partner_id
join res_company c on c.id=ai.company_id
join account_analytic_account aaa on aaa.id=ai.account_analytic_id
left join account_analytic_tag aat on aat.id=ai.account_analytic_tag_id
left join account_analytic_tag_res_partner_rel aatrpr on aatrpr.account_analytic_tag_id=ai.account_analytic_tag_id
left join res_partner rp on rp.id=aatrpr.res_partner_id
where ai.state='open' 
order by p.name asc;

ALTER TABLE "dC"."vCxcCxp"
  OWNER TO jarsa;
GRANT ALL ON TABLE "dC"."vCxcCxp" TO jarsa;
GRANT SELECT ON TABLE "dC"."vCxcCxp" TO reportes;
