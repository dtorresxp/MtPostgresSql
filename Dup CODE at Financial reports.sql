lista de codes c ese id
SELECT * FROM account_financial_html_report_line WHERE code IN ( 'PASCIRADC');

en que formaulas se usa ese codigo:
SELECT * FROM account_financial_html_report_line WHERE formulas ILIKE '%PASCIRADC.%';

lista de codes duplicados:
SELECT id, code FROM account_financial_html_report_line ou 
WHERE (SELECT COUNT(*) from account_financial_html_report_line inr WHERE inr.code = ou.code) > 1
ORDER BY CODE;
SELECT * FROM account_financial_html_report_line ou 
WHERE (SELECT COUNT(*) from account_financial_html_report_line inr WHERE inr.code = ou.code) > 1
ORDER BY CODE;