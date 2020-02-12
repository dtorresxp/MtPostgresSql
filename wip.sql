CREATE OR REPLACE VIEW vPptoConEdoRes AS 
select 
   r.company, r.company_long, 
   case when p.pr01 is null then 'null ppto' else 'not null ppto' end as idt, 
   case when p.pr01 is not null then p.pr01 else r.pr01 end as pr01, 
   case when p.pr02 is not null then p.pr02 else r.pr02 end as pr02, 
   case when p.analytic is not null then p.analytic else r.analytic end as analytic, 
   case when p.business is not null then p.business else r.business end as business, 
   case when p.date is not null then p.date else r.date end as date, 
   case when p.budget is not null then p.budget else 0 end as budget, 
   case when r.balance is not null then r.balance else 0 end as balance
from vPpto p
left join vEdoRes r on 
   p.pr01=r.pr01 and p.pr02=r.pr02 and p.analytic=r.analytic and 
   p.business=r.business and to_char(p.date,'YYYY')=to_char(r.date,'YYYY') and to_char(p.date,'MM')=to_char(r.date,'MM')

