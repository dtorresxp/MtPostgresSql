%% Analisis
select aml.id, am.name, aa.code, aaTagMove.name as move, aaTagRef.name as ref
   from account_move_line aml 
   join account_move am on am.id=aml.move_id
   join account_account aa on aa.id=aml.account_id
   join account_account_type aaType on aaType.id=aa.user_type_id

   left join account_invoice aiMove on aiMove.move_id=am.id
   left join account_analytic_tag aaTagMove on aaTagMove.id=aiMove.account_analytic_tag_id

   left join account_invoice aiRef on aiRef.number=am.ref
   left join account_analytic_tag aaTagRef on aaTagRef.id=aiRef.account_analytic_tag_id

where aml.company_id=1 and aml.date>='2019-01-01' and 
   aaType.name in ('Expenses','Income','Other Income','Cost of Revenue') and
   am.journal_id not in (94,77) and
   aml.id not in (
      select aml.id from account_move_line aml 
      join account_move am on am.id=aml.move_id
      join account_account aa on aa.id=aml.account_id
      join account_account_type aaType on aaType.id=aa.user_type_id
      join account_analytic_tag_account_move_line_rel aatamlr on aatamlr.account_move_line_id=aml.id
      join account_analytic_tag aaTag on aaTag.id=aatamlr.account_analytic_tag_id
   where aml.company_id=1 and aml.date>='2019-01-01' and 
      aaType.name in ('Expenses','Income','Other Income','Cost of Revenue') and
      aaTag.usage in ('project')
   )

%% Ejecucion
insert into account_analytic_tag_account_move_line_rel (account_move_line_id, account_analytic_tag_id)
select aml.id, aaTagMove.id 
   from account_move_line aml 
   join account_move am on am.id=aml.move_id
   join account_account aa on aa.id=aml.account_id
   join account_account_type aaType on aaType.id=aa.user_type_id
   join account_invoice aiMove on aiMove.move_id=am.id
   join account_analytic_tag aaTagMove on aaTagMove.id=aiMove.account_analytic_tag_id
where aml.company_id=1 and aml.date>='2019-01-01' and 
   aaType.name in ('Expenses','Income','Other Income','Cost of Revenue') and
   am.journal_id not in (94,77) and
   aml.id not in (
      select aml.id from account_move_line aml 
      join account_move am on am.id=aml.move_id
      join account_account aa on aa.id=aml.account_id
      join account_account_type aaType on aaType.id=aa.user_type_id
      join account_analytic_tag_account_move_line_rel aatamlr on aatamlr.account_move_line_id=aml.id
      join account_analytic_tag aaTag on aaTag.id=aatamlr.account_analytic_tag_id
   where aml.company_id=1 and aml.date>='2019-01-01' and 
      aaType.name in ('Expenses','Income','Other Income','Cost of Revenue') and
      aaTag.usage in ('project')
   )

insert into account_analytic_tag_account_move_line_rel (account_move_line_id, account_analytic_tag_id)
select aml.id, aaTagRef.id 
   from account_move_line aml 
   join account_move am on am.id=aml.move_id
   join account_account aa on aa.id=aml.account_id
   join account_account_type aaType on aaType.id=aa.user_type_id
   join account_invoice aiRef on aiRef.number=am.ref
   join account_analytic_tag aaTagRef on aaTagRef.id=aiRef.account_analytic_tag_id
where aml.company_id=1 and aml.date>='2019-01-01' and 
   aaType.name in ('Expenses','Income','Other Income','Cost of Revenue') and
   am.journal_id not in (94,77) and
   aml.id not in (
      select aml.id from account_move_line aml 
      join account_move am on am.id=aml.move_id
      join account_account aa on aa.id=aml.account_id
      join account_account_type aaType on aaType.id=aa.user_type_id
      join account_analytic_tag_account_move_line_rel aatamlr on aatamlr.account_move_line_id=aml.id
      join account_analytic_tag aaTag on aaTag.id=aatamlr.account_analytic_tag_id
   where aml.company_id=1 and aml.date>='2019-01-01' and 
      aaType.name in ('Expenses','Income','Other Income','Cost of Revenue') and
      aaTag.usage in ('project')
   )
