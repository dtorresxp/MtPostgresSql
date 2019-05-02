select aml.company_id, am.name, aml.id, aml.account_id, concat(aa.code,' ',aa.name) as account, aml.user_type_id, aml.analytic_account_id, 
   aaa.name, aml.debit, aml.credit, aml.ref, aml.name, aat.name, aat.usage, aat.percentage
   from account_move_line aml
   join account_move am on am.id=aml.move_id
   join account_account aa on aa.id=aml.account_id
   left join account_analytic_account aaa on aaa.id=aml.analytic_account_id
   left join account_analytic_tag_account_move_line_rel aatamlr on aatamlr.account_move_line_id=aml.id
   left join account_analytic_tag aat on aat.id=aatamlr.account_analytic_tag_id
   where am.name='FPG06478' and aml.company_id=1




