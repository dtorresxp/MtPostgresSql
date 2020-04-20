select * from account_account_tag where applicability='accounts'
#Lista de catalogo de cuentas y sus agrupadores
select aa.id as aa_id, aa.code as aa_code, aa.name as aa_name, aa.user_type_id aa_user_type_id, aat.id as aat_id, aat.name as aat_name
   from account_account aa 
   left join account_account_account_tag aaat on aaat.account_account_id=aa.id
   left join account_account_tag aat on aat.id=aaat.account_account_tag_id
   where aa.company_id=1
   order by aa.code asc
   
#Lista de agrupadores en USO en el catalogo de cuentas
select distinct aat.id as aat_id, aat.name as aat_name
   from account_account aa 
   left join account_account_account_tag aaat on aaat.account_account_id=aa.id
   left join account_account_tag aat on aat.id=aaat.account_account_tag_id
   where aa.company_id=1 and aat.applicability='accounts'
   order by aat_name asc
