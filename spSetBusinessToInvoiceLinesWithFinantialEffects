%Buscar aml de P&L, sin Negocio, cuyo documento tiene un Negocio
insert into account_analytic_tag_account_move_line_rel (account_move_line_id, account_analytic_tag_id)
select aml.id, vamlPb.business_id
   from account_move_line aml 
   join account_move am on am.id=aml.move_id
   join account_account aa on aa.id=aml.account_id
   join account_account_type aaType on aaType.id=aa.user_type_id
   left join public."vAccountMove_ProjBuss" vamlPb on vamlPb.am_id=am.id
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
         aaTag.usage in ('business')
      ) and am.id in (
      select am_id from public."vAccountMove_ProjBuss"
         where am_id in 
         ( select am_id from public."vAccountMove_ProjBuss"
           group by am_id   having count(*)=1
         )
      )