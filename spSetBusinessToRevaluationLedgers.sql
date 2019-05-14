insert into account_analytic_tag_account_move_line_rel (account_move_line_id, account_analytic_tag_id) 
   select aml.id, vampb.business_id
   from account_move_line aml 
   join account_move am on am.id=aml.move_id
   join account_journal aj on aj.id = am.journal_id
   join public."vAccountMove_ProjBuss" vampb on vampb.am_name=aml.name
   join account_account aa on aa.id=aml.account_id
   where aml.company_id=1 and aj.code='RS' and aml.user_type_id not in (1,2) and
      vampb.am_id in 
         ( select am_id from public."vAccountMove_ProjBuss"
           group by am_id   having count(*)=1
         )    and
      aml.id not in 
      (
      select aml.id
      from account_move_line aml 
      join account_move am on am.id=aml.move_id
      join account_journal aj on aj.id = am.journal_id
      join public."vAccountMove_ProjBuss" vampb on vampb.am_name=aml.name
      join account_account aa on aa.id=aml.account_id
      join account_analytic_tag_account_move_line_rel aatamlr on aatamlr.account_move_line_id=aml.id
      join account_analytic_tag aat on aat.id=aatamlr.account_analytic_tag_id
      where aml.company_id=1 and aj.code='RS' and aml.user_type_id not in (1,2)  and
         aat.usage='business' and left(aat.name,2)='B:'
      )
   on conflict do nothing

