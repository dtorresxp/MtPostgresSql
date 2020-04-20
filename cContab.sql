select * from "dC"."vEdoResServices19";
DROP VIEW "dC"."vEdoResServices19" CASCADE;
CREATE OR REPLACE VIEW "dC"."vEdoResServices19" AS 
select 
   (select distinct substring(aat.name,5,25) 
      from account_account_tag aat 
      join account_account_account_tag aaat on aaat.account_account_tag_id=aat.id
      where aaat.account_account_id=aa.id and left(aat.name,4)='pr01' limit 1) as pr01,
   (select distinct substring(aat.name,5,25) 
      from account_account_tag aat 
      join account_account_account_tag aaat on aaat.account_account_tag_id=aat.id
      where aaat.account_account_id=aa.id and left(aat.name,4)='pr02' limit 1) as pr02, 
    aaa.name as analytic, 
   (select distinct substring(aat.name,3,3)
      from account_analytic_tag aat 
      join account_analytic_tag_account_move_line_rel aatamlr on aatamlr.account_analytic_tag_id = aat.id
      where aatamlr.account_move_line_id=aml.id and aat.usage='business' and left(aat.name,2)='B:' limit 1) 
      as Business, 
   am.name as move, am.date, aatype.name as type, aa.name as account, aml.credit-aml.debit as balance, 
   (select distinct name from res_partner rp where rp.id=am.partner_id) as partner, 
   (select distinct aat.name 
      from account_analytic_tag aat 
      join account_analytic_tag_account_move_line_rel aatamlr on aatamlr.account_analytic_tag_id = aat.id
      where aatamlr.account_move_line_id=aml.id and aat.usage='project' limit 1) 
      as Project, 
   (select distinct rp.name 
      from account_analytic_tag aat 
      join account_analytic_tag_account_move_line_rel aatamlr on aatamlr.account_analytic_tag_id = aat.id
      left join account_analytic_tag_res_partner_rel aatrpr on aatrpr.account_analytic_tag_id=aat.id
      left join res_partner rp on rp.id=aatrpr.res_partner_id
      where aatamlr.account_move_line_id=aml.id and aat.usage='project' limit 1) 
      as ProjCustomer 
from account_move_line aml
join account_move am on am.id=aml.move_id
join account_account aa on aa.id=aml.account_id
left join account_analytic_account aaa on aaa.id=aml.analytic_account_id
join account_account_type aatype on aatype.id=aa.user_type_id
where aml.company_id=1 and am.state='posted' and aml.date between '2019-01-01' and '2019-12-30' and 
   ((aml.journal_id=77 and aa.name like 'No Deducibles IVA%') or aml.journal_id!=77) and 
   aa.id in (
      select distinct aaati.account_account_id from account_account_account_tag aaati 
         join account_account_tag aati on aati.id=aaati.account_account_tag_id 
         where left(aati.name,2)='pr')
order by am.name ;
GRANT SELECT ON TABLE "dC"."vEdoResServices19" TO public;

*********************
select * from "dC"."vEdoResPptoServices19";
DROP VIEW "dC"."vEdoResPptoServices19";
CREATE OR REPLACE VIEW "dC"."vEdoResPptoServices19" AS 
select pr01, pr02, analytic, business, date_trunc('month',date) as date, sum(balance) as balance
from "dC"."vEdoResServices19"
group by pr01, pr02, analytic, business, date_trunc('month',date);
GRANT SELECT ON TABLE "dC"."vEdoResPptoServices19" TO public;