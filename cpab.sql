% Antes de sacar el reporte hay q eliminar las Cancelaciones de hechas por cambios a los pagos
% Comapnias:      1=Services;   3=ServiciosProfesionales;   4=Mexico

% PROVEEDORES con formato de DIOT ********************************************************************
select right(am.ref,8) as ref,
   sum(case when amlat.account_tax_id=43 then 
	      case when aml.journal_id=4 then (debit-credit)/1.16 else debit-credit end 
	   else 0 end)
       as Base16,
   sum(case when amlat.account_tax_id=164 then 
	      case when aml.journal_id=4 then (debit-credit)/1.08 else debit-credit end 
	   else 0 end)
       as Base8,
   sum(case when amlat.account_tax_id=51  then debit-credit else 0 end) as Base0,
   sum(case when amlat.account_tax_id=49  then debit-credit else 0 end) as BaseExento,	   
   sum(case when amlat.account_tax_id=165 then debit-credit else 0 end) as Base8NoDeducible,	   
   sum(case when amlat.account_tax_id=53  then debit-credit else 0 end) as Base16NoDeducible,	   
   sum(case when amlat.account_tax_id in (47,46,45,167) then 
		   case when amlat.account_tax_id in (45,46) then (debit-credit)*.1067 
			   	when amlat.account_tax_id=47 then (debit-credit)*.04 
			   	when amlat.account_tax_id=167 then (debit-credit)*.0533
	   			else 0
	   		end
	   else 0 end) as RetencionIva,
   sum(case when amlat.account_tax_id in (44,41) then 
		   case when amlat.account_tax_id in (41,44) then (debit-credit)*.1 
	   			else 0
	   		end
	   else 0 end) as RetencionIsr,
   sum(case when aml.account_id=3773 then debit-credit else 0 end) as IVA8,
   sum(case when aml.account_id=349  then debit-credit else 0 end) as IVA16
from account_move_line aml
left join account_move_line_account_tax_rel amlat on aml.id=amlat.account_move_line_id
join account_move am on am.id=aml.move_id
join account_invoice ai on ai.number=right(am.ref,8)
join account_account aa on aa.id=aml.account_id
left join res_partner p on aml.partner_id=p.id
left join res_partner pp on pp.id=p.commercial_partner_id
where aml.company_id=1 and aml.journal_id in (4,77) and aml.date between '01-mar-2020' and '31-mar-2020' and 
   (left(am.ref,2) in ('FP','NP')) and
   (aml.account_id in (349,754,770,3773) or amlat.account_tax_id >0) and left(am.ref,8)='FPC00864'
group by right(am.ref,8)
order by right(am.ref,8)



% PROVEEDORES con detalle completo *********************************************************
select pp.vat, pp.name, right(am.ref,8) as ref, am.ref as fref, aml.journal_id, amlat.account_tax_id, ai.date, aml.id,
   sum(case when amlat.account_tax_id=43 then 
	      case when aml.journal_id=4 then (debit-credit)/1.16 else debit-credit end 
	   else 0 end)
       as Base16,
   sum(case when amlat.account_tax_id=164 then 
	      case when aml.journal_id=4 then (debit-credit)/1.08 else debit-credit end 
	   else 0 end)
       as Base8,
   sum(case when amlat.account_tax_id=51  then debit-credit else 0 end) as Base0,
   sum(case when amlat.account_tax_id=49  then debit-credit else 0 end) as BaseExento,	   
   sum(case when amlat.account_tax_id=165 then debit-credit else 0 end) as Base8NoDeducible,	   
   sum(case when amlat.account_tax_id=53  then debit-credit else 0 end) as Base16NoDeducible,
   sum(case when amlat.account_tax_id in (47,46,45,167) then 
		   case when amlat.account_tax_id in (45,46) then (debit-credit)*.1067 
			   	when amlat.account_tax_id=47 then (debit-credit)*.04 
			   	when amlat.account_tax_id=167 then (debit-credit)*.0533
	   			else 0
	   		end
	   else 0 end) as RetencionIva,
   sum(case when amlat.account_tax_id in (44,41) then 
		   case when amlat.account_tax_id in (41,44) then (debit-credit)*.1 
	   			else 0
	   		end
	   else 0 end) as RetencionIsr,
   sum(case when aml.account_id=3773 then debit-credit else 0 end) as IVA8,
   sum(case when aml.account_id=349  then debit-credit else 0 end) as IVA16
