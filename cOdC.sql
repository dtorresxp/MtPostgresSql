select po.name, left(po.origin,7) as origin, po.date_order, rp.display_name as partner, po.amount_untaxed as po_amount_untaxed, 
   aat.name as project, rp2.display_name project_customer,
   po.state as po_state, po.partner_ref, po.amount_total as po_amount_total, po.invoice_status as po_incoice_status, pol.create_date, 
   aaa.name as analytic, pol.name as line, 
   pol.price_unit as pol_price_unit, pol.product_qty as pol_product_qty, pol.qty_invoiced as pol_qty_invoiced, pol.purchase_status as pol_purchase_status, 
   rc.name as currency, rcr.name as currency_name, 1/rcr.rate as currency_rate
from purchase_order_line pol
join purchase_order po on po.id=pol.order_id
join res_partner rp on rp.id=po.partner_id
join account_analytic_tag aat on aat.id=po.account_analytic_tag_id
join account_analytic_account aaa on aaa.id=pol.account_analytic_id
join res_currency rc on rc.id=pol.currency_id
join res_currency_rate rcr on rcr.currency_id=pol.currency_id 
left join account_analytic_tag_res_partner_rel aatrpr on aatrpr.account_analytic_tag_id=po.account_analytic_tag_id
left join res_partner rp2 on rp2.id=aatrpr.res_partner_id
where pol.state='purchase' and 
   rc.active and rcr.company_id=1 and rcr.name=current_date;

select current_date;

select * from purchase_order_line 
where state='purchase';

select * from purchase_order;

select rc.name, rc.symbol, rcr.name, rcr.rate
from res_currency rc
join res_currency_rate rcr on rcr.currency_id=rc.id
where rc.active and rcr.company_id=1 and rcr.name=current_date
