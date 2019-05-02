% am.name project and business

DROP VIEW public."vAccountMove_ProjBuss";

create view public."vAccountMove_ProjBuss" as
select am.name as am_name, am.id as am_id, aatp.name as project, aatp.id as project_id,
   case when left(aatn.name,2)='B:' then aatn.name 
   else 'new' end as business,
   case when left(aatn.name,2)='B:' then aatn.id 
   else null end as business_id
from account_move am
   join account_move_line aml on aml.move_id=am.id
   left join account_analytic_tag_account_move_line_rel aatamlrp on aatamlrp.account_move_line_id=aml.id
   join account_analytic_tag aatp on aatp.id=aatamlrp.account_analytic_tag_id
   left join account_analytic_tag_account_move_line_rel aatamlrn on aatamlrn.account_move_line_id=aml.id
   join account_analytic_tag aatn on aatn.id=aatamlrn.account_analytic_tag_id
where aatp.usage='project' and aatn.usage='business'
      and am.date > '2018-06-01' and left(aatn.name,2)='B:' 
group by am.name, am.id, aatp.name, aatp.id, aatn.name, aatn.id
order by am.name;

   
