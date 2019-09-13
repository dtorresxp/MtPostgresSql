% Set picking_type_id = 1 para poner entrega en CJS en vez de Dropship
select * from purchase_order where id in (10006)
update purchase_order set picking_type_id=1 where id=10006

% updates Projects at Purchase Order and PO line models
select id, name, account_analytic_tag_id from purchase_order  where id in (9558,9534,9514,9510,9409,9530,9430)
%update purchase_order set account_analytic_tag_id=949 where id in (9558,9534,9514,9510,9409,9530,9430)

% updates Origin at Purchase Order 
select id, name, account_analytic_tag_id from purchase_order  where id in (12763)
%update purchase_order set origin='SO05409' where id in (12763)


