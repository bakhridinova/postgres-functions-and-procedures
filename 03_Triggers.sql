-- create a new table for logging price updates
drop table if exists price_update_log;

create table price_update_log (
    product_id int,
    old_price numeric,
    new_price numeric,
    update_time timestamp default current_timestamp
);

-- trigger function to log price updates
create or replace function log_price_update() returns trigger as $$
begin
    if new.unitprice <> old.unitprice then
        insert into price_update_log (product_id, old_price, new_price)
        values (old.productid, old.unitprice, new.unitprice);
    end if;
    return new;
exception
    when others then
        raise exception 'Error logging price update: %', sqlerrm;
end;
$$ language plpgsql;

-- create the trigger
create or replace trigger trigger_price_update
    before update of unitprice on products
    for each row
execute function log_price_update();

-- test
update products set unitprice = 25 where productid = 11;
update products set unitprice = 30 where productid = 5;
update products set unitprice = 20 where productid = 15;

-- see price_update_log.csv file for results