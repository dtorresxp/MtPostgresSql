drop view vPptoConEdoRes;
CREATE OR REPLACE VIEW vPptoConEdoRes AS 
select 
   case when p.pr01 is null then 'null pr01' else '' end as idt, 
   case when p.pr01 is not null then p.pr01 else r.pr01 end as pr01, 
   case when p.pr02 is not null then p.pr02 else r.pr02 end as pr02, 
   case when p.analytic is not null then p.analytic else r.analytic end as analytic, 
   case when p.business is not null then p.business else r.business end as business, 
   p.date as date_bdg,
   case when p.budget is not null then p.budget else 0 end as budget, 
   r.date as date_pl, 
   case when r.balance is not null then r.balance else 0 end as balance,
   r.company, r.company_long, r.move, r.type, r.account, r.partner, r.project, r.projcustomer
from vPpto p
left join vEdoRes r on 
   p.pr01=r.pr01 and p.pr02=r.pr02 and p.analytic=r.analytic and 
   p.business=r.business and to_char(p.date,'YYYY')=to_char(r.date,'YYYY') and to_char(p.date,'MM')=to_char(r.date,'MM');

select * from vPptoConEdoRes;