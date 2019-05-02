select id, name, product_brand_id 
   from product_template pt where product_brand_id<>0
   
select pt.name, mb.code, mb.product_id from mrp_bom mb
   join product_template pt on pt.id=mb.product_tmpl_id
   
le pone marca *kit a los q tienen BOM
update product_template 
   set product_brand_id=19
   where product_brand_id is null and 
      id in (select pt.id from mrp_bom mb join product_template pt on pt.id=mb.product_tmpl_id)
   
le pone marca Commscope / Commscope a los q tienen "forti"
update product_template 
   set product_brand_id=22
   where product_brand_id is null and 
      id in (select pt.id from product_template pt 
			 where (position ('abrazadera' in lower(pt.name))>0 or
			        position ('abrasadera' in lower(pt.name))>0  or
			        position ('hook' in lower(pt.name))>0  or
			        position ('drive' in lower(pt.name))>0  or
			        position ('cartridge' in lower(pt.name))>0  or 
			        position ('angulo' in lower(pt.name))>0  or
			        position ('apagador' in lower(pt.name))>0  or
			        position ('caja' in lower(pt.name))>0  or
			        position ('cassette' in lower(pt.name))>0  or
			        position ('clip' in lower(pt.name))>0  or
			        position ('condulet' in lower(pt.name))>0  or
			        position ('conector' in lower(pt.name))>0  or
			        position ('cople' in lower(pt.name))>0  or
			        position ('etiqueta' in lower(pt.name))>0  

				   ) and pt.product_brand_id is null
											  )

le pone marca Avaya a los q el codigo SAT es uno
update product_template 
   set product_brand_id=17
   where product_brand_id is null and 
      id in (select pt.id from product_template pt where l10n_mx_edi_code_sat_id=23926)

le pone marca "*gastos" a la clasif interna "Gastos" (281)
update product_template 
   set product_brand_id=20
   where product_brand_id is null and 
      id in (select pt.id from product_template pt where pt.categ_id=281)
											   
select pt.name, mb.code, mb.product_id from mrp_bom mb
   join product_template pt on pt.id=mb.product_tmpl_id
   
  