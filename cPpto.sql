﻿select * from "dC"."vPptoServices19";

DROP VIEW "dC"."vPptoServices19" CASCADE;
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
   
****** Adding 
select * from "dC"."vPptoConEdoResServices19";
DROP VIEW "dC"."vPptoConEdoResServices19";
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
   p.business=r.business and p.date=r.date 
GRANT SELECT ON TABLE "dC"."vPptoConEdoResServices19" TO public;