from account_move_line aml
left join account_move_line_account_tax_rel amlat on aml.id=amlat.account_move_line_id
join account_move am on am.id=aml.move_id
join account_invoice ai on ai.number=right(am.ref,8)
join account_account aa on aa.id=aml.account_id
left join res_partner p on aml.partner_id=p.id
left join res_partner pp on pp.id=p.commercial_partner_id
where aml.company_id=1 and aml.journal_id in (4,77) and aml.date between '01-mar-2020' and '31-mar-2020' and 
   (left(am.ref,2) in ('FP','NP')) and
   (aml.account_id in (349,754,770,3773) or amlat.account_tax_id >0) and left(am.ref,8)='FPC00864'
group by pp.vat, pp.name, right(am.ref,8), am.ref, aml.journal_id, amlat.account_tax_id, ai.date, aml.id
order by pp.vat, pp.name, right(am.ref,8), am.ref, aml.journal_id, amlat.account_tax_id

349 - 119.01.02 - Iva acreditable pagado 16%
754 - 119.01.03 - Iva acreditable exento
770 - 119.01.04 - Iva acreditable tasa 0
3773- 119.01.11 - Iva acreditable pagado 8%

***WIP ***************************************************** PARA REPORTAR:
select 
   case when left(cast(ai.date as text),7)='2019-02' then '1902' else 'anter' end as mes,
   'paid' as collect, pp.name as name, aml.name as document, 
   sum(case when amlat.account_tax_id=43 then 
	      case when aml.journal_id=4 then (debit-credit)/1.16 else debit-credit end 
	   else 0 end)
       as Base16,
   sum(case when amlat.account_tax_id=164 then 
	      case when aml.journal_id=4 then (debit-credit)/1.16 else debit-credit end 
	   else 0 end)
       as Base8,
   sum(case when amlat.account_tax_id=51  then debit-credit else 0 end) as Base0,
   sum(case when amlat.account_tax_id=49  then debit-credit else 0 end) as BaseExento,	   
   sum(case when amlat.account_tax_id=165 then debit-credit else 0 end) as Base8NoDeducible,	   
   sum(case when amlat.account_tax_id=53  then debit-credit else 0 end) as Base16NoDeducible,	   
   sum(case when amlat.account_tax_id in (47,46,45,167) then 
		   case when amlat.account_tax_id in (45,46) then (debit-credit)*.1067 
			   	when amlat.account_tax_id=47 then (debit-credit)*.04 
			   	when amlat.account_tax_id=167 then (debit-credit)*.0533
	   			else 0
	   		end
	   else 0 end) as RetencionIva,
   sum(case when amlat.account_tax_id in (44,41) then 
		   case when amlat.account_tax_id in (41,44) then (debit-credit)*.1 
	   			else 0
	   		end
	   else 0 end) as RetencionIsr,
   sum(case when aml.account_id=3773 then debit-credit else 0 end) as IVA8,
   sum(case when aml.account_id=349  then debit-credit else 0 end) as IVA16
from account_move_line aml
left join account_move_line_account_tax_rel amlat on aml.id=amlat.account_move_line_id
join account_move am on am.id=aml.move_id
join account_invoice ai on ai.number=right(am.ref,8)
join account_account aa on aa.id=aml.account_id
left join res_partner p on aml.partner_id=p.id
left join res_partner pp on pp.id=p.commercial_partner_id
where aml.company_id=1 and aml.journal_id in (4,77) and aml.date between '01-feb-2019' and '28-feb-2019' and 
   (left(am.ref,2) in ('FP','NP')) and
   (aml.account_id in (349,754,770,3773) or amlat.account_tax_id >0) 
group by case when left(cast(ai.date as text),7)='2019-02' then '1902' else 'anter' end, pp.name, aml.name					   
order by case when left(cast(ai.date as text),7)='2019-02' then '1902' else 'anter' end, pp.name, aml.name					   

%Facturas con saldo a una fecha
%Listando 'FP' y 'NP' con tag de impuestos asignado (tag_ids), llave asiento contable
%Listando TIMP del rango seleccionado, renglones sin tag de impuesto asignado (tag_ids) 
%   & cuenta contable no es de IVA, llave referencia
					   
