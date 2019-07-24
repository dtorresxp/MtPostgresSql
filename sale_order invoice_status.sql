select name, state, invoice_status state from sale_order where id in (146)
% state = sale, done, sent, draft, cancel
% update sale_order set invoice_status='invoiced', state='done' where id in (146)


