***drop foreign data wrapper fdw_local_mtnmx100;
***create foreign data wrapper fdw_local_mtnmx100;

drop extension postgres_fdw;
create extension postgres_fdw;

drop server srv_local_mtnmx;
create server srv_local_mtnmx foreign data wrapper postgres_fdw
   options (host '172.18.2.19', port '5433', dbname 'mtnmx100'); 

drop user mapping for cubos server srv_local_mtnmx;
create user mapping for cubos server srv_local_mtnmx 
   options (user 'cubos', password 'cubos')

drop foreign table fgn_account_account ;
create foreign table if not exists fgn_account_account (
   name character varying,   currency_id integer,   code character varying,
   deprecated boolean,   user_type_id integer,   internal_type character varying,
   internal_group character varying,   last_time_entries_checked timestamp without time zone,
   reconcile boolean,   note text,   company_id integer,   group_id integer,
   create_uid integer,   create_date timestamp without time zone,   write_uid integer,
   write_date timestamp without time zone
) server srv_local_mtnmx options (schema_name 'public', table_name 'account_account');

select * from fgn_account_account;

create view v_account_account as
   select * from fgn_account_account;

select * from v_account_account;