%%%WIP%%%%%%%% ???
select case when left(aj.code,2)='FP' then 
		       case when left(am.name,1)='N' then am.name else am.name end
		    else aml.ref end as name, 
   sum(aml.credit-aml.debit) as balance
from account_move_line aml
left join account_move_line_account_tax_rel amlat on aml.id=amlat.account_move_line_id
join account_move am on am.id=aml.move_id
join account_journal aj on aj.id=aml.journal_id
join account_invoice ai on ai.number= 
   case when aj.code = 'TIMP' then 
      case when left(am.ref,5)='FACPV' then right(am.ref,10) else right(am.ref,8) end 
   else am.name end
join account_account aa on aa.id=aml.account_id
left join res_partner p on aml.partner_id=p.id 
left join res_partner pp on pp.id=p.commercial_partner_id 
left join account_full_reconcile afr on afr.id=aml.full_reconcile_id
where aml.company_id=1 and aml.date <= '5-mar-2019' and 
   (  (left(aj.code,2)='FP' and amlat.account_tax_id is not null) or 
	  (aj.code='TIMP' and (left(aml.ref,2)='FP' or left(aml.ref,5)='FACPV') and amlat.account_tax_id is null )  ) and
   aml.account_id not in (349,754,770,3773,348,3772) 
and 
   case when  left(aj.code,2)='FP' then am.name else aml.ref end in ('FACPV03020','NCPV00041')
group by case when left(aj.code,2)='FP' then 
		 case when left(am.name,1)='N' then am.name else am.name end 
		 else aml.ref end 
having abs(sum(aml.credit-aml.debit))>0.009


			   
aa.id 349=119.01.02 Iva Acreditable Pagado 16%,  754=119.01.03 Iva Acred Ex,      770=119.01.04 Iva Acred 0
      410=213.01.04 IVA Por Pagar Cobrado 16%,   747=401.07.01=Ing.Ex=Subtotal    455=401.01.01=Ing.16%=Subtotal      
      3773=119.01.11 Iva Acreditable Pagado 8%
      3771=213.01.11 IVA Por Pagar Cobrado 8%
      348= 119.01.01 Iva Acreditable en Transito 16%   3772=119.01.10 Iva Acreditable en Transito 8%
      409= 213.01.03 IVA Por Pagar Transito 16%    	3770= 213.01.10 IVA Por Pagar Transito 8%
Journal_id 77=TIMP, 4=CAMBIO
	  code=FP, TIMP, EXCH
amlat.account_tax_id = 43=16%Compras, 49=IvaCompraEx, 51=IvaCompra0, 53=16%NoDeducible
					   44=RetHonor10%, 47=RetIvaFletes4%, 41=RetIsrArrend10%, 46=RetIvaHonor, 45=RetIvaArrend, 44esHonorariosNoImpuestoNoseconsidera
					   48=3%iISH, 55=2.5%ISH  EstosSeIgnoranNoSeReportanEnDIOT

					   
******************************************************************************
BANCOS   **************************************
% Banco contra IVA pagado:
					   
select aa.name, aj.name as name, am.name as ref, am.date, 0 as base16, 0 as base0, 0 as baseexento, 0 as base16nodeducible, 
	0 as retencion, sum(debit-credit) as iva16
from account_move_line aml
join account_move am on am.id=aml.move_id
join account_account aa on aa.id=aml.account_id
join account_journal aj on aj.id=aml.journal_id
where aml.company_id=1 and aml.journal_id not in (4,77) and aml.date between '01-mar-2020' and '31-mar-2020' and 
   aml.account_id in (349,410,3773,3771)
group by aa.name, aj.name, am.name, am.date
order by aa.name, aj.name, am.name, am.date
					   
aa.id 349=119.01.02 Iva Acreditable Pagado 16%,  754=119.01.03 Iva Acred Ex,      770=119.01.04 Iva Acred 0
      410=213.01.04 IVA Por Pagar Cobrado 16%,   747=401.07.01=Ing.Ex=Subtotal    455=401.01.01=Ing.16%=Subtotal      
      3773=119.01.11 Iva Acreditable Pagado 8%
      3771=213.01.11 IVA Por Pagar Cobrado 8%
