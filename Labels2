ETIQUETAS********************************************
select att.name, att.percentage from account_analytic_tag_account_invoice_line_rel ai 
   join account_analytic_tag att on att.id=ai.account_analytic_tag_id
   join account_invoice_line ail on ail.id=ai.account_invoice_line_id 
   where ail.invoice_id=26472
   
   move_id = poliza
   order_id = pedido venta/compra

estructura de P&L**************   
select am.name, am.date, aa.name, rp.name, aml.debit-aml.credit as "balance", aaa.name, 
 aat.usage, aat.name, aat.percentage, balance*percentage/100 as "value"
   from account_move am
   join account_move_line aml on aml.move_id=am.id
   join account_account aa on aa.id=aml.account_id
   join res_partner rp on rp.id=am.partner_id
   join account_analytic_account aaa on aaa.id=aml.analytic_account_id
   join account_analytic_tag_account_move_line_rel amlaat on amlaat.account_move_line_id=aml.id
   join account_analytic_tag aat on aat.id=amlaat.account_analytic_tag_id
   where am.date >= '01/01/2018' and 
      aa.user_type_id in (12,13,14,15,16) and
	  am.journal_id <> 77 and 
	  am.name = 'A03491'
   order by balance, usage, aat.name
 
   	[u'user_type_id', u'ilike', u'Ingreso'], 13
	[u'user_type_id', u'ilike', u'Costo directo'], 16
	[u'user_type_id', u'ilike', u'Otra entrada'], 12
	[u'user_type_id', u'ilike', u'Gastos'], 15
	[u'user_type_id', u'ilike', u'Deprecia'], 14
	journal_id = 77    Traslado de impuestos
	
	Business B:   Solucion N:  Servicio V:   Marca K:    Proyecto P:  Sucursal S:


Etqieuetas por Factura-linea*****************
select ai.id, ai.number, ai.name, ail.sequence, ail.id
  from account_invoice ai
  join account_invoice_line ail on ail.invoice_id=ai.id
  where ai.number = 'NCC00161'

select * from account_invoice_line ail where ail.invoice_id=28311

select aatail.account_invoice_line_id, aatail.account_analytic_tag_id from account_analytic_tag_account_invoice_line_rel aatail
  join account_invoice_line ail on aatail.account_invoice_line_id=ail.invoice_id 
  join account_invoice ai on ail.invoice_id=ai.id
  where ai.number='A03603'

insert into account_analytic_tag_account_invoice_line_rel 
  (account_invoice_line_id, account_analytic_tag_id) 
  values (49620,3);
insert into account_analytic_tag_account_invoice_line_rel 
  (account_invoice_line_id, account_analytic_tag_id) 
  values (49584,4);
insert into account_analytic_tag_account_invoice_line_rel 
  (account_invoice_line_id, account_analytic_tag_id) 
  values (49585,4);
insert into account_analytic_tag_account_invoice_line_rel 
  (account_invoice_line_id, account_analytic_tag_id) 
  values (49586,4);
insert into account_analytic_tag_account_invoice_line_rel 
  (account_invoice_line_id, account_analytic_tag_id) 
  values (49587,4);
insert into account_analytic_tag_account_invoice_line_rel 
  (account_invoice_line_id, account_analytic_tag_id) 
  values (49588,4);

  3=IDN  4=IFI

**************************************
Cambios a los documento Factura

select ai.id, ail.invoice_id, ai.number, ai.name, ail.sequence, ail.id, ail.account_analytic_id, ail.account_id
  from account_invoice ai
  join account_invoice_line ail on ail.invoice_id=ai.id
  where ai.number in ('A03626')

Cambiar la Cuenta Analitica en lineas ***
update account_invoice_line set account_analytic_id=5 where id=28369 and company_id=1
5=CJS, 12=CRP, 4=CUU, 9=GDL, 16=PRY

Cambiar la Cuenta contable en lineas ***
update account_invoice_line set account_id=747 where invoice_id in (27346,28345,25666,27345,28346)
747=401.07.01 Eng Exentos
