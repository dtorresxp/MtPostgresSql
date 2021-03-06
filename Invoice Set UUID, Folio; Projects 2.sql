%%% setting UUID
select id,number,cfdi_uuid,date_stamped,l10n_mx_edi_time_invoice,l10n_mx_report_name,xml_signed from account_invoice where id=37408
%update account_invoice 
   set cfdi_uuid='6BC0500C-4DFC-4FFF-B6B5-A6B8E6F63B6A', date_stamped='2019-05-07', l10n_mx_edi_time_invoice='16:43:41',
   l10n_mx_report_name='FA376.xml',
   xml_signed='<?xml version="1.0" encoding="UTF-8"?>
<cfdi:Comprobante xsi:schemaLocation="http://www.sat.gob.mx/cfd/3 http://www.sat.gob.mx/sitio_internet/cfd/3/cfdv33.xsd" Version="3.3" Serie="FA" Folio="376" Fecha="2019-05-07T15:40:51" FormaPago="03" NoCertificado="00001000000411649930" Certificado="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" SubTotal="6620.00" Moneda="MXN" Total="7630.88" TipoDeComprobante="I" MetodoPago="PUE" LugarExpedicion="32300" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:cfdi="http://www.sat.gob.mx/cfd/3" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" Sello="PXSCqxmToCrbxgxErNG6o85t+94RKjTl0tC9y2KOPEyIWiT/SJ3n0Y5nzOZfOevjBGintBlC2obl6KKuren/lwMThin6nEiPGYVz+ANqFXkIzNmKmiW9pzwk812W3WDvf2kB6TxPe+nmLgSoVn2eGFN88ffVr4o3hCH3O1RBVYYrCmJIZYYHQRAbRME7cqKi3ZGVVoX7dr1iA4Cl5+1a1ddCbIBMerp2BofarR0kQEabDKTtWstYbWCuz96/k0Pvo3DmV1F6P49uQo2NfUkT7veybo9OIYZcd/PFNnfqrkMyTPNWqL99oNEwIb6KTkrkkWNcb//gQk2n1HkkQwMaFg=="><cfdi:Emisor Rfc="HEHG8409143D7" Nombre="GERARDO IVAN HERNANDEZ HERNANDEZ" RegimenFiscal="612"></cfdi:Emisor><cfdi:Receptor Rfc="MTN040706LVA" Nombre="MTNET SERVICES SA DE CV" UsoCFDI="G01"></cfdi:Receptor><cfdi:Conceptos><cfdi:Concepto ClaveProdServ="32101622" NoIdentificacion="97" Cantidad="2" ClaveUnidad="H87" Unidad="PZ" Descripcion="UNIDADES DE MEMORIA" ValorUnitario="2005.50" Importe="4011.00"><cfdi:Impuestos><cfdi:Traslados><cfdi:Traslado Base="4011.00" Impuesto="002" TipoFactor="Tasa" TasaOCuota="0.160000" Importe="641.76"></cfdi:Traslado></cfdi:Traslados></cfdi:Impuestos></cfdi:Concepto><cfdi:Concepto ClaveProdServ="93161608" NoIdentificacion="2" Cantidad="1" ClaveUnidad="E48" Unidad="NA" Descripcion="IMPUESTOS PEDIMENTO 9004078 FECHA 03/05/2019" ValorUnitario="331.00" Importe="331.00"><cfdi:Impuestos><cfdi:Traslados><cfdi:Traslado Base="331.00" Impuesto="002" TipoFactor="Tasa" TasaOCuota="0.160000" Importe="52.96"></cfdi:Traslado></cfdi:Traslados></cfdi:Impuestos></cfdi:Concepto><cfdi:Concepto ClaveProdServ="93161608" NoIdentificacion="2" Cantidad="1" ClaveUnidad="E48" Unidad="NA" Descripcion="VALIDACION" ValorUnitario="302.00" Importe="302.00"><cfdi:Impuestos><cfdi:Traslados><cfdi:Traslado Base="302.00" Impuesto="002" TipoFactor="Tasa" TasaOCuota="0.000000" Importe="0"></cfdi:Traslado></cfdi:Traslados></cfdi:Impuestos></cfdi:Concepto><cfdi:Concepto ClaveProdServ="80151605" NoIdentificacion="3" Cantidad="1" ClaveUnidad="E48" Unidad="NA" Descripcion="HONORARIOS PEDIMENTO 9004078 FECHA 03/05/2019" ValorUnitario="1976.00" Importe="1976.00"><cfdi:Impuestos><cfdi:Traslados><cfdi:Traslado Base="1976.00" Impuesto="002" TipoFactor="Tasa" TasaOCuota="0.160000" Importe="316.16"></cfdi:Traslado></cfdi:Traslados></cfdi:Impuestos></cfdi:Concepto></cfdi:Conceptos><cfdi:Impuestos TotalImpuestosTrasladados="1010.88"><cfdi:Traslados><cfdi:Traslado Impuesto="002" TipoFactor="Tasa" TasaOCuota="0.000000" Importe="0.00"></cfdi:Traslado><cfdi:Traslado Impuesto="002" TipoFactor="Tasa" TasaOCuota="0.160000" Importe="1010.88"></cfdi:Traslado></cfdi:Traslados></cfdi:Impuestos><cfdi:Complemento><tfd:TimbreFiscalDigital RfcProvCertif="TSP080724QW6" Version="1.1" UUID="6BC0500C-4DFC-4FFF-B6B5-A6B8E6F63B6A" FechaTimbrado="2019-05-07T16:43:41" SelloCFD="PXSCqxmToCrbxgxErNG6o85t+94RKjTl0tC9y2KOPEyIWiT/SJ3n0Y5nzOZfOevjBGintBlC2obl6KKuren/lwMThin6nEiPGYVz+ANqFXkIzNmKmiW9pzwk812W3WDvf2kB6TxPe+nmLgSoVn2eGFN88ffVr4o3hCH3O1RBVYYrCmJIZYYHQRAbRME7cqKi3ZGVVoX7dr1iA4Cl5+1a1ddCbIBMerp2BofarR0kQEabDKTtWstYbWCuz96/k0Pvo3DmV1F6P49uQo2NfUkT7veybo9OIYZcd/PFNnfqrkMyTPNWqL99oNEwIb6KTkrkkWNcb//gQk2n1HkkQwMaFg==" NoCertificadoSAT="00001000000407612027" SelloSAT="CXgQX8/wn9y4aA/N+k7SthIp0xuOxB8rCveNayRbiUbHG48Co6VTdbf1Ze1Tvhmm8iyX6Woq7bmmk9zm2YvFkZO1duLw21A3HCHv9pmD95YNqib6VTUxPknSZxjjdEur3ZRrYhBP1gt0BpBiNGmczciwh35wDvypJ3Fqy3Ci2k2tt/o8Iv5wah6Bl0gzXeydG57EFqVQhTqjrWArIvmAJojRe117ARBLiJRnH/HVXl+ciL3oBN78mGRmrvo3Vjdb532+7NQNnFugwfPlNC2nbssRYQD9ctR4Qqfb+HMv39rcPZUN94eqBQAfCEAh2Dq/ACXti4YNBf4wACDmffvZdg==" xsi:schemaLocation="http://www.sat.gob.mx/TimbreFiscalDigital http://www.sat.gob.mx/sitio_internet/cfd/timbrefiscaldigital/TimbreFiscalDigitalv11.xsd" xmlns:tfd="http://www.sat.gob.mx/TimbreFiscalDigital" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"/></cfdi:Complemento></cfdi:Comprobante>' 
   where id=37408
   