Journal_id 77=TIMP, 4=CAMBIO
amlat.account_tax_id = 43=16%Compras, 49=IvaCompraEx, 51=IvaCompra0, 53=16%NoDeducible
					   44=RetHonor10%, 47=RetIvaFletes4%, 41=RetIsrArrend10%, 46=RetIvaHonor, 45=RetIvaArrend, 44esHonorariosNoImpuestoNoseconsidera
					   48=3%iISH, 55=2.5%ISH  EstosSeIgnoranNoSeReportanEnDIOT

*********************************************************************************
CLIENTES  ****************************************
	   
select am.ref, ai.date, am.name, p.name as partner, 
   sum(case when amlat.account_tax_id>0 then 
	      case when aml.journal_id=4 then (debit-credit)/1.16 else debit-credit end
	   else 0 end
       ) as Subtotal,
   sum(case when aml.account_id=410 then debit-credit else 0 end) as IVA16,
   0 as IVAEx, 0 as IVA0
from account_move_line aml
left join account_move_line_account_tax_rel amlat on aml.id=amlat.account_move_line_id
join account_move am on am.id=aml.move_id
left join account_invoice ai on ai.number=am.ref
join account_account aa on aa.id=aml.account_id
left join res_partner p on p.id=aml.partner_id
where aml.company_id=1 and left(am.ref,2) not in ('FP','NP') and aml.journal_id in (4,77) and 
   aml.date between '01-dec-2019' and '31-dec-2019' and 
   (aml.account_id in (410,455,747) or amlat.account_tax_id >0)
group by am.ref, ai.date, am.name, p.name
order by am.ref asc
			   
TIMP IPPC, tiene etiquetas en subtotal; NO HAY timp si la Fac no tiene impuesto
CAMBIO IPPC, tiene etiquetas q hay q divividir 1.16, si la fac no tiene impuestos, no hay lineas de reval IVA
410=213.01.04=IvaXPagarCob 
					   
COALESCE(value [, ...])

*******************************************************************************
% Calculo de impuestos
create view "dC"."vAccountMoveLine Impuestos" as
select aat.id as aatId, aat.name aatName, concat(aa.code,' ',aa.name) as aaCodeName, aa.code as aaCode, aa.name as aaName, 
   case when aj.name like 'Traslado%' then 'TIMP'				
        when aj.name like 'Diferencia%' then 'CAMBIO'
		when aj.name like 'Factura de%' then 'FP'
		when aj.name like 'Factura Elec%' then 'FC'
	    else aj.name
   end as ajDiario,
   aml.journal_id as amlJournal, aj.name as ajName, 
   case when (aj.name like 'Traslado%' or aj.name like 'Diferencia%') then 
           case when ait.date between '01-jan-2019' and '31-jan-2019' then 'Mes' else 'Anterior' end
        else  
           case when aml.date between '01-jan-2019' and '31-jan-2019' then 'Mes' else 'Anterior' end
   end as amlMes,
   sum(aml.debit-aml.credit) as amlBalance 
from account_move_line aml 
join account_account aa on aa.id=aml.account_id
join account_account_type aat on aat.id=aa.user_type_id
join account_journal aj on aj.id=aml.journal_id
left join account_invoice ait on ait.number=aml.ref
where aml.date between '01-jan-2019' and '31-jan-2019' and aml.company_id=1 and
   ((upper(aa.name) like 'IVA%') or (upper(aa.name) like ('%INGRESO%')))
group by aat.id, aat.name, concat(aa.code,' ',aa.name), aa.code, aa.name, 
   case when aj.name like 'Traslado%' then 'TIMP'				
        when aj.name like 'Diferencia%' then 'CAMBIO'
		when aj.name like 'Factura de%' then 'FP'
		when aj.name like 'Factura Elec%' then 'FC'
	    else aj.name
   end, 
   aml.journal_id, aj.name, 
   case when (aj.name like 'Traslado%' or aj.name like 'Diferencia%') then 
           case when ait.date between '01-jan-2019' and '31-jan-2019' then 'Mes' else 'Anterior' end
        else  
           case when aml.date between '01-jan-2019' and '31-jan-2019' then 'Mes' else 'Anterior' end
   end
order by aa.code, aa.name

				

				
				
