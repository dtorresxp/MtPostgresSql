http://www.postgresqltutorial.com/psql-commands/

DATABASE "mt10";

CREATE SCHEMA "dC"
  AUTHORIZATION hector;
GRANT ALL ON SCHEMA "dC" TO hector;
GRANT USAGE ON SCHEMA "dC" TO reportes;
COMMENT ON SCHEMA "dC"
  IS 'data Cube';

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

CREATE OR REPLACE VIEW "dC"."vEdoResPptoServices19" AS 
select pr01, pr02, analytic, business, date_trunc('month',date) as date, sum(balance) as balance
   from "dC"."vEdoResServices19"
   group by pr01, pr02, analytic, business, date_trunc('month',date);   
GRANT SELECT ON TABLE "dC"."vEdoResPptoServices19" TO public;

CREATE OR REPLACE VIEW "dC"."vPptoServices19" AS 
select 
   (select distinct mki.description
      from public.mis_report_kpi_expression mkei
      join mis_report_kpi mki on mki.id=mkei.kpi_id
	  join mis_budget mbi on mbi.report_id=mki.report_id
      where mbi.id=1 and mkei.name not like '%[%' and strpos(mkei.name,mk.name)>0
   ) as pr01, 
   mk.description as pr02, aaa.name as analytic, upper(msk.name) as business, 
   mbi.date_from as date, mbi.amount as budget
   from mis_budget_item mbi
   join account_analytic_account aaa on aaa.id=mbi.analytic_account_id
   join mis_report_kpi_expression mke on mke.id=kpi_expression_id
   join mis_report_kpi mk on mk.id=mke.kpi_id
   left join mis_report_subkpi msk on msk.id=mke.subkpi_id
   where budget_id=1 and msk.name in ('idn','ifi','erp');
GRANT SELECT ON TABLE "dC"."vPptoServices19" TO public;

CREATE OR REPLACE VIEW "dC"."vPptoConEdoResServices19" AS 
select case when p.pr01 is null then 'null ppto' else 'not null ppto' end as idt, 
   case when p.pr01 is not null then p.pr01 else r.pr01 end as pr01, 
   case when p.pr02 is not null then p.pr02 else r.pr02 end as pr02, 
   case when p.analytic is not null then p.analytic else r.analytic end as analytic, 
   case when p.business is not null then p.business else r.business end as business, 
   case when p.date is not null then p.date else r.date end as date, 
   case when p.budget is not null then p.budget else 0 end as budget, 
   case when r.balance is not null then r.balance else 0 end as balance
from "dC"."vPptoServices19" p
full join "dC"."vEdoResPptoServices19" r on 
   p.pr01=r.pr01 and p.pr02=r.pr02 and p.analytic=r.analytic and 
   p.business=r.business and p.date=r.date;
GRANT SELECT ON TABLE "dC"."vPptoConEdoResServices19" TO public;
