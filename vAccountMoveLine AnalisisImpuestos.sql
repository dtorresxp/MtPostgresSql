% summarized report
select am.name, am.ref, am.date, ai.state, 
   sum(case when amlat.account_tax_id>0 then debit-credit end) as Subtotal,
   sum(case when ati.amount=8  then (debit-credit)*ati.amount/100 
            when atl.amount=8  then -(debit-credit)    end) as DifIva8,
   sum(case when ati.amount=16 then (debit-credit)*ati.amount/100 
            when atl.amount=16 then -(debit-credit)    end) as DifIva16,
   sum(case when ati.amount=3  then (debit-credit)*ati.amount/100 
            when atl.amount=3  then -(debit-credit)    end) as DifIva03,
   sum(case when ati.amount=2.5 then (debit-credit)*ati.amount/100 
            when atl.amount=2.5 then -(debit-credit)    end) as DifIva25,
   sum (
      case when ati.amount=8  then (debit-credit)*ati.amount/100 
           when atl.amount=8  then -(debit-credit)    
	       else 0 end +  
	  case when ati.amount=16 then (debit-credit)*ati.amount/100 
           when atl.amount=16 then -(debit-credit)    
	       else 0 end +  
      case when ati.amount=3  then (debit-credit)*ati.amount/100 
           when atl.amount=3  then -(debit-credit) 
	       else 0 end +
      case when ati.amount=2.5 then (debit-credit)*ati.amount/100 
           when atl.amount=2.5 then -(debit-credit) 
	       else 0 end 
		) as Compara
from account_move_line aml
left join account_move_line_account_tax_rel amlat on aml.id=amlat.account_move_line_id
join account_move am on am.id=aml.move_id
join account_invoice ai on ai.number=am.name
join account_account aa on aa.id=aml.account_id
left join res_partner p on aml.partner_id=p.id
left join res_partner pp on pp.id=p.commercial_partner_id
left join account_tax atl on atl.id=aml.tax_line_id
left join account_tax ati on ati.id=amlat.account_tax_id
where aml.company_id=1 and aml.journal_id in (97,98,96,99,101,104,2) and 
   aml.date > '01-oct-2018'
group by am.name, am.ref, am.date, ai.state
having abs(sum (
   case when ati.amount=8  then (debit-credit)*ati.amount/100 
        when atl.amount=8  then -(debit-credit)    
	   	else 0 end +  
   case when ati.amount=16 then (debit-credit)*ati.amount/100 
        when atl.amount=16 then -(debit-credit)    
	   	else 0 end +  
   case when ati.amount=3  then (debit-credit)*ati.amount/100 
        when atl.amount=3  then -(debit-credit) 
	   	else 0 end +
   case when ati.amount=2.5 then (debit-credit)*ati.amount/100 
        when atl.amount=2.5 then -(debit-credit) 
	    else 0 end
			)  )>0.5
order by am.date desc

****************************
aa.id 349=119.01.02 Iva Acred pagado,  754=119.01.03 Iva Acred Ex, 770=119.01.04 Iva Acred 0
      410=213.01.04 Iva Pagar Cob 16%, 747=401.07.01=Ing.Ex=Subtotal        455=401.01.01=Ing.16%=Subtotal      
Journal_id 77=TIMP, 4=CAMBIO
amlat.account_tax_id = 43=16%Compras, 49=IvaCompraEx, 51=IvaCompra0, 53=16%NoDeducible
					   44=RetHonor10%, 47=RetIvaFletes4%, 41=RetIsrArrend10%, 46=RetIvaHonor, 45=RetIvaArrend, 44esHonorariosNoImpuestoNoseconsidera
					   48=3%iISH, 55=2.5%ISH  EstosSeIgnoranNoSeReportanEnDIOT

COALESCE(value [, ...])