%update account_invoice set l10n_mx_report_name=null where id=33561

%%% remove fiscal files
%update account_invoice set cfdi_uuid='', l10n_mx_report_name='', xml_signed='' where id=33561

%%% setting folio
select id, reference from account_invoice where id=31122
%update account_invoice set reference='583551' where id=31122

%%% export Project by invoice
select ai.number, ai.account_analytic_tag_id, aat.name
from account_invoice ai
join account_analytic_tag aat on aat.id=ai.account_analytic_tag_id
where company_id=1 and ai.date>='2018-11-01' and ai.state not in ('cancel','draft')

%%% set account_invoice header: Analytic_account, Project;  lines: Project
select id, move_name, account_analytic_id, account_analytic_tag_id from account_invoice where id in (39571,39786,39482,39784,39945,39783,39787,40071,40070)
%update account_invoice set account_analytic_id=32 where id in (39571,39786,39482,39784,39945,39783,39787,40071,40070) *** PSP=32
%update account_invoice set account_analytic_id=4, account_analytic_tag_id=949 where id in (31270,32986)
%update account_invoice set account_analytic_tag_id=949 where id in (35563,32499,32678,32850,34205,32986,34091,33624)
select id, invoice_id, name, account_analytic_id from account_invoice_line where invoice_id in (35563,32499,32678,32850,34205,32986,34091,33624)
select account_invoice_line_id, account_analytic_tag_id from account_analytic_tag_account_invoice_line_rel where account_invoice_line_id in (61179,61178,61889,62364,62363,62660,64532,65473,65790,65789,69427)
%insert into account_analytic_tag_account_invoice_line_rel (account_invoice_line_id, account_analytic_tag_id)
   values (61179,949),(61178,949),(61889,949),(62364,949),(62363,949),(64532,949),(65473,949),(65790,949),(65789,949),(69427,949)
% deletes NoDefinido(Proyecto) (29)
%delete from account_analytic_tag_account_invoice_line_rel 
   where account_analytic_tag_id=29 and account_invoice_line_id in (61179,61178,61889,62364,62363,62660,64532,65473,65790,65789,69427)
   
%%% set date_invoice header   
select move_name, date_invoice from Account_invoice where id=19854
%update account_invoice set date_invoice='2018-01-29' where id=19854
select * from Account_invoice where id=19854

%%% set account_invoice_line: account_id
select * from account_invoice_line where invoice_id=40161
%update account_invoice_line set account_id=3879 where invoice_id=40161    3879=Devol16%

